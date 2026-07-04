# Review Ilmiah Naskah Proposal Tesis MSc
**Judul (tentatif):** Kuantifikasi Unsur Tanah Vulkanik Berbasis LIBS Menggunakan Arsitektur CNN–Transformer Encoder–Decoder dengan Cross-Attention
**Cakupan review:** bab1.tex, bab2.tex, bab3.tex, bab4.tex, bab5.tex
**Posisi reviewer:** spektroskopi plasma/LIBS + arsitektur deep learning berbasis Transformer

---

## RINGKASAN EKSEKUTIF

Proposal ini berdiri di atas ide kebaruan yang jelas dan dapat dipertahankan dalam bentuk yang dipersempit dengan tepat (dekomposisi struktural mono→poli via cross-attention encoder–decoder), serta ditopang Bab II yang kuat secara literatur. Namun terdapat tiga masalah substansial yang harus diselesaikan sebelum seminar: (1) validitas asumsi linearitas `S_poly = Σ c_z S_mono` di bawah LTE belum dipertahankan secara eksplisit dan berkonflik dengan pengakuan tesis sendiri tentang self-absorption; (2) rentang komposisi simulasi Bab III tidak menutup massa (jumlah dapat melebihi 100% dan mengabaikan oksigen) serta tampak disampel independen, bukan pada simpleks; dan (3) ukuran sampel eksperimen (24) dengan desain 4×3 yang tidak menjumlah 24 menimbulkan masalah statistik sekaligus inkonsistensi aritmetik. Penilaian keseluruhan: **perlu revisi mayor pada Bab III**, sementara Bab I–II siap dengan revisi minor.

---

## PENILAIAN PER DIMENSI

### 1. Kebaruan dan Posisi Penelitian — **Memadai (cenderung Kuat setelah dipersempit)**

Klaim novelty di §2.7.3 sudah dirumuskan secara hati-hati dan **dapat dipertahankan**: bukan "Transformer untuk LIBS" (diakui sudah ada pada Liu 2026 dan Walidain 2026), bukan "pelatihan sintetis-fisika" (diakui sudah ada pada Walidain 2026 dan Favre 2025), melainkan operasionalisasi dekomposisi struktural mono/poliatomik melalui cross-attention encoder–decoder dengan bobot attention bermakna fisis. Blok consensus internal di §2.7.3 menunjukkan klaim sudah melewati uji devil's advocate. Tabel perbandingan (`tab:perbandingan_penelitian`) representatif untuk keempat kompetitor inti.

Catatan kritis:
- **Potensi overclaim pada interpretabilitas.** §2.6.6 dan §2.7.3 menyatakan bobot cross-attention "merepresentasikan proksi koefisien konsentrasi c_z". Ini terlalu kuat. Bobot attention adalah distribusi ter-softmax per posisi query (per panjang gelombang) atas key, bukan skalar global per unsur. Memetakannya ke c_z memerlukan agregasi dan asumsi tambahan yang belum diformalkan. Penguji deep learning akan menanyakan ini. Disarankan menurunkan klaim menjadi "indikator kualitatif kontribusi spektral per unsur", bukan "proksi c_z".
- **Underclaim yang belum dieksploitasi.** Keunggulan paling membedakan dari Favre (2025) sebenarnya adalah *interpretabilitas yang tertanam dalam arsitektur* (bukan post-hoc seperti integrated gradients). Ini disinggung tetapi tidak ditonjolkan sebagai jualan utama; sebaiknya diangkat lebih eksplisit di §1.1 dan abstrak.
- Tabel hanya memuat 4 kompetitor. Untuk pertahanan yang kokoh, pertimbangkan menambah satu baris kelas "spectral unmixing / NMF klasik" (dekomposisi linear non-DL) agar penguji tidak menuduh bahwa dekomposisi linear bukan hal baru di luar kerangka DL.

### 2. Konsistensi Internal Lintas Bab — **Perlu Perbaikan**

Hal yang konsisten: jumlah unsur (7: Si, Al, Fe, Ca, Mg, Na, K) seragam di semua bab; jumlah baseline (4) konsisten antara Bab III intro dan §Tahap 4; nama "Seulawah Agam" konsisten di Bab II/III/V.

Inkonsistensi konkret yang ditemukan:
- **Nama gunung di Bab I.** Bab I (Tujuan §1.3 poin 3, Hipotesis §1.5) hanya menyebut "tanah vulkanik Aceh", sedangkan Bab II/III/V spesifik "Gunung Seulawah Agam". Samakan—sebut Seulawah Agam sejak Bab I.
- **Operator target performa.** Bab II §2.6 dan Bab III §Analisis Data menulis `R² ≥ 0,95`, sedangkan Bab V §Kesimpulan menulis `R² > 0,95`. Seragamkan menjadi `≥`.
- **Aritmetika desain sampel.** Bab III poin (§Tahap 2 butir 2) menyatakan "24 sampel ... dari empat arah ... pada tiga kedalaman". 4 × 3 = **12**, bukan 24. Faktor pengali 2 (ulangan? dua titik radial? dua transek?) tidak dijelaskan. Ini inkonsistensi aritmetik yang pasti ditanya penguji.
- **Output head vs fungsi kerugian.** Bab III butir (langkah arsitektur) menyatakan output head memprediksi tiga hal: konsentrasi, rekonstruksi spektrum, **dan parameter plasma**. Namun Persamaan 3.1 (`eq:bab3_loss`) hanya memuat dua suku (MSE konsentrasi + rekonstruksi). Tidak ada suku galat parameter plasma. Either loss harus ditambah suku ($T_e$, $n_e$), atau klaim output head parameter plasma dicabut. Inkonsistensi internal yang serius.
- **Notasi densitas elektron.** Bab IV memakai `N_e`; bab lain memakai `n_e`. Seragamkan.

### 3. Ketepatan Fisika Plasma — **Perlu Perbaikan**

Yang sudah benar:
- McWhirter (§2.2.4, Pers. 2.5) dinyatakan **tepat** sebagai *syarat perlu tetapi tidak cukup*, dilengkapi catatan stasionaritas dan homogenitas, dan koefisien $1{,}6\times10^{12}$ dengan $\Delta E$ dalam eV sudah benar.
- Saha (Pers. 2.6) dan Boltzmann (Pers. 2.4) ditulis dengan notasi dan faktor degenerasi yang benar; faktor 2 dan $(2\pi m_e k_B T/h^2)^{3/2}$ pada Saha benar.
- Profil Voigt (§2.4.5) — meski kata "superposisi" kurang tepat, teks mengoreksi diri dengan menyatakan "konvolusi" profil Gaussian dan Lorentzian; secara substansi **benar** (Voigt = konvolusi, bukan jumlah). Disarankan ganti kata "superposisi" → "kombinasi melalui konvolusi" agar tidak ambigu.

Masalah yang harus dijawab:
- **Validitas linearitas `S_poly = Σ c_z S_mono` (Pers. 2.10) — ini titik paling rawan.** Persamaan ini hanya valid jika plasma **optically thin** dan setiap $S_{mono}^{(z)}$ dievaluasi pada $T_e, n_e$ **yang sama** dengan campuran. Dua konflik: (a) tesis berulang kali menekankan self-absorption sebagai tantangan (§1.1, §2.4.2, dan menyebut MERLIN memodelkan self-absorption), padahal dekomposisi linear justru *mengasumsikan ketiadaan* self-absorption; (b) di bawah Saha, $n_e$ ditentukan oleh seluruh spesies terionisasi, sehingga $S_{mono}^{(z)}$ satu unsur **tidak independen** dari unsur lain dalam campuran—basis monoatomik bergeser ketika komposisi berubah. Tesis harus menyatakan secara eksplisit asumsi optically-thin + parameter plasma bersama, dan membatasi klaim pada rezim tersebut.
- **Rentang $n_e$ (10¹⁶–10¹⁷ cm⁻³) berpotensi melanggar McWhirter pada batas bawah.** Untuk transisi dengan $\Delta E \approx 4$ eV pada $T_e \approx 10^4$ K, ambang McWhirter $\approx 1\times10^{16}$ cm⁻³. Batas bawah 10¹⁶ cm⁻³ berada tepat di ambang—untuk $\Delta E$ lebih besar, sebagian grid sintetis akan melanggar syarat LTE yang menjadi dasar forward model. Selain itu batas atas 10¹⁷ cm⁻³ relatif rendah; Manelski (2024) yang Anda sitasi sendiri melaporkan ~0,7–1,1×10¹⁷ cm⁻³ untuk tanah. Justifikasi rentang dengan sitasi, dan saring grid agar memenuhi McWhirter.
- **Rentang $T_e$ (6.000–15.000 K) realistis** untuk LIBS matriks geologi—tidak ada keberatan.

### 4. Ketepatan Arsitektur Deep Learning — **Perlu Perbaikan**

- **Konsistensi arsitektur ↔ fisika sudah baik secara naratif:** encoder memproses $S_{mono}$, decoder query dari $S_{poly}$, cross-attention mencocokkan—selaras dengan Pers. 2.10. Namun lihat keberatan linearitas di Dimensi 3; jika basis monoatomik tidak stabil terhadap komposisi, premis arsitektur ikut goyah.
- **Loss (Pers. 3.1) tidak lengkap** terhadap output head yang dideklarasikan (lihat Dimensi 2). Tambahkan suku parameter plasma atau cabut head-nya.
- **Loss domain (Pers. 3.2) `L_total = L_prediksi − λ L_domain`.** Formulasi tanda-minus ini adalah objektif saddle DANN (Ganin 2016) dan secara konseptual bisa diterima, tetapi: (a) hubungan `L_prediksi` dengan Pers. 3.1 tidak dinyatakan; (b) konvensi GRL sebaiknya dijelaskan—gradien dibalik pada feature extractor sehingga encoder *memaksimalkan* loss domain. Tanpa penjelasan ini, penulisan tanda minus rawan dipertanyakan.
- **Bobot rekonstruksi $\alpha$ di-set "—" (nihil) saat fine-tuning** (Tabel param_pelatihan). Artinya, justru pada tahap penyesuaian ke data nyata, jangkar fisika (rekonstruksi spektrum) dilepas. Ini melemahkan klaim interpretabilitas-tertanam pada domain target. Pertimbangkan mempertahankan $\alpha>0$ kecil saat fine-tuning.
- **24 sampel + 5-fold CV secara statistik sangat lemah** untuk regresi 7 keluaran. Per fold hanya ~5 sampel uji; estimasi $R^2$ per unsur akan bervariansi sangat tinggi dan rapuh terhadap pemilihan fold. Untuk tesis MSc ini bisa diterima sebagai *proof-of-concept*, tetapi target `R² ≥ 0,95` pada n=24 nyaris pasti akan dipertanyakan reliabilitasnya. Pertimbangkan: leave-one-out CV, pelaporan interval kepercayaan, augmentasi pada level spektrum (bukan sampel), atau menambah jumlah titik spektrum per sampel (saat ini hanya 3 tembakan di-average → pertimbangkan menyimpan tembakan individual sebagai replika).

### 5. Metodologi dan Rancangan Eksperimen — **Perlu Perbaikan**

- **Mass closure komposisi simulasi bermasalah (kritis).** Tabel `tab:komposisi_elemen`: Si 40–60, Al 10–20, Fe 5–15, Ca 3–10, Mg 2–8, Na 1–5, K 1–5 (% berat). Jumlah maksimum = **123%** (> 100%), dan **oksigen tidak disertakan** padahal ~45% massa tanah silikat adalah O. Jika `metode sampling = uniform random` per unsur secara independen, vektor komposisi tidak membentuk simpleks (tidak menjumlah ke 1/100%). Favre (2025) yang Anda jadikan rujukan justru memakai ruang Dirichlet persis untuk alasan ini. Selain itu, XRF melaporkan oksida (SiO₂, Al₂O₃, …), sedangkan model memprediksi unsur—konversi basis oksida↔elemental belum dijelaskan. Ini harus diperbaiki sebelum seminar: sampling pada simpleks (Dirichlet), sertakan O, dan jelaskan basis (elemental vs oksida).
- **Justifikasi desain sampling (4 arah × 3 kedalaman) lemah** dan tidak menjumlah 24 (lihat Dimensi 2). Tambahkan justifikasi geostatistik dan perbaiki aritmetika.
- **Angka pelatihan tanpa justifikasi.** Pre-train 200 epoch, fine-tune 50 epoch, kernel 7/5/3, $d=128$, $h=8$, 4+4 lapisan—semua tampak ad hoc tanpa sitasi/studi ablasi. Penguji akan menanyakan dasar pemilihan. Minimal nyatakan akan ditentukan via validasi/ablasi.
- **Baseline cukup representatif** (PLS, CNN-only, Transformer-only, Informer). Saran penambahan: (a) CF-LIBS klasik sebagai baseline fisika (karena tesis memosisikan diri terhadap CF-LIBS), dan (b) PLSR yang merupakan standar emas kuantifikasi LIBS multivariat—pastikan PLS di sini adalah PLSR.
- **Robustness benchmark (Bab IV Stage 1) terhubung ke augmentasi (Bab III Tahap 1), tetapi pelaporannya kualitatif.** Bab IV mengklaim "severity threshold" dan "global damage score" kuantitatif (cosine similarity, kategori safe/moderate/hard 90%/70%) namun tidak menyajikan satu pun angka atau tabel—hanya heatmap dan deskripsi naratif ("menurun tajam", "dampak minor"). Untuk dapat dipertahankan, sertakan tabel kuantitatif damage score dan ambang per perturbasi. Saat ini Stage 1 terkesan setengah-hasil setengah-rancangan.

### 6. Kualitas Penulisan Akademik — **Memadai**

- Mayoritas paragraf (khususnya §2.1 dan §2.7 yang sudah direvisi) mengikuti satu-ide-pokok dengan baik.
- **Komentar audit masih tertinggal di naskah:** blok `% [IDE POKOK]`, `% [PERLU BUKTI]` (§2.1.3), dan `% === CONSENSUS ANALYSIS ===` (§2.7.3). Meski berupa komentar LaTeX (tidak ter-render), semua ini **wajib dihapus** sebelum berkas final dikirim ke penguji.
- **Terminologi "monoatomik/poliatomik" berisiko.** Dalam fisika, "monoatomic/polyatomic" merujuk pada molekularitas (jumlah atom dalam molekul), bukan jumlah unsur. Yang Anda maksud adalah spektrum *unsur-tunggal* vs *multi-unsur*. Penguji spektroskopi kemungkinan besar mengoreksi ini. Pertimbangkan istilah "spektrum unsur-tunggal" dan "spektrum multi-unsur (campuran)", atau definisikan istilah Anda secara eksplisit di awal dan konsisten.
- Penggunaan $T_i$ pada Doppler (Pers. 2.7) vs $T_e$ di tempat lain: di bawah LTE $T_e=T_i=T$; nyatakan kesetaraan ini saat memperkenalkan $T_i$.
- Tidak ada lagi flag `% [PERLU SITASI]` aktif (keempatnya telah diselesaikan pada revisi sebelumnya).

### 7. Kesiapan untuk Seminar Proposal — **Perlu Revisi Mayor**

Mayor terkonsentrasi di Bab III (komposisi/mass-closure, sampling, loss). Bab I–II hampir siap. Bab IV perlu pemisahan tegas antara hasil dan rancangan, plus angka kuantitatif.

---

## PERTANYAAN PENGUJI YANG DIPREDIKSI
(urut dari paling mungkin ke paling tajam)

1. **"Komposisi unsur Anda di Tabel 3.x bisa berjumlah lebih dari 100% dan tidak memuat oksigen. Bagaimana ini bisa merepresentasikan tanah nyata, dan bagaimana Anda menyampel vektor konsentrasi—independen atau pada simpleks?"** (paling mungkin; jawaban harus: pindah ke Dirichlet, sertakan O, jelaskan basis oksida vs elemental)

2. **"Persamaan dekomposisi linear S_poly = Σ c_z S_mono mengasumsikan plasma optically thin, padahal Anda sendiri menekankan self-absorption sebagai tantangan utama. Bukankah ini kontradiksi? Pada kondisi apa persamaan Anda valid?"** (paling tajam secara fisika)

3. **"Dengan hanya 24 sampel dan 5-fold CV, atas dasar apa target R² ≥ 0,95 realistis dan reliabel? Berapa lebar interval kepercayaannya?"** (statistik; nyaris pasti ditanya)

4. **"Bobot cross-attention Anda klaim sebagai proksi koefisien konsentrasi. Attention ter-softmax per posisi—bagaimana tepatnya Anda mengubahnya menjadi satu nilai c_z per unsur, dan apa jaminannya bernilai fisis, bukan artefak pelatihan?"** (deep learning + fisika)

5. **"Output head Anda menyebut prediksi parameter plasma, tetapi fungsi kerugian (Pers. 3.1) tidak memuat suku tersebut. Mana yang benar?"** (konsistensi; mudah diverifikasi penguji dari naskah)

6. **"Rentang n_e batas bawah 10¹⁶ cm⁻³—apakah seluruh grid sintetis Anda memenuhi kriteria McWhirter yang Anda kutip sendiri?"** (fisika, menusuk karena memakai kriteria tesis sendiri)

7. **"Mengapa 4 arah × 3 kedalaman menghasilkan 24, bukan 12? Dan apa justifikasi geostatistik desain ini untuk menangkap heterogenitas yang Anda klaim?"**

8. **"Bab IV mengklaim severity threshold dan damage score kuantitatif tetapi hanya menampilkan heatmap. Mana angkanya?"**

### Pertanyaan tersulit dan saran menghadapinya
Pertanyaan **#2 (linearitas vs self-absorption)** adalah yang paling sulit karena menyentuh fondasi fisika kebaruan. Saran: jangan bertahan bahwa persamaan selalu berlaku. Akui secara terbuka bahwa dekomposisi linear adalah aproksimasi rezim optically-thin LTE, posisikan model DL justru sebagai mekanisme yang *mempelajari koreksi* terhadap deviasi linearitas (termasuk self-absorption ringan) lewat fine-tuning + domain adaptation pada data nyata, dan tegaskan bahwa basis monoatomik dibangkitkan pada pasangan $T_e, n_e$ bersama dengan campurannya. Dengan begitu kelemahan diubah menjadi justifikasi keberadaan komponen DL.

---

## REKOMENDASI FINAL

### Wajib sebelum seminar
- Perbaiki Tabel komposisi simulasi: sampling pada simpleks (Dirichlet), sertakan oksigen, dan jelaskan basis elemental vs oksida XRF beserta konversinya.
- Nyatakan secara eksplisit asumsi optically-thin + parameter plasma bersama yang mendasari Pers. 2.10; selaraskan dengan pembahasan self-absorption.
- Selesaikan inkonsistensi loss vs output head (Pers. 3.1): tambah suku parameter plasma atau cabut head-nya.
- Perbaiki aritmetika desain sampel (4×3≠24) dan beri justifikasi desain.
- Hapus seluruh komentar audit tertinggal (`% [IDE POKOK]`, `% [PERLU BUKTI]`, blok `% === CONSENSUS ANALYSIS ===`).
- Saring grid $n_e$ agar memenuhi McWhirter; beri sitasi rentang $T_e, n_e$.

### Sebaiknya diperbaiki (tidak kritis)
- Turunkan klaim "attention = proksi c_z" menjadi indikator kualitatif, atau formalkan agregasinya.
- Samakan nama gunung sejak Bab I; seragamkan `≥` vs `>` dan `n_e` vs `N_e`.
- Pertimbangkan istilah "unsur-tunggal/multi-unsur" menggantikan "monoatomik/poliatomik", atau definisikan eksplisit.
- Sajikan tabel kuantitatif damage score di Bab IV; pisahkan tegas "hasil" vs "rancangan".
- Pertahankan $\alpha>0$ kecil saat fine-tuning; jelaskan konvensi GRL pada Pers. 3.2.
- Tambah baseline CF-LIBS/PLSR dan pertimbangkan baris pembanding spectral-unmixing klasik di Tabel 2.7.
- Justifikasi (atau nyatakan akan diablasi) hyperparameter dan jumlah epoch.

### Kesiapan: **Perlu revisi mayor** (terfokus pada Bab III; Bab I–II siap dengan revisi minor)

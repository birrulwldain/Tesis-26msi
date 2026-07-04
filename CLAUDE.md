# CLAUDE.md

This file provides guidance when working with this repository. Keep it current — update it after any session that changes the manuscript state.

---

## What this repo is

Naskah tesis Magister Fisika (S2) FMIPA Universitas Syiah Kuala.

- **Penulis**: Birrul Walidain (`birrulwldain@gmail.com`)
- **Promotor**: Prof. Dr. Eng. Nasrullah Idris
- **Co-supervisor**: Dr. Khairun Saddami
- **Target sidang**: September 2026

**Judul (resmi, di `thesis.tex`)**: *Kuantifikasi Unsur Tanah Vulkanik Menggunakan LIBS Berbasis Dekomposisi Spektral Multiunsur dengan CNN–Transformer Encoder–Decoder* (EN: *...Based on Multi-Element Spectral Decomposition Using a CNN–Transformer Encoder–Decoder*) — direvisi Juli 2026 dalam dua tahap: (1) "Mono-Poliatomik" → "Dekomposisi Spektral Multiunsur" (lihat catatan terminologi di bawah), lalu (2) "dengan Deep Learning" → "dengan CNN–Transformer Encoder–Decoder", karena kebaruan yang benar-benar defensible ada di arsitektur (encoder–decoder + cross-attention), bukan di dekomposisi LMM itu sendiri (sudah ada presedennya di Konstantinidis 2019 dan Wang 2014). Metadata PDF internal (`\title{}`, baris ~169) juga sudah disinkronkan agar sama persis dengan `\judul`. **Perhatian**: judul lama mungkin masih tercetak di dokumen yang sudah diserahkan sebelumnya (mis. draft proposal PDF di root repo) — cek konsistensi dengan pembimbing/SIMATA sebelum submission berikutnya.

**Inti kontribusi**: Arsitektur CNN–Transformer *encoder–decoder* dengan *cross-attention* untuk kuantifikasi multi-unsur LIBS pada tanah vulkanik Seulawah Agam, NAD. Encoder memproses spektrum unsur tunggal per unsur (key–value); decoder memproses spektrum campuran (query); bobot *cross-attention* merupakan proksi koefisien konsentrasi $c_z$ dalam persamaan dekomposisi $S_\text{poly}(\lambda) = \sum_z c_z S_\text{mono}^{(z)}(\lambda)$.

Konten substantif tesis ada di `include/`. Semua file lain (`lib/`, `style/`, `language/`, build scripts) adalah mesin template — jangan diubah kecuali ada masalah kompilasi.

### Catatan terminologi (Juli 2026)

Istilah "spektrum monoatomik"/"spektrum poliatomik" ternyata **bukan istilah baku** dari 4 paper acuan inti (Favre MERLIN, Favre CF-LIBS ML, Liu TransCNN, Walidain Informer) — dicek langsung dari teks lengkap PDF. Favre MERLIN memang memakai kata "monatomic mixture", tapi dalam arti berbeda (plasma berspesies atom tunggal, lawan "polyatomic molecule", bukan "spektrum satu unsur"). Berdasarkan pencarian Consensus, istilah baku di literatur LIBS/spectral-unmixing untuk konsep ini adalah **"single-element/elemental spectrum"** vs **"mixture spectrum"**, dalam kerangka **Linear Mixing Model (LMM)** — dipakai langsung pada LIBS oleh \citet{konstantinidis_application_2019} (ChemCam/Mars) dan \citet{wang_novel_2014} (spectral unmixing tanah).

Sudah diterapkan ke seluruh `include/*.tex` (9 file: abstrak-indonesia, bab1, bab1ai, bab2, bab2ai, bab3, bab3ai, bab4, bab5): **"monoatomik" → "unsur tunggal"**, **"poliatomik" → "campuran"**. Dua entri bib baru ditambahkan (`konstantinidis_application_2019`, `wang_novel_2014`) dan disitasi di §2.3.6 sebagai landasan framing LMM. Judul resmi di `thesis.tex` (`\judulcover`, `\judul`, `\judulinggris`) juga sudah direvisi ke "Dekomposisi Spektral Multiunsur" / "Multi-Element Spectral Decomposition" (dipilih oleh penulis di antara beberapa opsi, menghindari bentuk hyphenated "Unsur Tunggal–Campuran" yang dirasa janggal dalam bahasa Indonesia). `perencanaan-riset/T1_outline_tesis.md` juga sudah disinkronkan.

---

## Build commands

Requires XeLaTeX + biber (`brew install --cask mactex-no-gui` on macOS, or `apt install texlive-xetex biber` on Linux).

```bash
./build-thesis.sh sempro    # compile Seminar Proposal mode -> sempro.pdf (Bab 1-3)
./build-thesis.sh semhas    # compile Seminar Hasil mode -> semhas.pdf (Bab 1-5 + Lampiran)
./build-thesis.sh sidang    # compile Sidang Skripsi mode -> sidang.pdf (Bab 1-5 + Lampiran)
./build-thesis.sh all       # compile all three modes
./build-thesis.sh clean     # remove aux/log/toc/etc. for all three job names
./build-thesis.sh watch     # latexmk -pvc auto-recompile (always uses sidang mode)
./clean.sh                  # recursively delete LaTeX temp files repo-wide
./prepare-submission.sh     # full submission build including nomenclature (makeindex) step
```

Manual compile (masing-masing mode butuh 3 pass XeLaTeX + biber):

```bash
xelatex thesis && biber thesis && xelatex thesis && xelatex thesis
```

Jika `\nomenclature{}{}` digunakan (lihat `include/simbol.tex`), tambahkan langkah:

```bash
makeindex thesis.nlo -s nomencl.ist -o thesis.nls
```

**Sandbox Linux**: gunakan `xelatex` (bukan `pdflatex`) — thesis pakai fontspec/XeTeX. Font Arial tidak tersedia di sandbox, sehingga kompilasi di sandbox akan gagal dengan `! I can't find file 'Arial'`. Ini normal — kompilasi penuh hanya di mesin lokal dengan MacTeX.

**Important gotcha**: `thesis.tex` baris ~29 hardcode `\def\thesismode{sempro}`. Jika tiga mode menghasilkan output identik, periksa baris ini.

**Bug yang sudah diperbaiki (Juli 2026)**: ada karakter "2" nyasar sendirian di `thesis.tex` (bekas baris ~273, sebelum `\enableboldchapterintoc`) yang tercetak sebagai halaman kosong berisi "2" tepat sebelum BAB I — sudah dihapus. Setelah fix ini + penambahan entri bib baru, PDF **harus di-compile ulang bersih** (`./build-thesis.sh clean` lalu rebuild) — jangan percaya PDF lama yang sudah ada di root repo tanpa recompile, karena beberapa kali ditemukan PDF stale yang tidak merefleksikan `include/*.tex` terkini (mis. TOC sempat menunjukkan nomor halaman yang salah untuk BAB III sebelum di-refresh).

**Proposal resmi yang sudah disahkan berbeda dari draft ini**: `Birrul-Walidain-250820201100015-draft-proposal-rev-1.pdf` di root repo (tertanggal 15 Nov 2025, sudah ditandatangani Pembimbing I/II + Koorprodi) memakai **judul dan struktur Bab II/III yang jauh lebih ringkas** dari `include/*.tex` saat ini — judul lama: "Pengembangan Model CNN–Transformer Berbasis Fisika untuk Analisis Kuantitatif LIBS pada Tanah Vulkanik"; Bab II proposal lama cuma 4 seksi (bukan 7). Draft saat ini sudah berkembang signifikan melampaui cakupan yang disetujui sempro — perlu didiskusikan eksplisit ke pembimbing sebelum semhas supaya perubahan judul & ekspansi struktur tercatat sebagai revisi resmi.

---

## Architecture: single-file, multi-mode template

`thesis.tex` adalah entry point tunggal untuk semua tiga deliverable (sempro/semhas/sidang). Chapter dan front-matter dibagi ke file-file di `include/` dan di-`\input{...}`.

- **SEMPRO**: hanya `bab1`–`bab3`
- **SEMHAS/SIDANG**: `bab1`–`bab5` + `lampiran`

Bibliography: `daftar-pustaka.bib` via biblatex + biber backend. PDF sumber referensi ada di `daftar-pustaka/`. File `.bst` di `style/` adalah legacy — tidak dipakai.

---

## Fisika inti (penting untuk konsistensi antar bab)

### Model dekomposisi spektral (Eq. 2.10 / inti tesis)
```
S_poly(λ) = Σ_z  c_z · S_mono^(z)(λ)
```
**Valid hanya di bawah asumsi**: plasma *optically thin* + LTE dengan parameter plasma bersama ($T_e$, $n_e$). Pada kondisi *self-absorption* partial, model DL diharapkan mempelajari koreksi residual. Kalimat validity domain ini **sudah ada eksplisit di akhir §2.3.6** (ditambahkan Juli 2026).

### Saha–Boltzmann forward model
Spektrum sintetis dibangkitkan dari parameter ($T_e$, $n_e$) + data atomik NIST ASD via:
1. Distribusi Boltzmann → populasi level eksitasi
2. Persamaan Saha → keseimbangan ionisasi
3. Koefisien Einstein → intensitas emisi
4. Profil Voigt (Doppler + Stark) → bentuk garis

### Kriteria McWhirter (Eq. 2.5)
```
n_e ≥ 1.6×10¹² · T_e^(1/2) · (ΔE)³  cm⁻³
```
Syarat **perlu tapi tidak cukup** untuk LTE — harus dilengkapi verifikasi stasionaritas dan homogenitas.

### Domain Adaptation via GRL
Gradient Reversal Layer (Ganin et al. 2016) menjembatani gap sintetis→eksperimental. Encoder dipaksa mengekstrak fitur *domain-invariant*.

---

## Status per bab (diperbarui Juli 2026 — diverifikasi ulang terhadap `include/*.tex` saat ini)

### Bab I — Pendahuluan
Status: **hampir siap**. Catatan: referensi Wang et al. 2024 di Bab I sempat dideskripsikan tidak akurat sebagai "wavelet-Transformer-CNN" — seharusnya "ML klasik (DT/SVM/GPR/NN) untuk prediksi temperatur plasma Cu". Periksa dan koreksi sebelum sidang.

### Bab II — Tinjauan Kepustakaan
Status: **kuat — seluruh isu kritis Bab II sudah diperbaiki (Juli 2026)**. Tersisa 1 gambar prioritas (spektrum unsur tunggal + superposisi §2.3.6, idealnya dari simulator).

**8 gambar raster terpasang** (semua di `images/bab2/`):
| Label | File | Seksi |
|-------|------|-------|
| `fig:bab2_libs_setup` | `favre2025_fig7_libs_setup.png` | §2.2.1 |
| `fig:bab2_timeresolved` | `wang2024_fig2_timeresolved.png` | §2.2.2 |
| `fig:bab2_te_ne_delay` | `manelski2024_fig8_te_ne_delay.png` | §2.2.4 |
| `fig:bab2_informer` | `walidain2026_fig1_informer.png` | §2.5.3 |
| `fig:bab2_peakmatch` | `walidain2026_fig2_peakmatch.png` | §2.6.2 |
| `fig:bab2_boltzmannplot` | `wang2024_fig4_boltzmann.png` | §2.6.4 |
| `fig:bab2_transcnn` | `liu2026_fig3_transcnn.png` | §2.7.2 |
| `fig:bab2_merlin_spectra` | `favre2025_fig16_spectra_expvsmerlin.png` | §2.7.1 |

**3 diagram TikZ orisinal terpasang (ditambahkan Juli 2026, langsung sebagai kode TikZ di `bab2.tex`):**
| Label | Isi | Seksi |
|-------|-----|-------|
| `fig:bab2_libs_setup_tesis` | Skema setup eksperimen tesis ini (Nd:YAG 1064 nm/114 mJ → sampel tanah vulkanik atmosfer terbuka → Echelle + OMA), kontras eksplisit dengan Gambar 2.1 (rig Ar-chamber Favre) | §2.2.1 (setelah Gambar 2.1) |
| `fig:bab2_crossattention_konsep` | Diagram konseptual cross-attention: 7 kotak unsur → Encoder (K,V); spektrum campuran → Decoder (Q); output bar chart $c_z$ ilustratif | §2.5.5 (setelah Eq. cross-attention) |
| `fig:bab2_lmm_vs_ca` | Perbandingan unmixing klasik (solver linier/NNLS) vs pendekatan tesis (cross-attention encoder–decoder) | §2.7.3 (setelah paragraf unmixing) |

**Gambar yang HARUS dibuat sendiri (dari simulator):**
- `§2.3.6`: Spektrum unsur tunggal individual (7 unsur) + spektrum campuran superposisi → gambar paling penting tesis, **masih belum ada**. Kandidat kuat untuk didelegasikan (lihat "Kandidat ilustrasi" di bawah).

**Isu kritis Bab II — SEMUA SELESAI (Juli 2026):**
1. **§2.3.6 kalimat validity domain — SELESAI**: dua kalimat di akhir §2.3.6 menyatakan linearitas Eq. `eq:bab2_poly` berlaku di bawah *optically thin* + LTE parameter bersama; pada *self-absorption* parsial model DL mempelajari koreksi residual (rujuk silang ke §2.4.2).
2. **§2.7.3 spectral unmixing — SELESAI**: paragraf baru setelah "Gap pertama" memposisikan tesis terhadap EGU-Net (`hong_egunet_2021`) dan Keshava & Mustard (`keshava_spectral_2002`); pembeda: domain LIBS (emisi plasma Saha–Boltzmann, bukan reflektansi hiperspektral) + cross-attention eksplisit (bukan autoencoder yang menyandikan kelimpahan implisit). Dilengkapi diagram `fig:bab2_lmm_vs_ca`.
3. **Persamaan cross-attention §2.5.5 — SELESAI**: persamaan bernomor `eq:bab2_crossattention` ($\mathrm{CrossAttention}(\mathbf{Q}_\text{dec},\mathbf{K}_\text{enc},\mathbf{V}_\text{enc})$) ditambahkan, terintegrasi ke narasi dan bisa dirujuk dari Bab III.
4. **Inkonsistensi notasi** $n_e$ vs $N_e$ — **SELESAI** (Juli 2026: satu-satunya instance $N_e$ tersisa di caption Gambar `fig:bab2_te_ne_delay` sudah diganti ke $n_e$; seluruh Bab II sekarang konsisten).

**Isu ketepatan konteks gambar/sitasi (ditemukan & diperbaiki Juli 2026)** — bukan bug render, tapi gambar/klaim dari studi lain yang disajikan seolah generik/sesuai konteks tanah vulkanik tanpa disclosure:
- Gambar 2.1 (skema LIBS, `fig:bab2_libs_setup`): caption sebelumnya menyebut "skema **tipikal**" padahal gambarnya adalah rig validasi khusus (baja Eurofer97 dalam ruang argon bertekanan, dari Favre MERLIN) — beda dari setup eksperimen tesis ini sendiri (Subbab 3.3.1: Nd:YAG + Echelle, tanpa chamber/atmosfer terkontrol disebutkan). Caption sudah direvisi + ditambah catatan silang ke 3.3.1.
- §2.5.3 (dekat Gambar 2.4, Informer): teks sebelumnya salah menyebut studi Walidain dkk. (2026) divalidasi pada "spektrum geologi" — padahal Tabel 2.2 di bab yang sama dengan benar melabeli domain studi itu "Herbal" (jamu Aceh). Kontradiksi internal ini sudah diperbaiki jadi "matriks herbal".
- Gambar 2.5 (peak matching, `fig:bab2_peakmatch`): caption generik "spektrum LIBS eksperimental" muncul persis setelah paragraf soal tumpang-tindih spektral tanah vulkanik, padahal datanya dari studi herbal (Walidain 2026) — sudah ditambah disclosure "(bukan tanah vulkanik)".
- Gambar 2.8 (`favre2025_fig16_spectra_expvsmerlin.png`): file gambar sumbernya ternyata memuat DUA figur (Fig. 16 yang dikutip + plot "Dilution vs t" yang tidak relevan menempel di bawah, salah crop dari PDF sumber) — sudah di-crop, hanya menyisakan Fig. 16. File asli disimpan sebagai `.png.bak`.
- Pelajaran untuk sesi berikutnya: saat menambah/memakai gambar dari paper luar, selalu cek apakah caption mengklaim sesuatu yang lebih generik daripada konteks asli gambar tersebut (mis. "tipikal", "eksperimental" tanpa keterangan domain).

**Isu moderat — SEMUA SELESAI (Juli 2026):**
- §2.1.2 para 3: disclaimer mass closure **sudah ditambahkan** (rentang independen → dikonstrain ke simpleks $\sum_z c_z = 1$ pada pembangkitan data Bab III). Catatan: implementasi Dirichlet di Bab III sendiri MASIH belum diperbaiki (lihat Status Bab III).
- §2.4.2 dan §2.6.1 **sudah dipangkas ~25%** (elaborasi OPC/Favre di §2.4.2 dipadatkan; detail NELIBS/medan magnet/wavelet di §2.6.1 diringkas jadi satu kalimat — semua sitasi dan kriteria SNR ≥ 10 dipertahankan).
- Semua komentar audit (`% [IDE POKOK]`, `% === CONSENSUS ANALYSIS ===`, `% [PERLU BUKTI]`) **sudah dihapus** dari `bab2.tex`, `bab2ai.tex`, `bab1ai.tex` (grep = 0 hasil di `include/`).

### Bab III — Metodologi
Status: **perbaikan sebagian sudah diterapkan (Juli 2026)**, sisanya masih perlu revisi sebelum sidang.

**Sudah diperbaiki (Juli 2026, hasil cross-check terhadap `Thesis-1-Code/src/models/libs_loss.py` dan `train_all.py`):**
1. **Loss function Eq. 3.1 — DIPERBAIKI**: sebelumnya hanya 2 suku (konsentrasi + rekonstruksi). Kode aktual (`LIBSCompoundLoss`) ternyata memakai *compound loss* 5 komponen: KL-divergence + CLR (Aitchison, untuk gradien penuh ke unsur mayor), spektrum (MSE terbobot-puncak + gradien + SAM + L1 sparsity), fisika ($T_e$ + $n_e$ terpisah), dan konservasi. Persamaan~`eq:bab3_loss` dan `eq:bab3_loss_spec` di `bab3.tex` sudah direvisi mengikuti struktur asli ini — proposal sebelumnya *understate* metode yang sebenarnya diimplementasikan.
2. **Daftar model baseline — DIPERBAIKI**: teks sebelumnya menyebut "Informer" sebagai salah satu dari 4 baseline kuantitatif, padahal `train_all.py` mendaftarkan baseline: PLS, MLP, CNN-only, Transformer-only — **tidak ada Informer**. Teks §Tahap 4 sudah diganti ke MLP; Informer tetap disebut sebagai rujukan konseptual di §2.5.3 (bukan baseline kuantitatif).

**Tiga isu kritis yang MASIH belum diperbaiki di file:**
1. **Mass closure**: `tab:komposisi_elemen` menggunakan sampling seragam independen per unsur → jumlah bisa >100%. Harus ganti ke sampling Dirichlet pada simpleks. Tambahkan O sebagai unsur ke-8. Nyatakan basis elemental vs oksida. (Catatan: kode training memakai `num_elements: 7`, konsisten dengan draf saat ini — O belum ditambahkan di kode maupun manuskrip.)
2. **Aritmetika sampling**: 4 arah × 3 kedalaman = 12, bukan 24. Jelaskan faktor ×2 (duplikat? replikat? 2 transek?).
3. **Bug T–Ne coupling di generator** (ditemukan Juli 2026 dari `Thesis-1-Code/STATUS.md`): korelasi $T_e$–$n_e$ pada data sintetis saat ini r=0,036, seharusnya ≈0,81 mengikuti hubungan Saha. Ini adalah bug di `generator.py` line 341 (`rng.uniform` independen, belum distribusi bersyarat power-law). Belum disebut di `bab3.tex` sama sekali — pertimbangkan menambahkan catatan validitas atau menunggu fix sebelum klaim akurasi $n_e$ difinalkan di Bab IV.

### Cross-check terhadap implementasi kode (`Thesis-1-Code`, Juli 2026)

Verifikasi silang antara `bab3.tex` (klaim metodologi) dan kode aktual di `/Users/birrulwldain/Projects/Thesis-1-Code`:

| Klaim di Bab III | Kode aktual | Status |
|---|---|---|
| Hyperparameter Tabel 3.5 ($d$=128, $h$=8, $N_{enc}$=4, $N_{dec}$=4, dropout=0,1) | `configs/model/patch_decomposition.yaml` | ✅ cocok persis |
| Loss 2 suku (Eq. 3.1 lama) | `libs_loss.py`: 5 komponen (KL+CLR+spec+phys+cons) | ✅ sudah disinkronkan Juli 2026 |
| Baseline: PLS, CNN-only, Transformer-only, **Informer** | `train_all.py`: PLS, MLP, CNN-only, Transformer-only | ✅ sudah disinkronkan Juli 2026 |
| Hasil Bab IV | belum ditulis | Hasil terbaru (pre-training sintetis saja, `Thesis-1-Code/STATUS.md` 28 Jun 2026): R²=0,787 (target >0,85 belum tercapai), MAE=0,69%, $T_e$ MAPE=10,26%, $n_e$ MAPE=26,94%, SAM=16,33°. **Fine-tuning ke 24 sampel real belum dilakukan**; baseline (MLP/CNN-only/Transformer-only/PLS) belum pernah dijalankan sampai selesai. |

### Bab IV — Hasil dan Pembahasan
Status: **belum ditulis** (menunggu hasil eksperimen). Hasil pre-training sintetis terbaru sudah ada (lihat tabel cross-check di atas) tapi belum melewati fine-tuning pada 24 sampel real maupun evaluasi baseline — jangan menulis Bab IV dari angka pre-training saja.

Critical path: fix T–Ne coupling di generator → retrain full_v2 → jalankan baseline (PLS/MLP/CNN-only/Transformer-only) → fine-tuning 24 sampel → evaluasi → Bab IV.

### Bab V — Kesimpulan
Status: **belum ditulis**.

---

## Konvensi penulisan yang digunakan di proyek ini

1. **Satu ide pokok per paragraf** — setiap paragraf harus dapat diidentifikasi ide pokoknya. Komentar `% [IDE POKOK]: ...` digunakan selama pengeditan untuk melacak ini, tetapi harus dihapus sebelum pengiriman.
2. **Subbab = beberapa ide pokok menuju satu simpulan** — semua paragraf dalam satu subbab mengarah ke satu tujuan yang sama.
3. **Seksi = kelompok subbab yang sebidang** — tema besar yang mengikat beberapa subbab.
4. **Bahasa Indonesia akademik** di seluruh naskah.
5. **Sitasi**: gunakan `\citep{}` (parenthetical) untuk mayoritas; `\citet{}` hanya ketika nama penulis menjadi subjek kalimat.
6. **Hanya tambahkan entri .bib yang terverifikasi** — jangan tambahkan DOI yang tidak dapat dikonfirmasi. URL Consensus atau abstrak yang dibaca langsung = bukti cukup.
7. **Gambar**: hanya dari sumber CC BY, paper sendiri, atau dibuat sendiri. Tidak mengekstrak gambar dari PDF berlisensi tertutup.

---

## Bibliography — entri yang ditambahkan selama revisi (di luar template awal)

Entri berikut ditambahkan ke `daftar-pustaka.bib` selama sesi revisi, **tanpa DOI** (hanya URL Consensus):

```
certini_crucial_2022      — Certini et al. (2022) Soil formation factors
nanzyo_unique_2003        — Nanzyo (2003) Unique properties of volcanic ash soils
arifin_characteristics_2022 — Arifin et al. (2022) Andisol characteristics Java
ranst_andisols_2002       — Van Ranst et al. (2002) Andisols volcanic Java
fauziah_competitive_2022  — Fauziah et al. (2022) Phosphate adsorption
konstantinidis_application_2019 — Konstantinidis et al. (2019) Linear mixture model on LIBS (ChemCam/Mars)
wang_novel_2014           — Wang et al. (2014) Spectral unmixing untuk analisis komposisi via LIBS
```

Ditambahkan Juli 2026 (**dengan DOI terverifikasi** via web search, disitasi di §2.7.3):

```
hong_egunet_2021          — Hong et al. (2021) EGU-Net, IEEE TNNLS, DOI 10.1109/TNNLS.2021.3082289
keshava_spectral_2002     — Keshava & Mustard (2002) Spectral unmixing, IEEE SPM 19(1):44–57, DOI 10.1109/79.974727
```

**4 entri tersisa yang HARUS ditambahkan** (diidentifikasi di gap analysis, belum ada di .bib) — dua entri WAJIB (Hong EGU-Net, Keshava) **sudah masuk** per Juli 2026:
- Su et al. 2025 — LIBS multi-scale CNN attention (Anal. Chim. Acta)
- Képeš et al. 2023 — CNN interpretability LIBS (Talanta)
- Villas-Boas et al. 2020 — LIBS soil characterization (Eur. J. Soil Sci.)
- Mohankumar et al. 2020 — (untuk uji faithfulness attention)

---

## Perencanaan riset (folder `perencanaan-riset/`)

File-file strategi yang sudah ada (jangan hapus):

| File | Isi |
|------|-----|
| `GAP_ANALYSIS_NOVELTY.md` | 8 query Consensus, skor novelty T1=7/10, T2-B=7.5/10, D1=8/10 |
| `T1_outline_tesis.md` | Status per bab (✅/❌) dengan catatan revisi spesifik |
| `T1_outline_artikel_jurnal.md` | Struktur artikel jurnal (IOP MLST / Spectrochim. Acta B) |
| `T1_gap_referensi.md` | 20 referensi kunci, 6 bertanda ➕ (perlu ditambah ke .bib) |
| `T1_checklist_3bulan.md` | Checklist mingguan 3 bulan hingga sidang September 2026 |
| `REKOMENDASI_STRATEGIS.md` | Roadmap lengkap 16 output T1→T2→D1, analisis risiko, CORIA/LPDP |

**Roadmap singkat**: T1 (S2 Fisika, sidang Sep 2026) → T2 (S2 KA/PMDSU, few-shot meta-learning, 16 bulan) → D1 (PhD, foundation model spektroskopi analitik, preferensi CORIA via LPDP-France).

---

## 8 pertanyaan penguji yang diprediksi (dari review internal)

Jawaban tertulis untuk semua ini harus siap sebelum sidang (lihat `review-reviewer-bab1-5.md`):

1. Bagaimana klaim linearitas dekomposisi (Eq. 2.10) sejalan dengan pengakuan *self-absorption*?
2. Mengapa n=24 sampel cukup untuk melatih dan mengevaluasi model DL?
3. Bagaimana memastikan bobot *cross-attention* benar-benar mewakili konsentrasi (bukan artefak)?
4. Mengapa GRL dipilih dibanding metode adaptasi domain lain?
5. Apa bedanya pendekatan ini dengan *spectral unmixing* hiperspektral (EGU-Net, Keshava)?
6. Bagaimana validitas LTE diverifikasi untuk tanah vulkanik secara spesifik (bukan hanya McWhirter)?
7. Mengapa tidak menggunakan CF-LIBS konvensional + koreksi *self-absorption*?
8. Bagaimana model digeneralisasi ke gunung api lain di luar Seulawah Agam?

---

## Checklist sebelum kirim ke pembimbing

- [x] Hapus semua `% [IDE POKOK]`, `% [PERLU BUKTI]`, `% === CONSENSUS ANALYSIS ===` (Juli 2026 — bab2.tex, bab2ai.tex, bab1ai.tex)
- [ ] Perbaiki mass closure di `tab:komposisi_elemen` (Dirichlet + O) — Bab III, belum
- [x] Perbaiki Eq. 3.1 agar sesuai `libs_loss.py` (compound loss 5 komponen) — Bab III, Juli 2026
- [x] Perbaiki daftar baseline (Informer → MLP, sesuai `train_all.py`) — Bab III, Juli 2026
- [ ] Jelaskan 4×3=12 → 24 (faktor ×2) — Bab III, belum
- [ ] Sebutkan/catat bug T–Ne coupling generator (r=0,036 vs target ≈0,81) di Bab III atau tunda klaim akurasi $n_e$ — belum
- [x] Tambah kalimat validity domain ke §2.3.6 (Juli 2026)
- [x] Tambah paragraf unmixing + 2 entri bib (EGU-Net, Keshava) ke §2.7.3 (Juli 2026, + diagram `fig:bab2_lmm_vs_ca`)
- [x] Perluas §2.5.4–2.5.5 + persamaan cross-attention (`eq:bab2_crossattention`, Juli 2026, + diagram `fig:bab2_crossattention_konsep`)
- [x] Konsistenkan $n_e$ vs $N_e$ seluruh Bab II
- [x] Tambah disclaimer mass closure di §2.1.2 (Juli 2026)
- [ ] Kompilasi penuh bersih tanpa error/warning (WAJIB setelah penambahan 3 diagram TikZ + 2 entri bib Juli 2026 — belum pernah dikompilasi sejak perubahan ini)

---

## Kandidat ilustrasi/gambar konseptual (kandidat delegasi ke agent ilustrasi)

Ini gambar yang **bukan hasil eksperimen** (jadi tidak perlu menunggu data Bab IV) dan bisa dikerjakan sebagai diagram konseptual orisinal — cocok untuk didelegasikan ke agent/model yang fokus ilustrasi. Prioritas dari yang paling kritis:

1. **§2.3.6 — Spektrum unsur tunggal + superposisi jadi spektrum campuran** (prioritas tertinggi, sudah ditandai "gambar paling penting tesis" sejak awal). Idealnya 7 subplot kecil (Si, Al, Fe, Ca, Mg, Na, K) masing-masing spektrum unsur tunggal $S_\text{mono}^{(z)}(\lambda)$, lalu satu panel besar menunjukkan hasil superposisi terbobot $S_\text{poly}(\lambda) = \sum_z c_z S_\text{mono}^{(z)}(\lambda)$ (Persamaan 2.7). Kalau generator sintetis (Tahap 1, Bab III) sudah bisa dijalankan, ini idealnya dari data riil simulator, bukan ilustrasi tangan — tapi kalau simulator belum siap, versi konseptual/skematik (TikZ/pgfplots dengan bentuk puncak Gaussian dummy) sudah cukup untuk sempro.
2. ~~**Diagram konseptual Cross-Attention**~~ — **SELESAI (Juli 2026)** sebagai TikZ `fig:bab2_crossattention_konsep` di §2.5.5.
3. ~~**Diagram skema LIBS setup tesis**~~ — **SELESAI (Juli 2026)** sebagai TikZ `fig:bab2_libs_setup_tesis` di §2.2.1 (ditambahkan SETELAH Gambar 2.1 sebagai pembanding, bukan mengganti).
4. ~~**Diagram Linear Mixing Model / spectral unmixing generik**~~ — **SELESAI (Juli 2026)** sebagai TikZ `fig:bab2_lmm_vs_ca` di §2.7.3.
5. **(Opsional, lebih rendah prioritas)** Diagram sampling Dirichlet pada simpleks untuk Bab III §3.3.1 — kalau isu kritis "mass closure" (lihat Status Bab III) jadi diperbaiki, diagram simpleks 2D/3D yang menunjukkan constraint $\sum$ fraksi $=1$ akan membantu menjelaskan perubahan metodologi ke pembimbing/penguji.

Semua di atas sebaiknya dibuat sebagai **TikZ/pgfplots langsung di LaTeX** (bukan gambar raster eksternal) — konsisten dengan konvensi "gambar hanya dari sumber CC BY, paper sendiri, atau dibuat sendiri" dan menghindari masalah lisensi/atribusi seperti yang ditemukan di Gambar 2.1/2.5/2.8.

---

## Documentation map

`DOCS-INDEX.md` adalah navigation entry point. File lain: `QUICK-START.md` (commands), `README.md` / `README-UNIFIED.md` (full usage), `NOMENCL_GUIDE.md` (symbol-list), `SUBMIT_GUIDE.md` / `SUBMISSION_CHECKLIST.md` (FMIPA/SIMATA), `CONTRIBUTING.md` (template conventions).

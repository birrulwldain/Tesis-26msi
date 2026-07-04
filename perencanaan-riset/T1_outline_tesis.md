# T1 — Outline Tesis S2 Fisika
**Judul:** Kuantifikasi Unsur Tanah Vulkanik Menggunakan LIBS Berbasis Dekomposisi Spektral Multiunsur dengan CNN–Transformer Encoder–Decoder
**Status acuan:** manuskrip `include/bab1–5.tex` sudah ada; outline ini memetakan apa yang SUDAH ADA vs BELUM, berdasarkan naskah aktual dan hasil review internal (lihat `review-reviewer-bab1-5.md`).

> Catatan istilah (Juli 2026, SELESAI): istilah "monoatomik/poliatomik" sudah diganti ke "unsur tunggal"/"campuran" di seluruh `include/*.tex`, dan judul resmi sudah diperbarui ke "Dekomposisi Spektral Multiunsur" (dikonfirmasi non-standar secara spektroskopi — lihat `CLAUDE.md`).

---

## BAB I — PENDAHULUAN ✅ sudah ada, revisi minor
- **1.1 Latar Belakang** — ✅ ada. Perbaiki: sebut "Seulawah Agam" eksplisit (sekarang hanya "Aceh"); koreksi deskripsi Wang et al. 2024 (prediksi temperatur plasma, bukan wavelet-Transformer); tonjolkan interpretabilitas-tertanam sebagai pembeda utama dari Favre.
- **1.2 Rumusan Masalah** — ✅ ada (3 rumusan: pemodelan mono-poli; perancangan arsitektur; evaluasi kinerja).
- **1.3 Tujuan** — ✅ ada (3 tujuan sejajar rumusan masalah).
- **1.4 Hipotesis** — ✅ ada. Tambah kalimat kondisi validitas: dekomposisi linier berlaku pada rezim optically-thin LTE.
- **1.5 Manfaat** — ✅ ada.

## BAB II — TINJAUAN KEPUSTAKAAN ✅ sudah kuat, satu tambahan wajib
- **2.1 Karakteristik Geokimia Tanah Vulkanik** (5 subbab + tabel) — ✅ selesai direvisi (termasuk §2.1.5 tantangan analitik).
- **2.2 LIBS** (prinsip, plasma, emisi, LTE/McWhirter) — ✅ ada, benar secara fisika.
- **2.3 Spektrum Emisi** (Boltzmann, Saha, Einstein, pelebaran, Voigt, mono/poli) — ✅ ada. Revisi: kata "superposisi" → "konvolusi" pada Voigt; tambah asumsi optically-thin pada Pers. 2.10.
- **2.4 Kuantifikasi** (calibration curve, CF-LIBS, XRF) — ✅ ada.
- **2.5 Deep Learning** (CNN, Transformer, Informer, Enc-Dec, Cross-Attention, Domain Adaptation) — ✅ ada.
- **2.6 Evaluasi** (SNR, peak detection, regresi, Boltzmann plot, metrik, attention map) — ✅ ada.
- **2.7 Penelitian Terkait & Posisi** — ✅ ada (tabel perbandingan + 3 gap). **❌ BELUM: paragraf posisi terhadap literatur spectral unmixing (EGU-Net, Keshava) — WAJIB ditambah** (lihat GAP_ANALYSIS_NOVELTY.md Q3); hapus blok komentar consensus/audit sebelum final.

## BAB III — METODE PENELITIAN ✅ ada, revisi mayor (temuan review)
- **3.1–3.3 Tempat/waktu, jadwal, alat-bahan** — ✅ ada.
- **3.4 Diagram alir** — ✅ ada.
- **3.5 Tahap 1: Generasi spektrum sintetis** — ✅ ada. **❌ Perbaiki: sampling komposisi pada simpleks (Dirichlet), sertakan O, saring grid n_e terhadap McWhirter, jelaskan basis oksida↔elemental.** Catat: jumlah spektrum di prompt riset = 10.000; di bab3 = 100.000 — SINKRONKAN.
- **3.6 Tahap 2: Akuisisi eksperimen** — ✅ ada. ❌ Perbaiki aritmetika 4×3 vs 24 (faktor 2 hilang — duplikat/ulangan?).
- **3.7 Tahap 3: Arsitektur & pelatihan** — ✅ ada. ❌ Selaraskan loss (Pers. 3.1) dengan tiga output head (tambah suku T_e, n_e atau cabut head); jelaskan konvensi GRL pada Pers. 3.2; pertimbangkan α>0 saat fine-tuning; justifikasi hyperparameter (atau nyatakan via ablasi).
- **3.8 Tahap 4: Evaluasi & interpretabilitas** — ✅ ada. ❌ Tambah: uji faithfulness attention (perturbasi/IG) sebagai pengaman klaim interpretabilitas.
- **3.9 Analisis Data & indikator keberhasilan** — ✅ ada (tabel indikator).

## BAB IV — HASIL DAN PEMBAHASAN ⚠️ baru sebagian (Stage 1)
- **4.1 Hasil simulasi & dataset** — ✅ kerangka ada, ❌ isi kuantitatif (validasi posisi garis vs NIST, Boltzmann plot R², tabel statistik dataset).
- **4.2 Robustness benchmark (Stage 1)** — ✅ ada naratif + 7 gambar. ❌ Tambah TABEL kuantitatif damage score & severity threshold (review menandai ini).
- **4.3 Hasil pelatihan model** — ❌ BELUM ADA (kurva loss pre-train/fine-tune; konvergensi).
- **4.4 Kinerja kuantifikasi & perbandingan baseline** — ❌ BELUM ADA (R², RMSE, MAPE per unsur; tabel vs PLS/CNN/Transformer/Informer; scatter prediksi-vs-XRF).
- **4.5 Interpretabilitas cross-attention** — ❌ BELUM ADA (heatmap attention vs garis NIST; uji faithfulness).
- **4.6 Pembahasan terhadap hipotesis & penelitian terdahulu** — ❌ BELUM ADA.

## BAB V — KESIMPULAN DAN SARAN ⚠️ ada versi proposal (proyektif)
- ❌ Tulis ulang setelah hasil ada: kesimpulan per tujuan penelitian, jawaban hipotesis, keterbatasan, saran. Samakan `R² ≥ 0,95` (sekarang Bab V menulis `>`).

## DAFTAR PUSTAKA ✅ daftar-pustaka.bib lengkap (±150 entri)
- ❌ Tambah: entri unmixing (Keshava 2002; Hong/EGU-Net 2021) untuk paragraf posisi baru; verifikasi 5 DOI entri pedologi (sudah dihapus DOI-nya, URL Consensus dipertahankan).

---

## Ringkasan prioritas penulisan (sisa)
1. Bab IV §4.3–4.6 (bergantung hasil eksperimen — critical path).
2. Revisi mayor Bab III (komposisi simpleks, loss, sampling) — bisa dikerjakan SEKARANG tanpa menunggu hasil.
3. Paragraf unmixing §2.7 + 2 entri bib — bisa SEKARANG.
4. Bab V final + sinkronisasi lintas-bab + hapus komentar audit — minggu terakhir.

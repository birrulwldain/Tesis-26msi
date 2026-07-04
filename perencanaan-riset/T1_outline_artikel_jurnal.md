# T1 — Outline Artikel Jurnal
**Target utama:** *Machine Learning: Science and Technology* (IOP, Q1) — cocok karena memuat metode ML dengan grounding fisika (contoh: Ding et al. 2025 di jurnal yang sama, deteksi garis emisi via NN).
**Cadangan:** *Spectrochimica Acta Part B* (Q1) — komunitas LIBS inti (Favre, Képeš, Manelski terbit di sini); pilih ini jika reviewer fisika lebih diinginkan daripada reviewer ML.

**Judul kerja (EN):**
*Cross-Attention Spectral Decomposition: A Physics-Grounded Encoder–Decoder for Multi-Element Quantification of Volcanic Soils by Laser-Induced Breakdown Spectroscopy*

> Catatan framing (dari gap analysis): JANGAN klaim "first deep learning decomposition of mixtures" — posisikan terhadap hyperspectral unmixing (EGU-Net) dan klaim kebaruan spesifik: basis unsur-tunggal generatif (T_e, n_e via Saha–Boltzmann) + cross-attention + LIBS + validasi XRF tanah vulkanik.

---

## Struktur Artikel (target total 6.500–8.000 kata)

### 1. Introduction (~900 kata)
- Paragraf 1: LIBS untuk geokimia lapangan; tantangan matriks geologi (matrix effect, overlap) — sitasi Hao 2024, Fabre 2020, Villas-Boas 2020.
- Paragraf 2: status DL-LIBS — CNN/Transformer hibrid (Liu 2026, Yang 2025, Su 2025); CF-LIBS+ML real-time (Favre 2025b); semuanya regresi komposit-langsung.
- Paragraf 3: posisi vs spectral unmixing (Keshava 2002; EGU-Net Hong 2021; RSSNet 2026) — apa yang berbeda di LIBS: basis bergantung kondisi plasma.
- Paragraf 4: kontribusi (3 butir: arsitektur, dataset sintetis berpasangan + domain adaptation, validasi tanah vulkanik + interpretabilitas attention dengan uji faithfulness).

### 2. Physical Model and Problem Formulation (~700 kata)
- Saha–Boltzmann forward model, profil Voigt; persamaan S_poly = Σ c_z S_mono dengan **kondisi validitas eksplisit** (optically thin, parameter plasma bersama).
- Formulasi tugas: diberikan S_poly + pustaka {S_mono^(z)(T_e,n_e)}, estimasi c, rekonstruksi spektrum, (opsional) T_e/n_e.
- **Fig. 1**: skema fisika→arsitektur (persamaan superposisi dipetakan ke cross-attention).

### 3. Methods (~1.500 kata)
- 3.1 Synthetic dataset: NIST ASD; grid T_e, n_e (disaring McWhirter); komposisi Dirichlet pada simpleks 7 unsur + O; augmentasi berbasis robustness benchmark (sitasi paper Walidain 2025 sebagai companion).
- 3.2 Arsitektur: CNN 1D (3 blok) → Transformer encoder (4L, 8H) per spektrum unsur-tunggal; decoder (4L, 8H) ber-cross-attention; output heads (Softplus konsentrasi; rekonstruksi; T_e/n_e). **Fig. 2**: diagram arsitektur.
- 3.3 Training: pre-train (loss multi-task LENGKAP dengan suku plasma), fine-tune 24 sampel + GRL; hyperparameter (tabel).
- 3.4 Eksperimen: LIBS USK (Nd:YAG 1064 nm, 114 mJ, Echelle-OMA, gate 0,5/0,5 µs); 24 sampel Seulawah Agam; XRF ground truth; pre-processing (baseline, normalisasi area).
- 3.5 Evaluasi: metrik (R², RMSE, MAPE per unsur), 5-fold/LOOCV + interval kepercayaan, baseline (PLSR, CNN-only, Transformer-only, Informer), uji faithfulness attention (perturbation test + perbandingan integrated gradients — sitasi Mohankumar 2020, Képeš 2023).
- **Table 1**: parameter sintesis; **Table 2**: hyperparameter & protokol.

### 4. Results (~1.800 kata)
- 4.1 Validasi forward model: posisi garis vs NIST (R²_λ, RMSE_λ), Boltzmann plot. **Fig. 3.**
- 4.2 Kinerja pada data sintetis: kurva loss, prediksi vs target per unsur. **Fig. 4.**
- 4.3 Kinerja pada 24 sampel riil: scatter prediksi-vs-XRF per unsur + tabel perbandingan baseline. **Fig. 5 + Table 3** (hasil utama).
- 4.4 Ablasi: tanpa cross-attention / tanpa pre-train sintetis / tanpa GRL. **Table 4.**
- 4.5 Interpretabilitas: heatmap cross-attention vs garis NIST per unsur; hasil uji faithfulness. **Fig. 6.**

### 5. Discussion (~800 kata)
- Perbandingan dengan Favre 2025b (CNN+MERLIN), Liu 2026, dan EGU-Net-style unmixing; kapan dekomposisi linier gagal (self-absorption); keterbatasan n=24; implikasi untuk geokimia lapangan Indonesia.

### 6. Conclusion (~250 kata)

### Data & Code Availability + Acknowledgments (HPC Mahameru BRIN; USK)

---

## Daftar Figure/Table yang harus diproduksi
| ID | Isi | Status |
|---|---|---|
| Fig 1 | Skema fisika→arsitektur | ❌ buat (modifikasi dari images/Arsitektur-CNN-Trans.png) |
| Fig 2 | Arsitektur detail | ⚠️ ada (perlu poles untuk jurnal) |
| Fig 3 | Validasi forward model | ❌ dari hasil Tahap 1 |
| Fig 4 | Kinerja sintetis | ❌ dari hasil pelatihan |
| Fig 5 | Prediksi vs XRF (hasil utama) | ❌ dari fine-tuning |
| Fig 6 | Attention heatmap + faithfulness | ❌ |
| Table 1–2 | Parameter sintesis & pelatihan | ✅ ada di bab3 (revisi simpleks) |
| Table 3 | Baseline comparison | ❌ |
| Table 4 | Ablasi | ❌ |

## Strategi submit
- Tulis paralel dengan Bab IV tesis (konten sama, kemasan beda).
- MLST: format bebas saat submit, ada jalur "ML for physical sciences" — sangat cocok.
- Cek kebijakan: hasil prosiding ICTAP boleh diperluas ke jurnal asalkan >40–50% konten baru.

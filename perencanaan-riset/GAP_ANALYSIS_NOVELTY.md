# Gap Analysis & Validasi Novelty (T1 / T2 / D1)
*Berbasis 8 query Consensus Academic Search, 12 Juni 2026. Semua klaim ditelusurkan ke paper hasil pencarian.*

---

## Langkah 1 — Hasil Gap Analysis per Query

### Q1. `CNN Transformer LIBS quantification deep learning`
Paper kunci:
- Liu et al. 2026, *AIP Advances* — TransCNN-LIBS untuk baja jarak jauh (kompetitor utama T1, sudah ada di bab2).
- Yang et al. 2025, *Talanta* (9 sitasi) — iTransformer-BiLSTM untuk kuantifikasi La/Ce/Nd di bijih tanah jarang.
- Zeng et al. 2023, *IEEE TIM* (12 sitasi) — CBAM-CNN-LSTM kuantifikasi Ca, Mg, Na, Ba.
- Su et al. 2025, *Anal. Chim. Acta* — MSDA-CNN dengan **visualisasi bobot attention per unsur** pada bijih uranium.
- Yu et al. 2023, *Remote Sensing* (20 sitasi) — Ensemble CNN end-to-end pada data ChemCam.
- Dehbozorgi et al. 2024, *Talanta* (10 sitasi) — CNN dilatih pada data **simulasi** lalu diuji pada data riil, memperhitungkan variasi T_e dan n_e.

**Status gap T1:** Hibrid CNN/Transformer untuk kuantifikasi LIBS sudah ramai. Yang BELUM ada: struktur encoder–decoder yang memakai spektrum unsur-tunggal sebagai referensi eksplisit (key–value) dan cross-attention sebagai mekanisme dekomposisi. Gap arsitektural T1 tetap terbuka tetapi sempit — framing harus presisi.

### Q2. `physics-informed neural network spectroscopy elemental analysis`
- Cuomo et al. 2022 (2.259 sitasi) — review PINN; PINN klasik = residual PDE, bukan yang dipakai T1.
- Puleio et al. 2025, *Sci. Rep.* — PINN unsupervised untuk ekstraksi informasi spektrum, kasus non-linear & multi-agent.
- Lee et al. 2026, *Fusion Eng. Des.* — NN dengan physics-constrained loss (konsistensi bentuk spektrum) untuk charge-exchange spectroscopy.
- Pauly et al. 2024 — simulasi spektrum emisi (T_e=1 eV, n_e=10^17 cm^-3) untuk pelatihan DNN LIBS.

**Status:** "Physics-informed" untuk kuantifikasi LIBS masih jarang dan umumnya berarti physics-*trained* (data sintetis) atau physics-*constrained loss*, bukan physics-*structured architecture* seperti T1. Istilah harus dipakai hati-hati: T1 lebih tepat disebut **physics-structured / physics-grounded**, bukan PINN.

### Q3. `mono-polyatomic spectral decomposition machine learning` (≈ spectral unmixing)
**ANCAMAN NOVELTY TERBESAR — wajib disitasi dan diposisikan:**
- Keshava & Mustard 2002 (2.470 sitasi) — linear spectral unmixing klasik: model `campuran = Σ kelimpahan × endmember` identik secara matematis dengan Pers. dekomposisi T1.
- **Hong et al. 2021, EGU-Net, IEEE TNNLS (204 sitasi)** — jaringan dua-aliran yang memakai **spektrum murni (endmember) untuk memandu unmixing** dengan kendala non-negatif & sum-to-one. Konseptual paling dekat dengan T1.
- Long et al. 2026, RSSNet — unmixing Raman kanal-tunggal dari pustaka ribuan komponen, **dilatih sintetis, generalisasi ke data riil**.
- Wang et al. 2025, P4SU — pre-training pada spektrum simulasi dari pustaka + fine-tuning ke data target.

**Status:** Klaim "pertama memodelkan campuran sebagai superposisi komponen murni dalam DL" TIDAK dapat dipertahankan secara umum — hyperspectral unmixing sudah melakukannya. Yang dapat dipertahankan untuk T1: (i) pertama pada **LIBS** dengan basis monoatomik **generatif-fisis** (diparametrisasi T_e, n_e via Saha–Boltzmann, bukan endmember statis), (ii) mekanisme **cross-attention Transformer** sebagai operator pencocokan (EGU-Net memakai autoencoder Siamese, bukan attention), (iii) keluaran kuantitatif tervalidasi XRF pada tanah vulkanik. §2.7 tesis perlu menambah 1 paragraf yang memposisikan terhadap literatur unmixing.

### Q4. `few-shot learning spectroscopy elemental quantification`
- Lu et al. 2025, *Talanta* — meta-learning few-shot LIBS untuk **klasifikasi** batubara/gangue (akurasi 90% 1-shot); memakai data Mars sebagai source domain.
- Survey FSL: Song 2022 (665 sit), Gharoun 2023 (184 sit), Parnami 2022 (266 sit).
- Zhao et al. 2023, *IEEE TPAMI* — cross-domain few-shot.

**Status gap T2-B:** few-shot untuk **klasifikasi** LIBS sudah dimulai; few-shot/meta-learning untuk **regresi konsentrasi (kuantifikasi)** LIBS belum ditemukan. Gap terbuka.

### Q5. `foundation model spectroscopy multi-modal`
- SpectralGPT 2023, *IEEE TPAMI* (769 sitasi) — FM remote sensing spektral.
- **SpectraFM 2024** — Transformer FM spektrum bintang: pre-train sintetis → fine-tune riil → prediksi kelimpahan kimia (Fe, Mg, O), lintas instrumen & panjang gelombang; attention membawa informasi komposisi kimia. **Blueprint terdekat D1.**
- SpecCLIP 2025, *ApJ* — alignment kontrastif lintas instrumen spektrograf.
- AstroCLIP 2023, SeisCLIP 2023, AstroM3 2025 — FM multi-modal di astronomi/seismologi.

**Status gap D1:** Konsep FM spektral sudah TERBUKTI di astronomi/RS/seismologi — bagus untuk feasibility, buruk untuk klaim "pertama secara umum". Yang masih kosong: FM untuk **spektroskopi analitik laboratorium** (LIBS/Raman/FTIR/XRF) dengan kendala fisika plasma sebagai regularizer dan tugas kuantifikasi unsur. Framing D1 harus eksplisit "analytical atomic spectroscopy", bukan "spectroscopy" umum.

### Q6. `explainable AI attention mechanism spectroscopy`
- Su et al. 2025 (lihat Q1) — sudah memvisualisasikan attention per unsur di LIBS.
- Képeš et al. 2023, *Talanta* (16 sitasi) — interpretasi post-hoc CNN pada LIBS ChemCam.
- Contreras et al. 2024 — review XAI spektroskopi (54 sitasi): mayoritas pakai SHAP/LIME/CAM.
- **Peringatan metodologis:** Mohankumar 2020 (114 sitasi) dan Ma 2026 (*IEEE GRSL*) menunjukkan attention mentah sering **tidak faithful** sebagai eksplanasi.

**Status T2-C:** Sebagian sudah terisi (Su 2025) dan fondasi klaim "attention = eksplanasi" sedang digugat di literatur XAI. Sebagai tesis utama berisiko; lebih aman sebagai bab analisis di dalam T1/T2 dengan uji faithfulness (perturbasi, perbandingan dengan integrated gradients).

### Q7. `LIBS volcanic soil geochemistry Indonesia`
- Khumaeni et al. 2025, *Talanta* (4 sitasi) — CF-LIBS Merapi, validasi XRF, **tanpa deep learning**.
- Idris et al. 2022, *Arab. J. Chem.* (12 sitasi) — LIBS tanah Aceh (tsunami), kuantifikasi kurva kalibrasi.
- Villas-Boas 2020 (56 sitasi) — review LIBS tanah: matrix effect = tantangan utama.

**Status:** Kuantifikasi DL-LIBS pada tanah vulkanik Indonesia/Seulawah Agam **belum ada**. Gap domain T1 kokoh.

### Q8. `synthetic data generation LIBS Saha-Boltzmann`
- Teng et al. 2019, *Opt. Express* (36 sitasi) — GAN untuk perluasan database LIBS.
- Gąsior et al. 2024, *Phys. Plasmas* — ANN dilatih sintetis + "simulated experimental spectra" untuk fusi.
- Finotello et al. 2022 — augmentasi berbasis simulasi + multitask untuk trustworthiness LIBS.

**Status:** Pembangkitan sintetis untuk pelatihan sudah mapan; kontribusi paper Walidain 2025 (framework + robustness-benchmark-driven augmentation policy) bersifat inkremental tetapi defensible — tekankan kebijakan augmentasi berbasis bukti sebagai pembeda.

---

## Langkah 2 — Validasi Novelty

| Topik | Skor | Risiko "sudah ada" | Penyesuaian yang disarankan |
|---|---|---|---|
| **T1** — Dekomposisi mono-poli cross-attention untuk LIBS tanah vulkanik | **7/10** | **Sedang.** EGU-Net & unmixing (Q3) menempati ide dasar di domain hyperspectral; Su 2025 menempati attention-interpretability di LIBS | Pertahankan, tetapi: (1) tambah paragraf posisi vs spectral unmixing di §2.7 — pembeda: basis monoatomik *generatif* ber-(T_e,n_e), bukan endmember statis; cross-attention, bukan autoencoder; (2) jangan klaim "pertama dalam DL" secara umum — klaim "pertama untuk LIBS dalam kerangka encoder–decoder cross-attention"; (3) turunkan klaim attention=c_z menjadi indikator kualitatif + uji faithfulness |
| **T2 Opsi A** — Physics-informed representation + domain transfer | 6/10 | **Tinggi (duplikasi T1).** GRL & pre-train sintetis sudah komponen T1; Dehbozorgi 2024 & Gąsior 2024 sudah kerjakan sim→real LIBS | Tidak direkomendasikan sebagai tesis terpisah |
| **T2 Opsi B** — Few-shot/meta-learning kuantifikasi + physics-constrained augmentation | **7,5/10** | **Rendah–sedang.** Few-shot LIBS baru ada untuk klasifikasi (Lu 2025); regresi konsentrasi few-shot belum ditemukan | **DIREKOMENDASIKAN** (lihat Langkah 3) |
| **T2 Opsi C** — XAI attention sebagai proxy fisik | 6/10 | **Sedang–tinggi.** Su 2025 sudah visualisasi attention per unsur; kritik faithfulness (Mohankumar 2020, Ma 2026) menggerus fondasi klaim | Jadikan bab di T1/T2-B, bukan tesis mandiri; jika tetap, wajib pakai kerangka evaluasi faithfulness formal |
| **D1** — Foundation model spektroskopi analitik | **8/10** | **Rendah di domain analitik; konsep sudah terbukti di astronomi (SpectraFM, SpecCLIP)** — ini justru menurunkan risiko teknis | Ganti framing dari "spectroscopy" umum → "analytical atomic spectroscopy (LIBS/Raman/XRF/FTIR)"; sitasi SpectraFM/SpecCLIP sebagai bukti konsep lintas-bidang; pembeda: kendala Saha–Boltzmann sebagai regularizer fisika + tugas kuantifikasi tervalidasi |

---

## Langkah 3 — Rekomendasi Opsi T2: **Opsi B** (dengan elemen C sebagai bab)

Judul yang disarankan (revisi dari Opsi B):

> *Few-Shot Elemental Quantification dari Spektrum LIBS menggunakan Meta-Learning dengan Physics-Constrained Episode Generation*

Alasan:
1. **Paling novel** — few-shot *kuantifikasi* (regresi) LIBS belum ditemukan di Consensus; yang ada baru klasifikasi (Lu et al. 2025). Opsi A tertutup sebagian oleh T1 sendiri + Dehbozorgi/Gąsior; Opsi C tertutup sebagian Su 2025 dan rentan kritik faithfulness.
2. **Paling feasible 16 bulan** — generator sintetis Saha–Boltzmann yang sudah jadi (paper Walidain 2025) adalah mesin episode meta-learning yang sempurna: setiap episode = matriks/komposisi/kondisi plasma berbeda. Infrastruktur sudah ada; yang baru adalah paradigma pelatihan (MAML/ProtoNet-regresi/Reptile), bukan instrumen baru.
3. **Paling berbeda dari T1** — T1 berkontribusi pada *arsitektur* (cross-attention decomposition); T2-B berkontribusi pada *paradigma pelatihan* (adaptasi cepat lintas matriks dengan ≤ k sampel). Arsitektur T1 bisa dipakai ulang sebagai backbone tanpa duplikasi klaim.
4. **Stepping stone terbaik ke D1** — adaptasi few-shot ke instrumen/matriks baru adalah persis kemampuan yang dijanjikan foundation model (lihat SpectraFM: fine-tune 100 bintang). T2-B membangun kompetensi meta-learning yang menjadi evaluasi downstream alami D1.

Elemen Opsi C dimasukkan sebagai satu bab T2-B: "interpretabilitas attention pada rezim few-shot" dengan uji faithfulness — memberi T2 dimensi XAI tanpa menanggung risikonya sebagai klaim utama.

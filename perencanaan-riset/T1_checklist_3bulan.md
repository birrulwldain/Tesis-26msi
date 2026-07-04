# T1 — Checklist Sidang 3 Bulan (≈ pertengahan Juni – pertengahan September 2026)

## CRITICAL PATH
```
Perbaikan generator sintetis (simpleks+O+McWhirter)
   └→ Re-generate dataset → Pre-training
        └→ Fine-tuning 24 sampel (butuh data LIBS+XRF FINAL)
             └→ Evaluasi+ablasi → Bab IV → Bab V → draft final → sidang
```
Dua pekerjaan TIDAK di critical path dan bisa paralel kapan saja: revisi teks Bab I–III, paragraf unmixing §2.7, artikel jurnal (Methods/Intro).
**Risiko terbesar critical path: ketersediaan data eksperimen (LIBS 24 sampel + XRF).** Jika XRF belum keluar, semua evaluasi riil tertunda → amankan minggu 1.

---

## BULAN 1 — Fondasi & data
### Minggu 1 (kunci!)
- [ ] Konfirmasi status 24 sampel: LIBS terukur semua? XRF keluar semua? Jika belum → eskalasi ke promotor HARI INI.
- [ ] Perbaiki generator sintetis: sampling Dirichlet pada simpleks, sertakan O, filter McWhirter pada grid (T_e, n_e), putuskan basis elemental↔oksida. (≈ 2–3 hari koding.)
- [ ] Sinkronkan angka dataset (10.000 vs 100.000?) di bab3 dan rencana komputasi HPC.
- [ ] Revisi Pers. 3.1 (tambah suku T_e/n_e atau cabut head) + konvensi GRL Pers. 3.2 di bab3.

### Minggu 2
- [ ] Re-generate dataset sintetis penuh di Mahameru + validasi forward model (R²_λ, RMSE_λ, Boltzmann plot) → bahan Bab IV §4.1.
- [ ] Tambah paragraf posisi-unmixing di §2.7 + entri bib (EGU-Net, Keshava, Su 2025, Képeš, Villas-Boas, Mohankumar).
- [ ] Perbaiki aritmetika sampling (4×3 vs 24) + justifikasi desain di bab3.

### Minggu 3–4
- [ ] Implementasi final arsitektur + pipeline pelatihan (pre-train 200 epoch di HPC).
- [ ] Pre-processing data eksperimen (baseline, normalisasi, SNR ≥ 10 screening).
- [ ] Tulis draft Intro+Methods artikel jurnal (paralel, bahan dari bab1–3).
- **Milestone B1:** dataset valid + pre-training konvergen + Bab I–III revisi mayor selesai.

## BULAN 2 — Eksperimen inti
### Minggu 5–6
- [ ] Fine-tuning + GRL pada 24 sampel; 5-fold CV (+LOOCV sebagai sensitivitas) dengan interval kepercayaan.
- [ ] Latih 4 baseline (PLSR, CNN-only, Transformer-only, Informer) protokol identik.
### Minggu 7
- [ ] Ablasi: (a) tanpa cross-attention, (b) tanpa pre-train, (c) tanpa GRL, (d) α=0 vs α>0 saat fine-tune.
- [ ] Analisis attention: heatmap vs garis NIST + uji faithfulness (perturbasi + integrated gradients).
### Minggu 8
- [ ] Bekukan hasil; produksi semua figure/table (Fig 3–6, Table 3–4).
- **Milestone B2:** seluruh hasil kuantitatif final. (Jika R²<target: siapkan narasi honest-limitation + analisis per-unsur — JANGAN tunda penulisan.)

## BULAN 3 — Penulisan & sidang
### Minggu 9–10
- [ ] Tulis Bab IV lengkap (§4.3–4.6 + tabel damage score kuantitatif §4.2).
- [ ] Tulis ulang Bab V (kesimpulan per tujuan, keterbatasan, saran).
- [ ] Lengkapi draft artikel jurnal (Results+Discussion) → kirim ke promotor.
### Minggu 11
- [ ] Sinkronisasi lintas-bab (≥/>, n_e/N_e, Seulawah Agam di Bab I, istilah mono/poli).
- [ ] HAPUS semua komentar audit (% [IDE POKOK], % [PERLU BUKTI], blok CONSENSUS).
- [ ] Kompilasi penuh thesis.tex + cek daftar pustaka; kirim draft lengkap ke promotor & co-supervisor.
### Minggu 12
- [ ] Revisi masukan pembimbing; siapkan slide sidang; latihan menjawab 8 pertanyaan prediksi penguji (lihat review-reviewer-bab1-5.md) — khususnya pertanyaan linearitas vs self-absorption dan n=24.
- [ ] Daftar sidang.
- **Milestone B3:** naskah final + slide + submit artikel (atau siap submit ≤2 minggu pasca sidang).

## Definisi selesai (Definition of Done)
- Semua indikator Tabel analisis-data bab3 terukur dan dilaporkan (tercapai atau tidak, dengan pembahasan).
- Tidak ada komentar audit tersisa; tidak ada sitasi yang tidak ada di .bib; kompilasi bersih.
- Jawaban tertulis untuk 8 pertanyaan penguji terprediksi.

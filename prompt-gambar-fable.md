# Prompt: Audit dan Pembuatan Gambar Tesis — TikZ & Sumber PDF

## Konteks

Tesis MSc Fisika (FMIPA USK) tentang kuantifikasi unsur tanah vulkanik berbasis
LIBS menggunakan arsitektur CNN–Transformer encoder–decoder.

**Kondisi saat ini:**
- Semua gambar yang direferensikan di bab3.tex dan bab4.tex SUDAH ADA sebagai
  file PNG/PDF di folder `images/`
- Namun beberapa gambar konseptual di bab2.tex belum ada, dan gambar yang ada
  masih berformat PNG (resolusi terbatas, tidak scalable)

**Folder gambar:** `/Users/birrulwldain/Projects/Tesis-26msi/images/`
**PDF sitasi:** `/Users/birrulwldain/Projects/Tesis-26msi/daftar-pustaka/`
**File tesis:** `/Users/birrulwldain/Projects/Tesis-26msi/include/bab2.tex`

---

## Gambar yang Perlu Dihasilkan

### Prioritas 1 — Diagram konseptual belum ada di bab2.tex

Buat gambar TikZ untuk dua konsep yang dibahas tapi belum diilustrasikan:

**Gambar A: Skema Dekomposisi Spektrum LIBS**
Ilustrasikan persamaan:
```
S_poly(λ) = c_Si · S_mono_Si(λ) + c_Al · S_mono_Al(λ) + ... + c_K · S_mono_K(λ)
```
Tunjukkan: spektrum poliatomik di atas → panah dekomposisi → 7 spektrum monoatomik
di bawah, masing-masing berlabel unsur. Gunakan warna berbeda per unsur.
Sisipkan di §2.3.6 (Spektrum Monoatomik dan Poliatomik) sebelum Persamaan bab2_poly.

**Gambar B: Skema Prinsip LIBS**
Ilustrasikan: laser pulsa → fokus ke sampel → plasma → emisi → spektrometer →
spektrum diskret. Diagram horizontal sederhana dengan label bahasa Indonesia.
Sisipkan di §2.2.1 (Prinsip Dasar LIBS) setelah paragraf pertama.

### Prioritas 2 — Cari gambar dari PDF sitasi

Baca PDF berikut dan cari gambar/diagram yang RELEVAN untuk disisipkan ke bab2.tex
(dengan izin reproduksi akademik dan sitasi sumber):

- `cristoforetti_local_2010.pdf` → cari: diagram LTE validity regions,
  ilustrasi McWhirter criterion
- `favre_merlin_2025.pdf` → cari: MERLIN pipeline schematic
- `favre_towards_2025.pdf` → cari: CNN architecture diagram, training workflow
- `liu_remote_2026.pdf` → cari: TransCNN-LIBS architecture schematic

Untuk setiap gambar yang ditemukan:
1. Catat halaman dan caption asli
2. Nilai: apakah lebih baik direproduksi as-is (dengan caption + sitasi) atau
   digambar ulang dalam TikZ agar konsisten dengan gaya tesis?
3. Jika gambar dari paper mengandung detail proprietary atau terlalu kompleks,
   rekomendasikan TikZ yang terinspirasi konsepnya

### Prioritas 3 — Upgrade gambar PNG ke TikZ (opsional)

Gambar berikut saat ini ada sebagai PNG. Jika waktu memungkinkan, buat versi
TikZ yang lebih bersih:

- `images/Domain-Adapt.png` → ilustrasi GRL (Gradient Reversal Layer)
  Tunjukkan: feature extractor → domain classifier (dengan tanda minus di GRL)
  → label predictor; serta aliran gradien saat backpropagation

---

## Aturan Pembuatan TikZ

1. **Gunakan paket standar:** `tikz`, `pgfplots`, `pgf-umlsd` jika perlu;
   semua harus tersedia di distribusi TeX Live standar
2. **Warna:** gunakan palet konsisten — biru untuk encoder, oranye untuk decoder,
   hijau untuk output, abu-abu untuk data input
3. **Bahasa label:** Bahasa Indonesia untuk semua label yang menghadap pembaca
4. **Ukuran:** `\textwidth` untuk diagram lebar, `0.8\textwidth` untuk yang
   lebih kompak; gunakan `[H]` untuk posisi float
5. **Caption:** format `\caption{<deskripsi>. \citep{key} jika diadaptasi dari
   paper tertentu.}`
6. **File output:** simpan setiap gambar TikZ sebagai file `.tex` terpisah di
   `/Users/birrulwldain/Projects/Tesis-26msi/images/tikz/`
   Contoh: `tikz/dekomposisi-spektrum.tex`
7. **Include ke bab2.tex:** tambahkan `\input{images/tikz/nama-file.tex}` di
   lokasi yang tepat dalam bab2.tex

---

## Strategi Konsensus untuk Desain Visual

Sebelum membuat setiap gambar TikZ, lakukan tiga evaluasi desain internal:

**Evaluasi 1 — Fisika:** Apakah diagram merepresentasikan konsep fisika
dengan benar? Tidak ada panah yang menyesatkan, skala yang tidak realistis,
atau label yang ambigu?

**Evaluasi 2 — Kejelasan:** Apakah seorang pembaca dengan latar belakang
fisika (bukan ML) dapat memahami diagram ini dalam 10 detik? Jika tidak,
sederhanakan.

**Evaluasi 3 — Konsistensi:** Apakah notasi dalam diagram konsisten dengan
notasi di teks bab2.tex? (contoh: gunakan $S_{\mathrm{poly}}$ bukan "S_mix")

Buat gambar hanya setelah ketiga evaluasi terpenuhi.

---

## Batasan Teknis

- Jangan gunakan computer use
- Baca PDF via `pdftotext` melalui bash untuk mencari keterangan gambar
- Edit bab2.tex langsung untuk menyisipkan `\input{}` atau `\includegraphics{}`
- Pastikan folder `images/tikz/` dibuat jika belum ada (`mkdir -p`)
- Test kompilasi setiap file TikZ secara terpisah sebelum di-include ke bab2.tex
  menggunakan: `pdflatex -interaction=nonstopmode \input{file.tex}`

---

## Output yang Diharapkan

1. File `images/tikz/dekomposisi-spektrum.tex` — diagram dekomposisi S_poly
2. File `images/tikz/libs-prinsip.tex` — skema prinsip LIBS
3. File `images/tikz/domain-adapt-grl.tex` — ilustrasi GRL (jika Prioritas 3)
4. Laporan: daftar gambar dari PDF yang ditemukan + rekomendasi penggunaan
5. bab2.tex diupdate dengan `\input{}` di lokasi yang tepat

# Prompt: Penguatan Bab II §2.7 — Research Gap & Kebaruan Penelitian

## Konteks Tesis

Tesis ini berjudul (tentatif): **"Kuantifikasi Unsur Tanah Vulkanik Berbasis LIBS Menggunakan Arsitektur CNN–Transformer Encoder–Decoder dengan Cross-Attention"**, Program Studi Fisika, FMIPA, Universitas Syiah Kuala.

**Klaim novelty utama:**
Belum ada penelitian yang secara eksplisit memodelkan dekomposisi struktural spektrum LIBS poliatomik menjadi komponen monoatomik per elemen dalam kerangka deep learning menggunakan arsitektur cross-attention encoder–decoder.

**Basis fisika klaim tersebut:**

```
S_poly(λ) = Σ_z  c_z · S_mono^(z)(λ)
```

Mekanisme cross-attention mengoperasionalisasi persamaan ini secara langsung: decoder queries berasal dari spektrum poliatomik, encoder keys/values berasal dari spektrum monoatomik per elemen. Bobot attention merepresentasikan koefisien konsentrasi c_z.

---

## Empat Kompetitor Utama

| ID | Referensi | Topik singkat |
|----|-----------|---------------|
| A  | Liu et al. 2026 | CNN-Transformer untuk remote LIBS pada baja |
| B  | Walidain et al. 2026 | Informer-based LIBS untuk spektrum geologi (kualitatif) |
| C  | Favre et al. 2025 (towards real-time) | CNN pada database MERLIN untuk CF-LIBS real-time, validasi baja Eurofer97 |
| D  | Wang et al. 2024 | Wavelet-Transformer-CNN hibrid dengan bantuan simulasi |

PDF sitasi tersedia di:
`/Users/birrulwldain/Projects/Tesis-26msi/daftar-pustaka/`

File tesis:
`/Users/birrulwldain/Projects/Tesis-26msi/include/bab2.tex`

---

## Tugas Utama

Kamu bertugas memperkuat §2.7 (Penelitian Terkait dan Posisi Penelitian) di file bab2.tex dengan dua deliverable berikut.

### Deliverable 1 — Tabel Perbandingan Sistematis

Buat tabel LaTeX dengan kolom:

```
Penelitian | Arsitektur | Cross-Attention | Encoder-Decoder | 
Dekomposisi Mono/Poli | Domain Data | Keterbatasan Utama
```

- Isi berdasarkan bukti langsung dari PDF masing-masing kompetitor (gunakan `pdftotext` via bash)
- Baris terakhir: penelitian yang diusulkan (tesis ini)
- Jangan klaim sesuatu yang tidak dikonfirmasi PDF

### Deliverable 2 — Ekspansi §2.7 dalam Bahasa Indonesia Akademik

Tulis ulang dan perkuat §2.7 dengan struktur berikut:
1. §2.7.1 Penelitian Berbasis Fisika Plasma — sudah ada, periksa dan perbaiki jika perlu
2. §2.7.2 Penelitian Berbasis Machine Learning / Deep Learning — sudah ada, periksa dan perbaiki jika perlu
3. §2.7.3 Research Gap dan Kebaruan Penelitian — **ini fokus utama**, perkuat dengan:
   - Referensi eksplisit ke tabel perbandingan
   - Argumen gap yang bertingkat: (a) gap arsitektur, (b) gap data/domain, (c) gap interpretabilitas fisika
   - Satu paragraf penutup yang memposisikan novelty tesis secara tajam

---

## Aturan Penulisan: Satu Ide Pokok Per Paragraf

Terapkan aturan ini pada SETIAP paragraf yang kamu tulis atau tulis ulang:

1. Setiap paragraf harus memiliki tepat **satu ide pokok**
2. Ide pokok dinyatakan di kalimat pertama (topic sentence)
3. Kalimat berikutnya: bukti/elaborasi → implikasi (jangan lompat langsung dari klaim ke implikasi tanpa bukti)
4. Jika satu paragraf mengandung lebih dari satu ide, **pecah menjadi dua paragraf**
5. Tambahkan komentar audit di atas setiap paragraf baru yang kamu tulis:

```latex
% [IDE POKOK]: <satu kalimat yang menyatakan ide pokok paragraf ini>
```

Komentar ini akan dihapus setelah review, tapi wajib ada saat pengiriman hasil.

---

## Strategi Consensus — Tiga Perspektif

Sebelum menulis draft final, lakukan tiga putaran analisis internal dengan perspektif berbeda:

**Perspektif 1 — Kritis (Devil's Advocate):**
Cari bukti dari PDF bahwa kompetitor *mungkin* telah sebagian menjawab gap yang diklaim. Tulis apa yang mereka CAPAI sebelum menyatakan keterbatasannya. Pastikan klaim gap tidak berlebihan.

**Perspektif 2 — Konstruktif (Advocate):**
Identifikasi gap terkuat yang dapat diklaim tesis ini, hanya berdasarkan apa yang terbaca di PDF. Jangan melemahkan klaim yang memang valid.

**Perspektif 3 — Sintetis (Balanced):**
Berdasarkan Perspektif 1 dan 2, tulis versi paling seimbang dan dapat dipertahankan di depan penguji. Inilah yang masuk ke draft final.

Laporkan ringkasan ketiga perspektif sebagai komentar blok sebelum §2.7.3:

```latex
% === CONSENSUS ANALYSIS ===
% Perspektif 1 (Kritis): ...
% Perspektif 2 (Konstruktif): ...
% Perspektif 3 (Sintetis/Final): ...
% ===========================
```

---

## Batasan Teknis

- Jangan gunakan computer use
- Baca PDF via `pdftotext` melalui bash
- Edit langsung ke file `/Users/birrulwldain/Projects/Tesis-26msi/include/bab2.tex`
- Pertahankan semua `\citep{}` yang sudah ada; tambahkan sitasi baru hanya jika key-nya sudah ada di daftar pustaka
- Tulisan dalam Bahasa Indonesia akademik, konsisten dengan gaya bab2.tex yang sudah ada

# Prompt: Pencarian Sitasi untuk Flag [PERLU SITASI] di Bab II

## Konteks

Tesis fisika MSc (FMIPA USK) tentang kuantifikasi unsur tanah vulkanik berbasis
LIBS menggunakan CNN–Transformer encoder–decoder. File bab2.tex memiliki empat
klaim yang belum bersitasi, ditandai `% [PERLU SITASI]`.

File tesis:
`/Users/birrulwldain/Projects/Tesis-26msi/include/bab2.tex`

Daftar pustaka (BibTeX):
`/Users/birrulwldain/Projects/Tesis-26msi/daftar-pustaka.bib`

PDF yang sudah ada:
`/Users/birrulwldain/Projects/Tesis-26msi/daftar-pustaka/`

---

## Empat Klaim yang Perlu Sitasi

### Klaim 1 — §2.1.1
> "Laju dan arah proses pembentukan [tanah vulkanik] ini dikendalikan oleh
> material induk, curah hujan, suhu, topografi, dan aktivitas biologis"

### Klaim 2 — §2.1.2
> "tanah vulkanik memiliki karakteristik yang khas, seperti porositas tinggi,
> kapasitas retensi air yang baik, kapasitas tukar kation yang relatif besar,
> serta kandungan mineral amorf dan fase aluminosilikat yang dominan"

### Klaim 3 — §2.1.3
> "Variasi lateral dipengaruhi oleh arah deposisi abu vulkanik, arah angin
> dominan saat erupsi, dan topografi wilayah, sedangkan variasi vertikal
> dipengaruhi oleh kedalaman tanah, infiltrasi air, proses pencucian unsur
> (leaching), dan tingkat pelapukan mineral"

### Klaim 4 — §2.1.4
> "Unsur K, Ca, dan Mg berperan sebagai nutrien makro yang mendukung
> pertumbuhan tanaman, Fe dan Al memengaruhi sifat kimia tanah seperti
> kapasitas adsorpsi fosfat dan keasaman tanah"

---

## Alat Pencarian — Consensus Academic Search Connector

Gunakan tool `mcp__275fabe2-b689-4a16-bc7d-5c5a32d53658__search` (bukan WebSearch
generik) untuk seluruh pencarian literatur. Tool ini mencakup >200 juta paper
peer-reviewed dari Semantic Scholar, PubMed, Scopus, dan ArXiv, dan mengembalikan:
judul, penulis, tahun, abstrak, jumlah sitasi, skor jurnal, dan URL langsung.

Panggilan contoh:
```python
mcp__275fabe2-b689-4a16-bc7d-5c5a32d53658__search(
    query="Andisol volcanic ash soil allophane cation exchange capacity properties"
)
```

**Rate limit:** Tunggu minimal 5 detik antar panggilan. Jangan jalankan lebih
dari 2 pencarian secara paralel.

---

## Aturan Anti-Halusinasi — WAJIB DIIKUTI

1. **JANGAN pernah menulis sitasi dari memori** — setiap referensi harus
   ditemukan melalui Consensus connector atau terdapat di daftar-pustaka.bib.

2. **Setiap kandidat referensi harus diverifikasi tiga hal:**
   - Judul dan penulis ada di hasil Consensus connector (kutip URL dari hasil)
   - Abstrak mengonfirmasi klaim yang akan disitasi — bukan sekadar topik relevan
   - Citation count > 10 lebih diutamakan (lebih terpercaya untuk klaim dasar)

3. **Jika Consensus tidak menemukan referensi yang memenuhi syarat:**
   - Tulis `% [TIDAK DITEMUKAN: <alasan>]` di bab2.tex
   - JANGAN membuat referensi fiktif
   - JANGAN menggunakan paper yang abstraknya tidak mengonfirmasi klaim

4. **Format pelaporan untuk setiap klaim:**
   ```
   KLAIM: <teks klaim>
   KANDIDAT 1: <judul> | <penulis, tahun> | <citation count> | <URL Consensus>
   KANDIDAT 2: <judul> | <penulis, tahun> | <citation count> | <URL Consensus>
   DIPILIH: <kandidat mana, mengapa, kutipan abstrak yang mengonfirmasi>
   BIBKEY: <key yang akan digunakan di .tex>
   ```

---

## Strategi Consensus — Tiga Query Per Klaim

Untuk setiap klaim, jalankan tiga query berbeda secara **sekuensial** (bukan
paralel, karena rate limit) sebelum memutuskan referensi final:

**Query 1 — Review otoritatif:**
Cari review atau paper bersitasi tinggi yang membahas klaim secara umum.
Contoh untuk Klaim 1:
`volcanic soil pedogenesis parent material climate topography weathering`

**Query 2 — Empiris tropis/Indonesia:**
Spesifikkan ke tanah vulkanik tropis atau Indonesia jika memungkinkan.
Contoh untuk Klaim 1:
`Andisol tropical volcanic soil formation factors Indonesia Southeast Asia`

**Query 3 — Silang-cek independen:**
Gunakan istilah berbeda untuk memastikan konsistensi klaim lintas literatur.
Contoh untuk Klaim 1:
`soil forming factors Jenny CLORPT volcanic parent material`

Pilih referensi dengan sitasi terbanyak yang abstraknya paling langsung
mengonfirmasi klaim. Paper peer-reviewed lebih diutamakan dari buku teks
karena lebih mudah diverifikasi penguji.

---

## Tugas

### Langkah 1 — Cek daftar-pustaka.bib yang ada
Baca `daftar-pustaka.bib` via bash. Cari apakah sudah ada referensi yang
bisa digunakan untuk keempat klaim (pedologi, Andisol, geokimia tanah,
agronomi). Laporkan key yang relevan beserta judul aslinya.

### Langkah 2 — Consensus connector untuk klaim yang belum terpenuhi
Untuk setiap klaim yang belum terpenuhi dari daftar-pustaka.bib yang ada,
jalankan tiga query secara SEKUENSIAL (Query 1 → 2 → 3) menggunakan
`mcp__275fabe2-b689-4a16-bc7d-5c5a32d53658__search`. Tunggu 5 detik antar
query. Ikuti format pelaporan di bagian Anti-Halusinasi.

### Langkah 3 — Tambah entri BibTeX jika perlu
Jika ditemukan referensi baru yang valid:
- Tambahkan entri BibTeX ke `daftar-pustaka.bib`
- Format: sesuaikan dengan gaya entri yang sudah ada di file tersebut
- JANGAN menambahkan entri jika DOI/URL tidak dapat dikonfirmasi

### Langkah 4 — Edit bab2.tex
Untuk setiap klaim yang berhasil menemukan referensi:
- Hapus baris `% [PERLU SITASI]: ...`
- Tambahkan `\citep{key}` di lokasi yang tepat dalam kalimat
- Untuk klaim yang tidak berhasil: ganti flag dengan `% [TIDAK DITEMUKAN: <alasan>]`

### Langkah 5 — Laporan akhir
Tulis ringkasan ke terminal:
```
KLAIM 1: [SELESAI/TIDAK DITEMUKAN] — <key atau alasan>
KLAIM 2: [SELESAI/TIDAK DITEMUKAN] — <key atau alasan>
KLAIM 3: [SELESAI/TIDAK DITEMUKAN] — <key atau alasan>
KLAIM 4: [SELESAI/TIDAK DITEMUKAN] — <key atau alasan>
```

---

## Batasan Teknis

- Jangan gunakan computer use
- Baca .bib dan .tex via bash atau Read tool
- Gunakan `mcp__275fabe2-b689-4a16-bc7d-5c5a32d53658__search` untuk pencarian —
  BUKAN WebSearch generik
- Jalankan query secara sekuensial, tunggu 5 detik antar panggilan (rate limit)
- Edit langsung ke file yang bersangkutan
- Tulisan dalam Bahasa Indonesia tetap dipertahankan; hanya tambah `\citep{}`

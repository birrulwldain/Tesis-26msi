# ✅ Checklist Submission FMIPA USK

Gunakan checklist ini sebelum submit ke SIMATA.

---

## 📄 Dokumen Wajib

- [ ] **thesis.pdf** - PDF final tugas akhir
- [ ] **Lembar Pengesahan** - Dengan tanda tangan lengkap (Pembimbing 1, 2, Ketua Prodi)
- [ ] **Surat Pernyataan** - Dengan materai dan tanda tangan
- [ ] **Pernyataan Bebas Plagiasi** - Dengan materai dan tanda tangan
- [ ] **Similarity Report** - Dari Turnitin atau plagiarism checker (target < 20%)
- [ ] **File Sumber** - thesis.tex, include/, daftar-pustaka.bib (optional tapi recommended)

---

## 📐 Format Dokumen

### Margin & Layout
- [ ] Margin kiri: 4 cm
- [ ] Margin kanan: 3 cm
- [ ] Margin atas: 3 cm
- [ ] Margin bawah: 3 cm
- [ ] Kertas: A4 (210 × 297 mm)

### Font & Spacing
- [ ] Font: Times New Roman
- [ ] Size: 12 pt (body text)
- [ ] Line spacing: 1.5 (isi), 1.0 (kutipan/footnote)
- [ ] Paragraph indent: 1.27 cm (first line)

### Penomoran Halaman
- [ ] Bagian awal (cover-daftar isi): Romawi lowercase (i, ii, iii, ...)
- [ ] Bagian isi (BAB I-V): Arabic (1, 2, 3, ...)
- [ ] Posisi: Tengah bawah (preliminary), Kanan bawah (isi)

---

## 📚 Struktur Konten

### Bagian Awal
- [ ] Cover/Sampul depan
- [ ] Lembar pengesahan
- [ ] Surat pernyataan
- [ ] Pernyataan bebas plagiasi (untuk sidang)
- [ ] Abstrak Indonesia (max 1 halaman, 250-300 kata)
- [ ] Abstract English (max 1 halaman, 250-300 kata)
- [ ] Kata pengantar
- [ ] Daftar isi
- [ ] Daftar gambar (jika ada gambar)
- [ ] Daftar tabel (jika ada tabel)
- [ ] Daftar singkatan/notasi (jika perlu)

### Bagian Isi
- [ ] **BAB I PENDAHULUAN**
  - [ ] Latar belakang
  - [ ] Rumusan masalah
  - [ ] Tujuan penelitian
  - [ ] Manfaat penelitian
  - [ ] Batasan masalah
  
- [ ] **BAB II TINJAUAN PUSTAKA**
  - [ ] Landasan teori
  - [ ] Penelitian terkait
  - [ ] Kerangka pemikiran

- [ ] **BAB III METODOLOGI**
  - [ ] Desain penelitian
  - [ ] Data dan sumber data
  - [ ] Metode analisis
  - [ ] Alat dan bahan (untuk eksperimen)

- [ ] **BAB IV HASIL DAN PEMBAHASAN**
  - [ ] Hasil penelitian
  - [ ] Analisis hasil
  - [ ] Pembahasan
  - [ ] Validasi (jika ada)

- [ ] **BAB V KESIMPULAN DAN SARAN**
  - [ ] Kesimpulan
  - [ ] Saran

### Bagian Akhir
- [ ] **Daftar Pustaka**
  - [ ] Format APA/IEEE konsisten
  - [ ] Semua referensi dikutip di teks
  - [ ] Minimal 20 referensi (untuk S1)
  - [ ] 60% jurnal/prosiding (untuk S1)
  
- [ ] **Lampiran** (jika ada)
  - [ ] Kode program
  - [ ] Data mentah
  - [ ] Dokumentasi
  - [ ] Surat izin penelitian

---

## 🔍 Quality Check

### Konten
- [ ] Tidak ada typo atau grammar error
- [ ] Semua gambar jelas dan beresolusi tinggi (min 300 dpi)
- [ ] Semua tabel terformat rapi
- [ ] Caption gambar/tabel lengkap dengan sumber
- [ ] Semua persamaan matematis terformat benar
- [ ] Referensi silang (ref/label) berfungsi

### Konsistensi
- [ ] Istilah teknis konsisten di seluruh dokumen
- [ ] Penomoran bab/section konsisten
- [ ] Style penulisan konsisten (Indonesia/English)
- [ ] Format kutipan konsisten
- [ ] Format daftar pustaka konsisten

### Metadata
- [ ] Judul sama di semua dokumen (cover, pengesahan, SIMATA)
- [ ] Nama mahasiswa benar (sesuai KTP)
- [ ] NPM benar
- [ ] Nama pembimbing lengkap dengan gelar
- [ ] Program studi benar
- [ ] Tanggal sidang benar

---

## 🖥️ Technical Verification

### Build Check
- [ ] Compile tanpa error: `xelatex thesis`
- [ ] Bibliography generate: `bibtex thesis`
- [ ] No warnings di log file (atau resolve yang penting)
- [ ] PDF bisa dibuka di berbagai PDF reader

### PDF Properties
- [ ] File size reasonable (< 50 MB untuk SIMATA)
- [ ] PDF version: 1.4 atau lebih baru
- [ ] Fonts embedded
- [ ] Hyperlinks berfungsi (jika ada)
- [ ] Bookmarks/outline tersedia (optional tapi bagus)

### Similarity Check
- [ ] Overall similarity < 20%
- [ ] Exclude bibliography & quotes
- [ ] Tidak ada single source > 5%
- [ ] Screenshot/export report untuk upload

---

## 📤 Upload ke SIMATA

### Persiapan
- [ ] Login ke https://fmipa.usk.ac.id/simata/login
- [ ] Verifikasi data mahasiswa sudah benar
- [ ] Siapkan semua file dalam format yang diminta

### Metadata Entry
- [ ] Judul lengkap (Indonesia & English)
- [ ] Abstrak lengkap (Indonesia & English)
- [ ] Keywords (min 3, max 5)
- [ ] Data pembimbing (NIP, nama lengkap)
- [ ] Data penguji (jika sudah sidang)
- [ ] Tanggal sidang

### File Upload
- [ ] thesis.pdf (wajib, < 50 MB)
- [ ] Lembar pengesahan (scan, PDF)
- [ ] Surat pernyataan (scan, PDF)
- [ ] Bebas plagiasi (scan, PDF)
- [ ] Similarity report (PDF)
- [ ] Source files (optional, ZIP)

### Final Steps
- [ ] Preview dokumen di SIMATA
- [ ] Verifikasi semua informasi benar
- [ ] Submit untuk review pembimbing
- [ ] Tunggu approval
- [ ] Print/cetak sesuai keperluan (hardcopy ke perpustakaan)

---

## 📞 Troubleshooting

### PDF Tidak Bisa Dibuka
- Re-compile dengan: `xelatex -output-driver="xdvipdfmx -z 0" thesis`
- Atau export PDF/A dari PDF viewer

### File Size Terlalu Besar
- Compress gambar (reduce DPI ke 300)
- Gunakan PDF compressor online
- Remove embedded fonts yang tidak perlu

### Bibliography Tidak Muncul
- Pastikan `\bibliography{daftar-pustaka}` ada di thesis.tex
- Run sequence: xelatex → bibtex → xelatex → xelatex
- Cek .bib file tidak ada error syntax

### SIMATA Upload Error
- Cek koneksi internet
- Cek file size < limit
- Try browser lain (Chrome/Firefox)
- Clear browser cache
- Hubungi admin SIMATA

---

## 📋 Pre-Submission Summary

Sebelum klik "Submit" di SIMATA:

1. ✅ Semua dokumen lengkap dan ter-sign
2. ✅ PDF compile tanpa error
3. ✅ Similarity check < 20%
4. ✅ Format sesuai panduan FMIPA
5. ✅ Metadata di SIMATA lengkap dan benar
6. ✅ Sudah review oleh pembimbing
7. ✅ Backup semua file (local + cloud)

**Good luck! 🎓**

---

**Link Penting**:
- SIMATA: https://fmipa.usk.ac.id/simata/login
- Dokumen FMIPA: https://fmipa.usk.ac.id/web/documents/
- Template: https://github.com/birrulwldain/Tesis-26msi

**Untuk panduan lengkap, lihat**: `SUBMIT_GUIDE.md`

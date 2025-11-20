# Panduan Submission Template FMIPA Unsyiah

Dokumen ini berisi panduan lengkap untuk menyiapkan dan submit template tugas akhir ke sistem FMIPA Universitas Syiah Kuala.

---

## 📋 Link Resmi FMIPA USK

- **Dokumen Resmi**: https://fmipa.usk.ac.id/web/documents/
- **SIMATA (Sistem Informasi Tugas Akhir)**: https://fmipa.usk.ac.id/simata/login
- **Website FMIPA**: https://fmipa.usk.ac.id/

---

## ✅ Checklist Submission

### 1. Dokumen Wajib
- [ ] File PDF tugas akhir lengkap
- [ ] File sumber LaTeX (.tex files)
- [ ] Bibliografi (.bib file)
- [ ] Lembar pengesahan (signed)
- [ ] Surat pernyataan bebas plagiasi (signed)
- [ ] Abstrak Indonesia & English
- [ ] Bukti similarity check (Turnitin/Plagiarism Checker)

### 2. Format & Struktur
- [ ] Margin: Kiri 4cm, Kanan/Atas/Bawah 3cm
- [ ] Font: Times New Roman 12pt
- [ ] Line spacing: 1.5 (isi), 1.0 (quote/footnote)
- [ ] Halaman awal: Romawi lowercase (i, ii, iii, ...)
- [ ] Halaman isi: Arabic (1, 2, 3, ...)
- [ ] Penomoran gambar/tabel: Format X.Y (Bab.Nomor)

### 3. Konten Lengkap
- [ ] Cover depan (sesuai template fakultas)
- [ ] Lembar pengesahan
- [ ] Surat pernyataan
- [ ] Abstrak Indonesia (max 1 halaman)
- [ ] Abstract English (max 1 halaman)
- [ ] Kata pengantar
- [ ] Daftar isi
- [ ] Daftar gambar (jika ada)
- [ ] Daftar tabel (jika ada)
- [ ] Daftar singkatan (jika ada)
- [ ] BAB I - V
- [ ] Daftar pustaka
- [ ] Lampiran (jika ada)

### 4. Technical Requirements
- [ ] Compile tanpa error menggunakan XeLaTeX
- [ ] Bibliography generate dengan BibTeX/Biber
- [ ] PDF/A compliant (untuk arsip)
- [ ] Semua gambar resolusi minimal 300dpi
- [ ] Hyperlink aktif di PDF (optional tapi recommended)

---

## 🚀 Cara Prepare Submission

### Otomatis (Recommended)
```bash
./prepare-submission.sh
```

Script ini akan:
1. Clean build artifacts
2. Compile thesis dengan XeLaTeX
3. Generate bibliography
4. Package semua file yang diperlukan ke `submission.zip`

### Manual

#### 1. Build PDF
```bash
xelatex thesis
bibtex thesis
xelatex thesis
xelatex thesis
```

#### 2. Verifikasi Output
Cek `thesis.pdf` untuk memastikan:
- Semua halaman ter-render dengan benar
- Daftar pustaka muncul lengkap
- Gambar dan tabel sesuai posisi
- Nomor halaman konsisten

#### 3. Package Files
Siapkan folder submission dengan struktur:
```
submission/
├── thesis.pdf              # Final PDF
├── thesis.tex             # Main source
├── daftar-pustaka.bib     # Bibliography
├── include/               # All chapter files
├── images/                # All images
├── lib/                   # Template files
└── README.md              # Build instructions
```

---

## 📤 Upload ke SIMATA

### Login & Access
1. Buka https://fmipa.usk.ac.id/simata/login
2. Login dengan akun mahasiswa (NPM)
3. Pilih menu "Upload Tugas Akhir"

### Upload Process
1. **Metadata**: Isi judul, abstrak, keywords, pembimbing
2. **Files**: Upload `thesis.pdf` (final)
3. **Supporting**: Upload surat pengesahan, pernyataan, dll
4. **Verification**: System akan verify format dan similarity
5. **Submit**: Klik submit untuk review dosen

### Catatan Penting
- File size maksimal: 50MB per file
- Format: PDF/A atau PDF (standard)
- Pastikan semua metadata terisi lengkap
- Tunggu approval dari pembimbing sebelum finalisasi

---

## 🔍 Verifikasi Compliance

### Format Check
```bash
# Check PDF compliance
pdfinfo thesis.pdf

# Check page count
pdfinfo thesis.pdf | grep Pages

# Check fonts embedded
pdffonts thesis.pdf
```

### Similarity Check
- Gunakan Turnitin (via SIMATA)
- Atau plagiarism checker lain yang disetujui fakultas
- Target: < 20% similarity (exclude quotes & bibliography)

### Final Review Checklist
- [ ] Judul sama di semua dokumen (cover, pengesahan, PDF metadata)
- [ ] Nama pembimbing dan penguji konsisten
- [ ] Tanggal sidang sesuai
- [ ] Signature lengkap di lembar pengesahan
- [ ] NPM dan nama mahasiswa benar
- [ ] Semua referensi di daftar pustaka dikutip di teks
- [ ] Gambar dan tabel punya caption & source

---

## 📞 Bantuan & Support

### Jika Ada Masalah

**Template/LaTeX Issues**:
- GitHub Issues: https://github.com/birrulwldain/Tesis-26msi/issues
- Email: [your-email@example.com]

**FMIPA Requirements**:
- Admin Prodi: Kontak via SIMATA
- Perpustakaan FMIPA: Untuk format & arsip
- IT Support: Untuk technical SIMATA issues

**Referensi**:
- Panduan resmi: https://fmipa.usk.ac.id/web/documents/
- Template ini: https://github.com/birrulwldain/Tesis-26msi

---

## 📅 Timeline Submission

### Seminar Proposal (SEMPRO)
- 2 minggu sebelum: Submit draft ke pembimbing
- 1 minggu sebelum: Finalisasi presentasi
- H-3: Upload ke SIMATA
- H-day: Seminar

### Seminar Hasil (SEMHAS)
- 1 bulan sebelum: Submit BAB 1-4 ke pembimbing
- 2 minggu sebelum: Revisi & finalisasi
- H-7: Upload ke SIMATA
- H-day: Seminar

### Sidang Akhir
- 1 bulan sebelum: Submit draft lengkap
- 2 minggu sebelum: Revisi dari pembimbing
- H-7: Upload ke SIMATA + hardcopy ke prodi
- H-day: Sidang
- H+7: Submit revisi final (jika ada)
- H+14: Penjilidan & arsip perpustakaan

---

**Copyright**: © 2025 BIRRUL WALIDAIN  
**Repository**: https://github.com/birrulwldain/Tesis-26msi  
**Last Updated**: November 18, 2025

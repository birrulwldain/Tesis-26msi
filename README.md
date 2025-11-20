# Template Tugas Akhir FMIPA USK - Unified System

Template LaTeX untuk penulisan tugas akhir di Universitas Syiah Kuala FMIPA yang telah disederhanakan menjadi **1 file utama dengan 3 mode kompilasi**.

Disesuaikan dengan aturan penulisan tugas akhir yang terdapat pada dokumen Panduan Tugas Akhir FMIPA USK tahun 2024.

---

## 📝 Author & License

**Author**: BIRRUL WALIDAIN  
**GitHub**: [@birrulwldain](https://github.com/birrulwldain)  
**Repository**: [Tesis-26msi](https://github.com/birrulwldain/Tesis-26msi)  
**Copyright**: © 2025 BIRRUL WALIDAIN  
**License**: MIT License

### 🏛️ Official Compliance
Template ini telah disesuaikan dengan [Panduan FMIPA USK](https://fmipa.usk.ac.id/web/documents/) dan siap untuk submission via [SIMATA](https://fmipa.usk.ac.id/simata/login).

---

## ✨ Fitur Utama

- **1 File Utama** (`thesis.tex`) untuk semua tahap
- **1 Paket Style** (`lib/usk-thesis-xelatex.sty`)
- **3 Mode Kompilasi**: SEMPRO, SEMHAS, SIDANG
- **Metadata Terpusat** - Edit sekali, berlaku untuk semua mode
- **XeLaTeX Native** - Unicode support, font modern
- **Build Automation** - Script otomatis untuk compile

## 📁 Struktur File (Simple & Clean)

```
thesis.tex                          # ← FILE UTAMA (unified template)
build-thesis.sh                     # ← Build script
daftar-pustaka.bib                  # ← Bibliography

lib/
  └── usk-thesis-xelatex.sty   # ← PAKET UTAMA (hanya 1 file)

include/                            # ← Konten bab-bab
  ├── bab1.tex ... bab5.tex
  ├── abstrak-indonesia.tex
  ├── lampiran.tex
  └── [lainnya]

README.md                          # Dokumentasi utama
QUICK-START.md                     # Quick reference
```

## 🚀 Quick Start

### 1. Edit Metadata (1 kali, berlaku semua mode)
```latex
# Edit thesis.tex (line 110-130)
\judul{Judul Penelitian Anda}
\penulis{Nama Anda}
\nim{170601056}
```

### 2. Edit Konten
```
SEMPRO: Edit bab1.tex, bab2.tex
SEMHAS: Edit bab1.tex, bab2.tex, bab3.tex  
SIDANG: Edit bab1.tex s/d bab5.tex, lampiran.tex
```

### 3. Compile

**Otomatis (Recommended)**:
```sh
./build-thesis.sh sempro    # → sempro.pdf
./build-thesis.sh semhas    # → semhas.pdf
./build-thesis.sh sidang    # → sidang.pdf
./build-thesis.sh all       # → semua 3 PDF
```

**Manual**:
```sh
# Build thesis.pdf
xelatex thesis
bibtex thesis
xelatex thesis
xelatex thesis
```

## 📚 Dokumentasi Lengkap

- **QUICK-START.md** - Essential commands (2 menit)
- **README-UNIFIED.md** - Dokumentasi lengkap (10 menit)  
- **DOCS-INDEX.md** - Navigasi dokumentasi
- **SUBMIT_GUIDE.md** - Panduan submission ke FMIPA
- **SUBMISSION_CHECKLIST.md** - Checklist lengkap sebelum submit ✅
- **CONTRIBUTING.md** - Cara berkontribusi ke project

## 📤 Submission ke FMIPA USK

Template ini sudah sesuai dengan [Panduan FMIPA Unsyiah](https://fmipa.usk.ac.id/web/documents/).

### Quick Submission
```sh
./prepare-submission.sh  # Compile & package untuk submit
```

### Upload ke SIMATA
1. Login: https://fmipa.usk.ac.id/simata/login
2. Upload PDF + supporting docs
3. Lihat checklist lengkap di **SUBMIT_GUIDE.md**

### Verifikasi Compliance
- ✅ Format margin, font, spacing sesuai panduan
- ✅ Struktur: Cover → Pengesahan → BAB I-V → Daftar Pustaka
- ✅ Bibliography APA style
- ✅ PDF compile tanpa error

## 📦 Instalasi XeLaTeX

```sh
# macOS
brew install --cask mactex-no-gui

# Linux (Ubuntu/Debian)
sudo apt install texlive-xetex biber
```

## 🎯 Mode System

| Mode | Konten | Output |
|------|--------|--------|
| SEMPRO | Bab 1-3 | sempro.pdf |
| SEMHAS | Abstrak + Bab 1-5 + Lampiran | semhas.pdf |
| SIDANG | Abstrak + Bab 1-5 + Lampiran | sidang.pdf |

---

**Author**: BIRRUL WALIDAIN  
**GitHub**: [@birrulwldain](https://github.com/birrulwldain)  
**Repository**: https://github.com/birrulwldain/Tesis-26msi  
**Status**: 🟢 Ready for FMIPA Submission  
**Version**: 2.1  
**Last Updated**: November 18, 2025  
**Copyright**: © 2025 BIRRUL WALIDAIN  
**License**: MIT License

---

## 📚 Documentation Index

- **README.md** (this file) - Overview & quick start
- **SUBMIT_GUIDE.md** - Official FMIPA submission guide
- **SUBMISSION_CHECKLIST.md** - Pre-submission checklist
- **CONTRIBUTING.md** - How to contribute
- **PROJECT_SUMMARY.md** - What's new in v2.1
- **QUICK-START.md** - Essential commands
- **README-UNIFIED.md** - Full documentation

**Official Links**:
- FMIPA Documents: https://fmipa.usk.ac.id/web/documents/
- SIMATA Portal: https://fmipa.usk.ac.id/simata/login

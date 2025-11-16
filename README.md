# Template Tugas Akhir FMIPA Unsyiah - Unified System

Template LaTeX untuk penulisan tugas akhir di Universitas Syiah Kuala FMIPA yang telah disederhanakan menjadi **1 file utama dengan 3 mode kompilasi**.

Disesuaikan dengan aturan penulisan tugas akhir yang terdapat pada dokumen Panduan Tugas Akhir FMIPA Unsyiah tahun 2016.

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
```sh
./build-thesis.sh sempro    # → sempro.pdf
./build-thesis.sh semhas    # → semhas.pdf
./build-thesis.sh sidang    # → sidang.pdf
./build-thesis.sh all       # → semua 3 PDF
```

## 📚 Dokumentasi Lengkap

- **QUICK-START.md** - Essential commands (2 menit)
- **README-UNIFIED.md** - Dokumentasi lengkap (10 menit)  
- **DOCS-INDEX.md** - Navigasi dokumentasi

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
| SEMPRO | Bab 1-2 | sempro.pdf |
| SEMHAS | Bab 1-3 | semhas.pdf |
| SIDANG | Bab 1-5 + Lampiran | sidang.pdf |

---

**Status**: 🟢 Production Ready  
**Version**: 2.0 (Simplified)  
**Last Updated**: November 15, 2025

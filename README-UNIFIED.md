# UNIFIED THESIS TEMPLATE - QUICK START

## 📋 Penjelasan

Proyek ini telah disederhanakan menjadi **1 file utama** (`thesis.tex`) yang dapat dicompile dalam **3 mode berbeda**:

### Mode-Mode:

1. **SEMPRO** (Seminar Proposal)
   - Halaman: Sampul, Judul, Pernyataan Bebas Plagiasi, Abstrak
   - Isi: Bab 1-2 (Pendahuluan & Tinjauan Pustaka)
   - Output: `sempro.pdf`

2. **SEMHAS** (Seminar Hasil)
   - Halaman: Sampul, Judul, Pernyataan Bebas Plagiasi, Abstrak, Kata Pengantar, Daftar Isi/Gambar/Tabel
   - Isi: Bab 1-3 (Pendahuluan, Tinjauan Pustaka, Metodologi)
   - Output: `semhas.pdf`

3. **SIDANG** (Sidang Skripsi Lengkap)
   - Halaman: Sampul, Judul, Pernyataan, Abstrak, Kata Pengantar, Daftar Isi/Gambar/Tabel, Daftar Singkatan, Daftar Simbol
   - Isi: Bab 1-5 (Pendahuluan, Tinjauan Pustaka, Metodologi, Hasil & Pembahasan, Kesimpulan & Saran)
   - Lampiran (Appendix)
   - Output: `sidang.pdf`

## 🚀 Cara Compile

### Compile Semua Mode Sekaligus:
```bash
./build-thesis.sh all
# Akan menghasilkan: sempro.pdf, semhas.pdf, sidang.pdf
```

### Compile Mode Tertentu:
```bash
./build-thesis.sh sempro    # Generate sempro.pdf
./build-thesis.sh semhas    # Generate semhas.pdf
./build-thesis.sh sidang    # Generate sidang.pdf (default)
```

### Watch Mode (Auto-compile):
```bash
./build-thesis.sh watch
# File akan di-recompile otomatis saat ada perubahan
```

### Bersihkan File Temporary:
```bash
./build-thesis.sh clean
# Hapus .aux, .log, .bbl, dll
```

## 📁 Struktur File

```
thesis.tex                          # ← MAIN FILE (1 file untuk semua mode)
│
├── include/
│   ├── sampul-depan.tex           # Sampul
│   ├── abstrak-indonesia.tex      # Abstrak Indonesia
│   ├── abstrak-english.tex        # Abstrak English
│   ├── kata-pengantar.tex         # Kata Pengantar
│   ├── bab1.tex                   # Bab 1: Pendahuluan
│   ├── bab2.tex                   # Bab 2: Tinjauan Pustaka
│   ├── bab3.tex                   # Bab 3: Metodologi
│   ├── bab4.tex                   # Bab 4: Hasil & Pembahasan
│   ├── bab5.tex                   # Bab 5: Kesimpulan & Saran
│   ├── daftar-singkatan.tex       # Daftar Singkatan
│   ├── simbol.tex                 # Daftar Simbol
│   ├── lampiran.tex               # Lampiran/Appendix
│   ├── dafpus.tex                 # Daftar Pustaka
│   ├── bebas-plagiasi.tex         # Surat Pernyataan Bebas Plagiasi
│   ├── surat-pernyataan.tex       # Surat Pernyataan (untuk sidang)
│   └── markLampiran.tex
│
├── lib/
│   ├── usk-thesis-xelatex.sty # ← PACKAGE (mendukung 3 mode)
│   ├── unsyiah-thesis.sty         # pdfLaTeX alternative
│   ├── 1proposal.cls              # (legacy, masih ada)
│   ├── 2hasil.cls                 # (legacy, masih ada)
│   └── 3skripsi.cls               # (legacy, masih ada)
│
├── language/
│   └── hype.indonesia.tex         # Hyphenation settings
│
├── style/
│   ├── apa-good-2.bst             # APA bibliography style
│   └── jifbibstyle.bst
│
├── daftar-pustaka.bib             # Bibliography database
├── build-thesis.sh                # ← BUILD SCRIPT (baru, unified)
├── build-xelatex.sh               # (lama, untuk individual files)
├── clean.sh                       # Clean up script
└── README-UNIFIED.md              # Dokumentasi ini
```

## ⚙️ Edit Metadata

Buka `thesis.tex` dan edit bagian "METADATA" (baris ~110-130):

```latex
% JUDUL
\judul{Studi Komputasi Elektron Rydberg...}

% PENULIS
\penulis{Muhammad Birrulwldain}

% NIM
\nim{170601056}

% PROGRAM STUDI
\programstudi{Fisika}

% PEMBIMBING
\pembimbingi{Dr. Eng. Vebi Permadi, S.Si., M.Si.}
\pembimbingii{Dr. Suryanto, M.Si.}

% TANGGAL
\tanggal{15}{11}{2025}
```

## 📝 Edit Konten

### Untuk Mode SEMPRO:
- Edit: `include/bab1.tex`, `include/bab2.tex`
- Skip: bab3.tex, bab4.tex, bab5.tex, lampiran.tex (otomatis tidak disertakan)

### Untuk Mode SEMHAS:
- Edit: `include/bab1.tex`, `include/bab2.tex`, `include/bab3.tex`
- Skip: bab4.tex, bab5.tex, lampiran.tex (otomatis tidak disertakan)

### Untuk Mode SIDANG:
- Edit: semua `include/bab1.tex` s/d `include/bab5.tex`, `include/lampiran.tex`
- Semua otomatis disertakan

## 🔍 Cara Kerja Mode System

`thesis.tex` menggunakan **conditional compilation** dengan `\ifthenelse`:

```latex
% Bab 4 hanya di-compile untuk SIDANG
\ifdefined\thesismode
  \ifthenelse{\equal{\thesismode}{sidang}}{%
    \clearpage
    \input{bab4}
  }{}
\fi
```

Sistem ini memungkinkan:
- ✅ 1 file master untuk semua mode
- ✅ Metadata terpusat (tidak perlu edit 3 kali)
- ✅ Mudah maintenance dan version control
- ✅ Compiler berjalan otomatis sesuai mode

## 🎯 Quick Reference

| Task | Command |
|------|---------|
| Compile semua 3 output | `./build-thesis.sh all` |
| Compile hanya sidang | `./build-thesis.sh sidang` |
| Compile hanya sempro | `./build-thesis.sh sempro` |
| Compile hanya semhas | `./build-thesis.sh semhas` |
| Watch mode | `./build-thesis.sh watch` |
| Bersihkan temp files | `./build-thesis.sh clean` |

## ✅ Keuntungan Unified System

1. **Single Source of Truth** - Metadata di 1 tempat
2. **Easier Maintenance** - Edit sekali, berlaku untuk semua mode
3. **Version Control Friendly** - Lebih sedikit file = lebih sederhana
4. **Flexible** - Mudah menambah/mengurangi bab per mode
5. **Professional** - Sesuai dengan best practices LaTeX

## 🐛 Troubleshooting

### XeLaTeX tidak ditemukan
```bash
# Install MacTeX (macOS)
brew install --cask mactex-no-gui
```

### Biber tidak ditemukan
```bash
# Sudah termasuk dalam MacTeX
# Update TeX Live:
tlmgr update --all
```

### PDF tidak terbuat
```bash
# Lihat error detail:
xelatex -interaction=nonstopmode -file-line-error \
  -jobname=sidang "\def\thesismode{sidang}\input{thesis.tex}"
```

## 📞 Support

Untuk bantuan lebih lanjut, lihat dokumentasi:
- `lib/README-XELATEX.md` - XeLaTeX specific
- `lib/README-unsyiah-thesis.md` - Package API
- `XELATEX-SETUP.md` - Setup guide lengkap

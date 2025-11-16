# XeLaTeX Configuration Guide

## Overview

Sistem ini telah **dioptimalkan sepenuhnya untuk XeLaTeX** saja. XeLaTeX adalah implementasi modern dari LaTeX dengan dukungan penuh untuk Unicode dan OpenType fonts.

## 📋 File-File XeLaTeX

| File | Deskripsi |
|------|-----------|
| `lib/usk-thesis-xelatex.sty` | Paket utama yang dioptimalkan untuk XeLaTeX |
| `skripsi-xelatex.tex` | Template dokumen untuk XeLaTeX |
| `build-xelatex.sh` | Build script otomatis untuk XeLaTeX |
| `latexmkrc-xelatex` | Config file untuk latexmk dengan XeLaTeX |

## ✅ Keunggulan XeLaTeX

### 1. **Native Unicode Support**
- Tidak perlu paket `inputenc` atau font encoding
- UTF-8 langsung dari file sumber
- Support untuk semua karakter Unicode (Arabic, Chinese, Emoji, dll)

### 2. **OpenType Fonts**
- Akses penuh ke OpenType dan TrueType fonts
- Better typography dengan advanced font features
- Font dari sistem (macOS, Linux, Windows) langsung bisa pakai

### 3. **Better Rendering**
- Microtype support untuk better spacing
- Protrusion dan expansion untuk justification
- Better ligature handling

### 4. **Simpler Configuration**
```latex
% XeLaTeX (lebih simple)
\usepackage{fontspec}
\setmainfont{Cambria}

% vs pdfLaTeX (lebih kompleks)
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{times}
```

## 🚀 Quick Start

### Setup XeLaTeX (Jika belum ada)

**macOS (dengan Homebrew):**
```bash
brew install mactex
# atau
brew install basictex  # Ukuran lebih kecil
```

**Linux (Debian/Ubuntu):**
```bash
sudo apt-get install texlive-xetex texlive-fonts-recommended texlive-fonts-extra
```

**macOS (Recommended):**
```bash
# Full TeX Live dengan GUI
# Download dari https://tug.org/mactex/
```

### Compile Document

**Opsi 1: Menggunakan build script**
```bash
bash build-xelatex.sh skripsi-xelatex.tex
```

**Opsi 2: Menggunakan xelatex langsung**
```bash
xelatex skripsi-xelatex.tex
biber skripsi-xelatex
xelatex skripsi-xelatex.tex
xelatex skripsi-xelatex.tex
```

**Opsi 3: Menggunakan latexmk**
```bash
latexmk -xelatex skripsi-xelatex.tex
```

**Opsi 4: Watch mode (auto-compile)**
```bash
bash build-xelatex.sh skripsi-xelatex.tex --watch
```

## 🎯 Key Differences dari pdfLaTeX

### XeLaTeX vs pdfLaTeX

| Feature | XeLaTeX | pdfLaTeX |
|---------|---------|----------|
| **Compiler** | `xelatex` | `pdflatex` |
| **Unicode** | Native | Via `inputenc` |
| **Font Encoding** | Automatic | Via `fontenc` |
| **OpenType Fonts** | ✅ Full support | ⚠️ Limited |
| **System Fonts** | ✅ Direct access | ❌ Requires conversion |
| **Hyphenation** | Via `polyglossia` | Via `babel` |
| **Speed** | Slightly slower | Faster |
| **Output Quality** | Excellent | Good |

### Perbedaan Kode

**pdfLaTeX Style:**
```latex
\documentclass{report}
\usepackage[utf8]{inputenc}      % Input encoding
\usepackage[T1]{fontenc}         % Font encoding
\usepackage[bahasa]{babel}       % Language
\usepackage{times}               % Font selection
```

**XeLaTeX Style:**
```latex
\documentclass{report}
% No inputenc atau fontenc needed!
\usepackage{fontspec}            % Untuk font selection
\usepackage{polyglossia}         % Better language support
\setmainfont{Cambria}            % Direct font selection
```

## 🔤 Font Configuration

### Default Fonts dalam `usk-thesis-xelatex.sty`

```latex
\setmainfont[
  Ligatures=TeX,
  Extension=.otf,
]{Cambria}           % Serif font (elegant)

\setsansfont{Calibri}     % Sans-serif font

\setmonofont[
  Scale=0.9
]{Inconsolata}       % Monospace (untuk code)
```

### Mengubah Font

```latex
% Di preamble setelah \usepackage{usk-thesis-xelatex}

% Option 1: Simple
\setmainfont{Times New Roman}

% Option 2: Advanced dengan options
\setmainfont[
  Path=/path/to/fonts/,
  Extension=.otf,
  UprightFont=*-Regular,
  BoldFont=*-Bold,
  ItalicFont=*-Italic,
  BoldItalicFont=*-BoldItalic,
]{MyFont}

% Option 3: Fallback fonts
\newfontfamily{\fallbackfont}{DejaVu Sans}
```

### Font Options di Paket

```latex
\usepackage[thesis,indonesia,times]{usk-thesis-xelatex}
```

Namun fitur ini belum implemented - bisa di-customize manual.

### Recommended Fonts untuk Academic Work

```latex
% Professional Serif
\setmainfont{Cambria}              % Microsoft Office standard
\setmainfont{Minion Pro}           % Adobe's professional font
\setmainfont{Garamond}             % Classic choice

% Modern Serif
\setmainfont{Roboto Slab}
\setmainfont{IBM Plex Serif}

% System Fonts (macOS)
\setmainfont{Helvetica Neue}       % Sans-serif
\setmainfont[Extension=.ttf]{Menlo} % Monospace
```

## 📚 Polyglossia untuk Hyphenation

XeLaTeX menggunakan `polyglossia` untuk language support (bukan `babel`):

```latex
\usepackage{polyglossia}
\setdefaultlanguage{bahasai}        % Indonesian
\setotherlanguage{english}          % English secondary

% Untuk switch language dalam dokumen
\foreignlanguage{english}{English text here}
```

Ini sudah otomatis di `usk-thesis-xelatex.sty`.

## 🛠️ Customization

### Ubah Main Font

Edit di preamble `skripsi-xelatex.tex`:

```latex
\usepackage{fontspec}
\setmainfont{Palatino}  % Ganti dengan font pilihan
```

### Ubah Margin

```latex
\usepackage[a4paper,left=4cm,right=2.5cm,top=3cm,bottom=3cm]{geometry}
```

### Ubah Spacing

```latex
\onehalfspacing      % 1.5 spasi
\doublespacing       % 2 spasi  
\singlespacing       % 1 spasi
```

### Advanced Font Features

```latex
% Enable ligatures
\setmainfont[
  Ligatures={Common,Contextual,Rare},
]{Cambria}

% Stylistic sets
\setmainfont[
  StylisticSet=1,
]{Cambria}

% Small caps
{\scshape Small capitals text}

% Old style figures
{\oldstylenums 12345}
```

## 🔍 Troubleshooting

### Error: "Font not found"

**Problem:** Font tidak ditemukan saat compile

**Solutions:**
```bash
# 1. List available system fonts
fc-list | grep -i cambria

# 2. Specify font path explicitly
\setmainfont[Path=/path/to/fonts/]{FontName}

# 3. Use fallback font
\setmainfont{DejaVu Serif}
```

### Error: "File not found for biber"

**Problem:** Biber tidak menemukan file `.bcf`

**Solution:**
```bash
# Pastikan format compile benar
xelatex skripsi-xelatex.tex
biber skripsi-xelatex  # Bukan skripsi-xelatex.tex
```

### Slow Compile Time

**Solutions:**
```bash
# 1. Draft mode (faster)
xelatex -interaction=nonstopmode --shell-escape skripsi-xelatex.tex

# 2. Use draft option
\documentclass[draft]{report}

# 3. Disable some features temporarily
\usepackage[nocolor]{usk-thesis-xelatex}
```

### Bibliography tidak muncul

**Solution:**
```bash
# Harus jalankan 3 steps:
xelatex skripsi-xelatex.tex
biber skripsi-xelatex
xelatex skripsi-xelatex.tex    # Sekali sudah cukup jika biber berhasil
xelatex skripsi-xelatex.tex    # Kedua kali untuk cross-references
```

## 📊 Performance Tips

### 1. Faster Compilation
```bash
# Use -interaction=nonstopmode untuk skip error dialogs
xelatex -interaction=nonstopmode skripsi-xelatex.tex

# Atau gunakan draft mode
\documentclass[draft]{report}
```

### 2. Selective Compilation
```bash
# Compile hanya sampai bab tertentu
\usepackage{docmute}  % atau endinput
\end{document}
```

### 3. Caching Fonts
XeLaTeX automatically caches font metadata:
```bash
# Clear cache if needed
rm -rf ~/.cache/fontconfig
fc-cache -f
```

## 🎓 Academic Best Practices

### 1. Consistent Spacing
```latex
\onehalfspacing  % Recommended untuk academic work
```

### 2. Proper Bibliography
```latex
\usepackage[style=apa, backend=biber]{biblatex}
```

### 3. Microtype untuk Typography
Sudah included di `usk-thesis-xelatex.sty`

### 4. Listings untuk Code
```latex
\usepackage{listings}
\lstset{basicstyle=\ttfamily}
```

## 📖 Further Reading

- **XeLaTeX Manual**: `texdoc xetex`
- **Fontspec Guide**: `texdoc fontspec`
- **Polyglossia Guide**: `texdoc polyglossia`
- **TUG Resources**: https://tug.org/

## ⚡ Build Script Usage

```bash
# Normal build
bash build-xelatex.sh skripsi-xelatex.tex

# Watch mode (auto-recompile on changes)
bash build-xelatex.sh skripsi-xelatex.tex --watch

# Draft mode (faster, skip biber)
bash build-xelatex.sh skripsi-xelatex.tex --draft

# Clean temporary files
bash build-xelatex.sh skripsi-xelatex.tex --clean
```

## 🎯 Recommended Workflow

1. **Setup**
   ```bash
   bash build-xelatex.sh skripsi-xelatex.tex --clean
   ```

2. **Development (with watch mode)**
   ```bash
   bash build-xelatex.sh skripsi-xelatex.tex --watch
   ```

3. **Final Build**
   ```bash
   bash build-xelatex.sh skripsi-xelatex.tex
   ```

4. **Cleanup before submission**
   ```bash
   bash build-xelatex.sh skripsi-xelatex.tex --clean
   ```

---

**Status**: ✅ Fully optimized for XeLaTeX!

Sistem ini **hanya perlu XeLaTeX** - tidak perlu pdfLaTeX atau kompiler lain!

# Dokumentasi Paket usk-thesis.sty

## Daftar Isi
1. [Pengenalan](#pengenalan)
2. [Instalasi](#instalasi)
3. [Quick Start](#quick-start)
4. [Opsi Paket](#opsi-paket)
5. [Commands dan Metadata](#commands-dan-metadata)
6. [Environment Khusus](#environment-khusus)
7. [Customization](#customization)
8. [Troubleshooting](#troubleshooting)

---

## Pengenalan

**usk-thesis.sty** adalah paket LaTeX modern untuk memudahkan penulisan skripsi, proposal, dan laporan hasil di Universitas Syiah Kuala. Paket ini dirancang berdasarkan panduan penulisan tugas akhir FMIPA USK dan sudah menyertakan:

- Layout dan margin sesuai standar
- Header/Footer otomatis
- Penomoran chapter menggunakan Romawi
- Daftar isi, tabel, gambar, dan lampiran
- Support multilingual (Indonesia/Inggris)
- Caption dan listing configurations
- Theorem dan definition environments

**Keunggulan:**
- ✅ Lebih sederhana dibanding `.cls`
- ✅ Modular dan mudah dikustomisasi
- ✅ Kompatibel dengan `report` document class
- ✅ Support bibliography dengan `biblatex`
- ✅ Multilingual (Indonesian/English)

---

## Instalasi

### Cara 1: Copy ke folder lokal (Recommended)

```bash
# Copy file usk-thesis.sty ke folder lib/ proyek Anda
cp lib/usk-thesis.sty /path/to/your/project/lib/

# Atau copy ke folder texmf lokal (untuk semua proyek)
mkdir -p ~/texmf/tex/latex/usk
cp lib/usk-thesis.sty ~/texmf/tex/latex/usk/
```

### Cara 2: Install global ke TeX Live (macOS)

```bash
sudo cp lib/usk-thesis.sty /usr/local/texlive/2023/texmf-dist/tex/latex/
mktexlsr
```

---

## Quick Start

### Minimal Document

```latex
\documentclass{report}
\usepackage{usk-thesis}

\judulcover{Judul Skripsi}
\fullname{Nama Anda}
\idnum{NPM Anda}
\dept{Fisika}
\prodi{Sarjana Fisika}
\firstsupervisor{Nama Pembimbing I}
\firstnip{NIP Pembimbing I}

\begin{document}

\cover
\approvalpage

\tableofcontents

\chapter{Pendahuluan}
Isi bab pendahuluan...

\chapter{Tinjauan Pustaka}
Isi tinjauan pustaka...

\end{document}
```

### Dengan Abstrak dan Paket Lengkap

Lihat file `skripsi-clean.tex` untuk template lengkap dengan semua fitur.

---

## Opsi Paket

### 1. Jenis Dokumen
```latex
\usepackage[thesis]{usk-thesis}      % Skripsi lengkap (default)
\usepackage[proposal]{usk-thesis}    % Proposal penelitian
\usepackage[hasil]{usk-thesis}       % Laporan hasil
```

### 2. Bahasa
```latex
\usepackage[indonesia]{usk-thesis}   % Bahasa Indonesia (default)
\usepackage[inggris]{usk-thesis}     % Bahasa Inggris
```

### 3. Kombinasi Opsi
```latex
% Proposal dengan bahasa Inggris
\usepackage[proposal,inggris]{usk-thesis}

% Laporan hasil dengan bahasa Indonesia
\usepackage[hasil,indonesia]{usk-thesis}
```

---

## Commands dan Metadata

Atur metadata dokumen Anda sebelum `\begin{document}`:

### Judul
```latex
\judulcover{Judul untuk cover}
\judul{Judul lengkap Indonesia}
\judulinggris{English Title}
```

### Data Penulis
```latex
\fullname{Nama Lengkap Penulis}
\idnum{NPM atau NIM}
\degree{Sarjana Sains}
\yearsubmit{Mei, 2025}
```

### Program Studi
```latex
\dept{Fisika}              % Departemen/Jurusan
\prodi{Sarjana Fisika}    % Program studi
```

### Pembimbing (Supervisor)
```latex
\firstsupervisor{Prof. Dr. Nama Pembimbing I}
\firstnip{NIP Pembimbing I}
\firstdept{Fisika}

\secondsupervisor{Dr. Nama Pembimbing II}
\secondnip{NIP Pembimbing II}
\seconddept{Teknik Komputer}
```

### Pejabat Penandatangan
```latex
\dekan{Prof. Dr. Nama Dekan}
\dekannip{NIP Dekan}

\kaprodi{Dr. Nama Koordinator Prodi}
\kaprodinip{NIP Koordinator Prodi}
```

### Tanggal Persetujuan
```latex
\approvaldate{Kamis, 14 Mei 2024}
```

---

## Environment Khusus

### Abstrak Indonesia
```latex
\begin{abstractind}
Isi abstrak dalam bahasa Indonesia...

\bigskip
\noindent
\textbf{Kata kunci:} kata1, kata2, kata3.
\end{abstractind}
```

### Abstrak Inggris
```latex
\begin{abstracteng}
Content of abstract in English...

\bigskip
\noindent
\textbf{Keywords:} keyword1, keyword2, keyword3.
\end{abstracteng}
```

### Kata Pengantar / Preface
```latex
\begin{preface}
Isi kata pengantar...
\end{preface}
```

### Ucapan Terima Kasih
```latex
\begin{acknowledgment}
Isi ucapan terima kasih...
\end{acknowledgment}
```

---

## Customization

### Mengubah Warna

```latex
% Di preamble (setelah \usepackage{usk-thesis})
\definecolor{mycolor}{RGB}{50,150,200}
\lstset{keywordstyle=\color{mycolor}}
```

### Mengubah Margin

```latex
% Di preamble
\usepackage[a4paper,left=4cm,right=2.5cm,top=3cm,bottom=3cm]{geometry}
```

### Mengubah Font

```latex
% Menggunakan font sans-serif
\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
```

### Mengubah Spacing

```latex
\onehalfspacing    % 1.5 spasi
\doublespacing     % 2 spasi
\singlespacing     % 1 spasi
```

---

## Structure Proyek Recommended

```
my-thesis/
├── lib/
│   └── usk-thesis.sty          ← Copy paket di sini
├── include/
│   ├── bab1.tex                    ← Bab 1-5
│   ├── bab2.tex
│   ├── bab3.tex
│   ├── bab4.tex
│   ├── bab5.tex
│   ├── abstrak-indonesia.tex
│   ├── abstrak-english.tex
│   ├── kata-pengantar.tex
│   ├── lampiran.tex
│   └── ...
├── language/
│   └── hype.indonesia.tex          ← Hyphenation rules
├── images/
│   ├── logo_usk.png
│   └── ...
├── style/
│   ├── apa-good-2.bst
│   └── jifbibstyle.bst
├── daftar-pustaka.bib              ← Bibliography file
├── skripsi-clean.tex               ← Main document (copy ini)
└── clean.sh                        ← Cleanup script
```

---

## Troubleshooting

### Error: "File not found: usk-thesis.sty"

**Solusi:**
```bash
# Pastikan path sudah benar di preamble
\makeatletter
\def\input@path{{lib/}{language/}{include/}}
\makeatother
```

Atau gunakan full path:
```latex
\usepackage{/Users/yourname/Projects/thesis/lib/usk-thesis}
```

### Chapter heading tidak centered

Pastikan menggunakan `\MakeUppercase` di `\chapter`:
```latex
\MakeUppercase{\large{\bfseries JUDUL BAB}}
```

### Daftar Isi tidak muncul dengan benar

Compile berkali-kali:
```bash
pdflatex skripsi-clean.tex
biber skripsi-clean
pdflatex skripsi-clean.tex
pdflatex skripsi-clean.tex
```

### Logo tidak ditemukan

Pastikan ada file `images/logo_usk.png`. Jika tidak ada, buat dummy:
```bash
convert -size 400x400 xc:white images/logo_usk.png
```

Atau gunakan ImageMagick/GIMP untuk membuat logo.

---

## Versi dan Update

- **v2.0** (2025-01-01): Konversi dari `.cls` ke `.sty`, modernisasi struktur
- **v1.1** (2023-09-08): Initial class version

---

## Support dan Kontribusi

Untuk laporan bug atau request fitur, silakan hubungi:
- Author: Abdul Hafidh, Birrul Walidain
- Email: [contact info jika diperlukan]

---

## License

Paket ini tersedia di bawah lisensi MIT. Silakan gunakan, modifikasi, dan distribusikan sesuai kebutuhan.

# NOMENCL SYMBOL LIST - PANDUAN LENGKAP

Template Anda sudah dilengkapi dengan **automatic symbol list generation** menggunakan paket `nomencl`. Fitur ini memungkinkan Anda mendefinisikan simbol di tempat ia digunakan, dan sistem akan otomatis mengumpulkan, mengurutkan abjad, dan menampilkan semuanya di "DAFTAR SIMBOL".

---

## 📋 Apa itu Nomenclature?

Nomenclature (Nomenklatur) adalah fitur otomatis di LaTeX yang:
- ✅ Mengumpulkan semua simbol dari seluruh dokumen
- ✅ Mengurutkan abjad secara otomatis
- ✅ Menampilkan definisi setiap simbol
- ✅ Mirip dengan `\listofcontents`, `\listoffigures`, dll.

---

## 🚀 Cara Penggunaan

### 1. Definisikan Simbol di Dalam Bab

Di mana pun Anda pertama kali menggunakan simbol, tambahkan perintah `\nomenclature`:

```latex
% Dalam bab1.tex, saat pertama kali memperkenalkan simbol:
\nomenclature{$\alpha$}{Sudut fase (radian)}
\nomenclature{$f$}{Frekuensi (Hz)}
\nomenclature{$\lambda$}{Panjang gelombang (nm)}
```

**Catatan**: Letakkan `\nomenclature` setelah baris pertama kali simbol muncul di teks.

### 2. Compile dengan Prosedur Khusus

Nomenclature memerlukan 3 langkah compile:

**Opsi A: Gunakan Script Otomatis (RECOMMENDED)**
```bash
./prepare-submission.sh
```
Script ini otomatis menjalankan:
1. xelatex (1st pass)
2. bibtex
3. makeindex untuk nomenclature
4. xelatex (2nd & 3rd pass)

**Opsi B: Manual Compile**
```bash
# Langkah 1: XeLaTeX first pass
xelatex thesis

# Langkah 2: BibTeX untuk bibliography
bibtex thesis

# Langkah 3: PENTING! Makeindex untuk simbol
makeindex thesis.nlo -s nomencl.ist -o thesis.nls

# Langkah 4-5: XeLaTeX kedua dan ketiga
xelatex thesis
xelatex thesis
```

⚠️ **PENTING**: Jangan lewatkan langkah `makeindex` - tanpa ini simbol tidak akan muncul!

---

## 📝 Contoh Lengkap

### Contoh Dalam Bab (bab1.tex):

```latex
\chapter{Pendahuluan}

Dalam penelitian ini, kami menggunakan frekuensi $f$ yang sangat tinggi.
\nomenclature{$f$}{Frekuensi (Hz)}

Sudut fase $\alpha$ ditentukan oleh persamaan berikut:
\nomenclature{$\alpha$}{Sudut fase (radian)}

\begin{equation}
\alpha = 2\pi f t
\end{equation}

Panjang gelombang $\lambda$ didefinisikan sebagai:
\nomenclature{$\lambda$}{Panjang gelombang (nm)}

\begin{equation}
\lambda = \frac{c}{f}
\end{equation}
```

### Hasil di DAFTAR SIMBOL:

```
DAFTAR SIMBOL

α    Sudut fase (radian)
f    Frekuensi (Hz)
λ    Panjang gelombang (nm)
```

(Otomatis terurut abjad!)

---

## 🎯 Best Practices

### ✅ DO's:

- ✅ Definisikan simbol **sekali saja** (pada penggunaan pertama)
- ✅ Gunakan format yang jelas: `\nomenclature{simbol}{deskripsi lengkap}`
- ✅ Sertakan **unit/satuan** dalam deskripsi jika ada
- ✅ Gunakan **bold** untuk simbol: `\nomenclature{\textbf{x}}{...}`
- ✅ Kelompokkan simbol berdasarkan bab (mudah dicari)

### ❌ DON'Ts:

- ❌ Jangan definisikan simbol **lebih dari satu kali**
- ❌ Jangan lupa langkah `makeindex` saat compile
- ❌ Jangan gunakan simbol yang tidak didefinisikan
- ❌ Jangan letakkan `\nomenclature` di dalam environment math

---

## 📚 Template Siap Pakai

### Untuk Konstanta Fisika:

```latex
\nomenclature{$c$}{Kecepatan cahaya ($3 \times 10^8$ m/s)}
\nomenclature{$h$}{Konstanta Planck ($6.626 \times 10^{-34}$ J·s)}
\nomenclature{$k_B$}{Konstanta Boltzmann ($1.381 \times 10^{-23}$ J/K)}
```

### Untuk Variabel Matematika:

```latex
\nomenclature{$x$}{Variabel independen}
\nomenclature{$y$}{Variabel dependen}
\nomenclature{$\theta$}{Parameter sudut (radian)}
```

### Untuk Notasi Khusus:

```latex
\nomenclature{$\mathbf{F}$}{Vektor gaya (N)}
\nomenclature{$\nabla$}{Operator gradien}
\nomenclature{$\int$}{Operator integral}
```

---

## 🔧 Troubleshooting

### Problem: "DAFTAR SIMBOL" kosong atau tidak muncul

**Solusi**:
1. Pastikan Anda menjalankan `makeindex thesis.nlo -s nomencl.ist -o thesis.nls`
2. Cek bahwa file `thesis.nlo` ada (hasil dari compile pertama)
3. Pastikan ada minimal 1 perintah `\nomenclature{}{}` di dokumen

### Problem: Simbol tidak terurut abjad

**Solusi**:
- Bersihkan file kompilasi lama: `./clean.sh`
- Compile ulang dari awal dengan semua langkah

### Problem: makeindex: command not found

**Solusi**:
- Linux/Mac: `sudo apt install texlive-extra-utils` atau `brew install texlive`
- Windows: Reinstall MiKTeX dengan opsi "Install missing packages on-the-fly"

---

## 📖 Referensi Lebih Lanjut

- **Dokumentasi nomencl**: `texdoc nomencl` (di terminal)
- **LaTeX Wikipedia**: https://en.wikipedia.org/wiki/LaTeX#Nomenclature
- **Overleaf Guide**: https://www.overleaf.com/learn/latex/Glossaries

---

## 📞 Bantuan

Jika ada pertanyaan atau issues:
1. Baca `include/simbol.tex` untuk contoh lengkap
2. Lihat `include/bab1.tex` untuk contoh penggunaan
3. Hubungi: [@birrulwldain](https://github.com/birrulwldain)
4. Repository: https://github.com/birrulwldain/Tesis-26msi

---

**Version**: 1.0  
**Last Updated**: November 23, 2025  
**Author**: BIRRUL WALIDAIN  
**License**: MIT

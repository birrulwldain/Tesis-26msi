# Kandidat Gambar Bab II — Sumber, Lisensi, dan Penempatan
Diekstrak (300 dpi) dari PDF di `daftar-pustaka/`. Semua dari sumber open-access/CC BY atau paper sendiri — aman dipakai di tesis dengan atribusi "Sumber: ... (lisensi CC BY)" di caption.

| File | Sumber & lisensi | Tempat di Bab II | Saran caption |
|---|---|---|---|
| `wang2024_fig2_timeresolved.png` | Wang et al. 2024, *Phys. Plasmas* — **CC BY** | §2.2.2 Pembentukan Plasma LIBS | Evolusi temporal spektrum emisi plasma Cu pada delay 5, 10, dan 15 µs; intensitas garis meluruh seiring pendinginan plasma. Sumber: \citep{wang_simulation_2024}, CC BY. |
| `manelski2024_fig8_te_ne_delay.png` | Manelski et al. 2024, *Spectrochim. Acta B* — open access | §2.2.4 LTE (jendela waktu LTE) | Penurunan $T_e$ (biru) dan $n_e$ (merah) terhadap waktu tunda pada plasma LIBS; menunjukkan jendela temporal tempat asumsi LTE diverifikasi. Sumber: \citep{manelski_libs_2024}. |
| `wang2024_fig4_boltzmann.png` | Wang et al. 2024 — **CC BY** | §2.6.4 Boltzmann Plot | Contoh \textit{Boltzmann plot} pada empat waktu tunda; kemiringan regresi memberikan estimasi $T_e$ dengan $R^2$ tinggi. Sumber: \citep{wang_simulation_2024}, CC BY. |
| `walidain2026_fig2_peakmatch.png` | Walidain et al. 2026 — **paper sendiri** | §2.6.2 Peak Detection & Kecocokan Garis | Identifikasi puncak emisi tervalidasi NIST ASD pada sampel herbal: (a) garis Mg 279,5/280,3 nm; (b) doublet Na 589,0/589,6 nm. Sumber: \citep{walidain_informer-based_2026}. |
| `walidain2026_fig1_informer.png` | Walidain et al. 2026 — **paper sendiri** | §2.5.3 Informer | Arsitektur Informer ber-\textit{ProbSparse self-attention} untuk klasifikasi spektrum LIBS 4096 kanal. Sumber: \citep{walidain_informer-based_2026}. |
| `liu2026_fig3_transcnn.png` | Liu et al. 2026, *AIP Advances* — **CC BY** | §2.7.2 Penelitian ML/DL (atau §2.5.2 Transformer) | Kerangka TransCNN-LIBS: prapemrosesan wavelet, blok \textit{multi-head attention}, dan lapisan konvolusi untuk kuantifikasi unsur jejak. Sumber: \citep{liu_remote_2026}, CC BY. |
| `favre2025_fig7_libs_setup.png` | Favre et al. 2025, *J. Quant. Spectrosc. Radiat. Transfer* — **CC BY** | §2.2.1 Prinsip Dasar LIBS | Skema tipikal sistem eksperimen LIBS: laser berdenyut → optik pemfokus → ruang ablasi sampel → serat optik → spektrometer Czerny-Turner → iCCD. Sumber: \citep{favre_merlin_2025}, CC BY. |
| `libs_schematic.png` | Qusthalani et al. 2025, *Makara J. Sci.* — **open access** | §2.2.1 (setelah Gambar 2.2) | Skema setup eksperimen LIBS penelitian ini: Nd:YAG 1064~nm/114~mJ pada atmosfer terbuka dengan koleksi emisi melalui sistem lensa dan serat optik ke spektrometer \textit{Mechelle}. Sumber: \citep{qusthalani_comparing_2025}. |
| `favre2025_fig16_spectra_expvsmerlin.png` | Favre et al. 2025, *J. Quant. Spectrosc. Radiat. Transfer* — **CC BY** | §2.7.1 Penelitian Fisika Plasma | Perbandingan spektrum eksperimental (titik hitam) vs simulasi MERLIN (garis merah) baja Eurofer97 pada 650–720 nm untuk 4 waktu tunda; memvalidasi akurasi basis data sintetis LTE. Sumber: \citep{favre_merlin_2025}, CC BY. |

## Gambar yang masih KOSONG dan sebaiknya DIBUAT SENDIRI (bukan dari paper)
1. ~~**§2.2.1 Skema prinsip LIBS**~~ — **SELESAI**: menggunakan favre2025_fig7_libs_setup.png untuk skema umum dan libs_schematic.png untuk skema eksperimen tesis ini.
2. **§2.3.6 Spektrum mono vs poliatomik** — INI GAMBAR PALING PENTING untuk tesis (ilustrasi Pers. 2.10): panel spektrum 7 unsur tunggal + spektrum campuran hasil superposisi. Buat dari simulator sendiri — sekaligus jadi Fig. 1 artikel jurnal.
3. **§2.3.4–2.3.5 Profil Gaussian/Lorentzian/Voigt** — mudah dibuat sendiri (matplotlib); `images/examples/example_broadening.png` bisa jadi basis.
4. **§2.5.5 Skema cross-attention mono→poli** — adaptasi dari `images/Arsitektur-CNN-Trans.png` (jangan pakai figur orang lain untuk arsitektur yang diusulkan).

## Snippet LaTeX siap pakai (contoh)
```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{images/bab2/manelski2024_fig8_te_ne_delay.png}
    \caption{Penurunan temperatur plasma $T_e$ (biru) dan densitas elektron $n_e$ (merah)
    terhadap waktu tunda pada eksperimen LIBS terselesaikan-waktu, yang menunjukkan
    jendela temporal validitas asumsi LTE \citep[diadaptasi dari][]{manelski_libs_2024}.}
    \label{fig:bab2_te_ne_delay}
\end{figure}
```

## Catatan lisensi
- **CC BY** (Wang 2024, Liu 2026): boleh direproduksi dengan atribusi penuh — sebutkan sumber + lisensi di caption.
- **Open access Elsevier** (Manelski 2024): cek jenis lisensi pasti di halaman artikel (CC BY vs CC BY-NC-ND); praktik umum tesis (non-komersial, dengan sitasi "diadaptasi dari") aman, tetapi untuk artikel jurnal perlu cek ulang.
- **Paper sendiri** (Walidain 2026): bebas; untuk versi IOP in-press, hak penggunaan di tesis penulis dijamin kebijakan IOP.
- PDF berlisensi tertutup (Cristoforetti, Tang & Zhao, Hao, Fujimoto) sengaja TIDAK diekstrak.

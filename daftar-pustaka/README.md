# Daftar Pustaka - Korelasi File dan BibTeX

Folder ini menyimpan lampiran referensi yang berkaitan dengan entri pada `daftar-pustaka.bib`.

## Catatan Struktur

- Saat ini semua file referensi sudah diratakan dan berada langsung di folder ini.
- Sebelumnya file-file tersebut berada di bawah `daftar-pustaka/files/<nomor>/`.
- Field `file = {...}` di `daftar-pustaka.bib` masih mencerminkan path lama tersebut sebagai jejak historis.
- Tidak semua entri di `daftar-pustaka.bib` memiliki file lokal. Itu wajar.

## Cara Membaca Korelasi

- Nama file lokal biasanya mengikuti judul artikel dan nama penulis.
- Kunci BibTeX adalah penanda utama yang dipakai di naskah, misalnya `\cite{zhang_dual-branch_2025}`.
- Jika sebuah entri tidak punya file lokal, entri itu tetap valid di `daftar-pustaka.bib` dan bisa tetap dipakai untuk sitasi.

## Pemetaan File Lokal ke BibTeX

| File lokal | BibTeX key | Keterangan singkat |
| --- | --- | --- |
| `Babos et al. - 2024 - Laser-induced breakdown spectroscopy as an analytical tool for total carbon quantification in tropic.pdf` | `babos_laser-induced_2024` | LIBS dan analisis tanah |
| `Brault et al. - 2026 - Quantitative analysis of TiO 2 formation on TA6V terrestrial atmospheric re-entries Cross compariso.pdf` | `brault_quantitative_2026` | Reentry dan CF-LIBS |
| `Bultel et al. - 2025 - THE MCWHIRTER CRITERION REVISITED FOR LASER-INDUCED PLASMAS.pdf` | `bultel_mcwhirter_2025` | McWhirter criterion |
| `Cristoforetti et al. - 2010 - Local Thermodynamic Equilibrium in Laser-Induced Breakdown Spectroscopy Beyond the McWhirter criter.pdf` | `cristoforetti_local_2010` | LTE pada LIBS |
| `Favre et al. - 2025 - MERLIN, an adaptative LTE radiative transfer model for any mixture Validation on Eurofer97 in argon.pdf` | `favre_merlin_2025` | Model RTE dan LTE |
| `Favre et al. - 2025 - Towards real-time calibration-free LIBS supported by machine learning.pdf` | `favre_towards_2025` | CF-LIBS dan machine learning |
| `Fritzsche - 2025 - Atomic input for modeling ionic mixtures in astrophysical plasma.pdf` | `fritzsche_atomic_2025` | Data atomik plasma |
| `Fujimoto - 2004 - Plasma spectroscopy.pdf` | `fujimoto_plasma_2004` | Buku dasar spektroskopi plasma |
| `Gao et al. - 2025 - Machine learning-based prediction of laser ablation impulse from plasma spectra.pdf` | `gao_machine_2025` | Machine learning dari spektrum plasma |
| `Hansen et al. - 2021 - Modeling of time-resolved LIBS spectra obtained in Martian atmospheric conditions with a stationary.pdf` | `hansen_modeling_2021` | Two-zone dan self-absorption |
| `Hao et al. - 2024 - Machine learning in laser-induced breakdown spectroscopy A review.pdf` | `hao_machine_2024` | Tinjauan ML pada LIBS |
| `Legnaioli et al. - 2025 - Laser-Induced Breakdown Spectroscopy Analysis of Lithium A Comprehensive Review.pdf` | `legnaioli_laser-induced_2025` | Review LIBS untuk litium |
| `Leistikow et al. - 2026 - Quantification of spacecraft heatshield contaminants seen in reentry shock layer emissions using cal.pdf` | `leistikow_quantification_2026` | CF-LIBS pada heatshield |
| `Liu et al. - 2026 - Remote LIBS based on transformer-CNN method for quantitative analysis of trace elements in steel.pdf` | `liu_remote_2026` | Transformer-CNN untuk LIBS |
| `Manelski et al. - 2024 - LIBS plasma diagnostics with SuperCam on Mars Implications for quantification of elemental abundanc.pdf` | `manelski_libs_2024` | Diagnostik plasma di Mars |
| `Manzoor et al. - 2025 - A machine learning assisted approach to classify rose species and varieties with laser induced break.pdf` | `manzoor_machine_2025` | Klasifikasi berbasis LIBS |
| `Rodríguez et al. - 2021 - MIXKIPRAPCAL A Computational Package for Integrated Simulations of Large-Scale Atomic Kinetics and.pdf` | `rodriguez_mixkiprapcal_2021` | Kinetika atomik dan RTE |
| `S2352012425012688.html` | `wu_novel_2025` | Snapshot HTML dari artikel Structures |
| `Tang and Zhao - 2024 - A Review of Development in the Research of Self-Absorption on Laser-Induced Breakdown Spectroscopy.pdf` | `tang_review_2024` | Review self-absorption |
| `Walidain et al. - 2026 - Informer-Based LIBS for Qualitative Multi-Element Analysis of an Aceh Traditional Women’s Medicine.pdf` | `walidain_informer-based_2026` | Aplikasi LIBS lokal |
| `Wang et al. - 2024 - Simulation of laser-induced plasma temperature based on machine learning.pdf` | `wang_simulation_2024` | Prediksi temperatur plasma |
| `Zaitsev et al. - 2024 - Two-Zone Model of Laser-Induced Plasma.pdf` | `zaitsev_two-zone_2024` | Model dua-zona |
| `Zaytsev and Terashkevich - 2026 - Accurate simulation of the CN emission spectra in laser-induced plasma a joint impact of robust lin.pdf` | `zaytsev_accurate_2026` | CN spectra, non-LTE, self-absorption |
| `Zhang et al. - 2025 - Dual-branch convolutional neural network with attention modules for LIBS-NIRS data fusion in cement.pdf` | `zhang_dual-branch_2025` | CNN dan attention untuk LIBS |

## Entri BibTeX Yang Tidak Punya File Lokal

Beberapa entri di `daftar-pustaka.bib` tidak memiliki lampiran file lokal. Itu normal dan tidak perlu dianggap sebagai masalah. Entitas tersebut tetap bisa dipakai untuk sitasi selama kunci BibTeX-nya ada dan valid.

## Ringkasnya

- `daftar-pustaka.bib` adalah sumber utama untuk sitasi.
- Folder ini hanya menyimpan file pendukung untuk sebagian referensi.
- Nama file lokal membantu penelusuran manual, tetapi yang dipakai di naskah tetap kunci BibTeX.
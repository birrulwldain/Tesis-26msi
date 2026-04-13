Berikut adalah hasil analisis artikel pertama dalam format pengetahuan.md sesuai workflow yang kita sepakati. Analisis ini berdasarkan isi artikel yang Anda kirim.  ￼

⸻

pengetahuan.md

Informer-Based LIBS for Qualitative Multi-Element Analysis of an Aceh Traditional Women’s Medicine

1. Metadata Artikel

Judul
Informer-Based LIBS for Qualitative Multi-Element Analysis of an Aceh Traditional Women’s Medicine

Penulis
Birrul Walidain, Nasrullah Idris, Khairun Saddami, Natasya Yuzza, Rara Mitaphonna

Institusi
	•	Universitas Syiah Kuala
	•	BRIN (Research Center for Photonics)

Tahun
2026

Bidang Penelitian
	•	Laser-Induced Breakdown Spectroscopy (LIBS)
	•	Machine Learning for Spectroscopy
	•	Plasma Spectroscopy
	•	Deep Learning

Jenis Penelitian
	•	Physics-informed machine learning
	•	Simulation-trained deep learning model

⸻

2. Latar Belakang

Laser-Induced Breakdown Spectroscopy (LIBS) adalah teknik spektroskopi emisi optik yang digunakan untuk analisis unsur secara cepat dengan persiapan sampel minimal. Teknik ini dapat mendeteksi banyak unsur sekaligus dalam satu pengukuran plasma.  ￼

LIBS telah digunakan dalam berbagai bidang seperti:
	•	eksplorasi planet
	•	pemantauan lingkungan
	•	analisis material
	•	keamanan pangan dan obat tradisional

Namun analisis LIBS memiliki beberapa tantangan utama:

1. Overlapping spectral lines

Spektrum LIBS menghasilkan ribuan garis emisi dari berbagai unsur sehingga garis spektrum sering tumpang tindih.

2. Matrix effects

Variasi komposisi sampel dapat mengubah kondisi plasma sehingga mempengaruhi intensitas spektrum.

3. Plasma variability

Parameter plasma seperti:
	•	temperatur elektron T_e
	•	densitas elektron n_e

dapat berubah antar shot.

4. Keterbatasan metode konvensional

Metode tradisional seperti Calibration-Free LIBS (CF-LIBS) memerlukan:
	•	identifikasi garis spektrum manual
	•	asumsi LTE
	•	kualitas data tinggi

yang membuat analisis menjadi kompleks.

Karena itu penelitian terbaru mulai menggunakan machine learning dan deep learning untuk memodelkan spektrum LIBS.

Beberapa metode sebelumnya meliputi:
	•	Artificial Neural Network (ANN)
	•	Convolutional Neural Network (CNN)
	•	Bi-LSTM
	•	Transformer

Namun sebagian besar model ini memiliki keterbatasan dalam menangani spektrum resolusi tinggi dengan ribuan channel.

⸻

3. Masalah Penelitian

Penelitian ini mencoba menjawab beberapa masalah utama:
	1.	Bagaimana melakukan identifikasi multi-unsur pada spektrum LIBS yang kompleks.
	2.	Bagaimana menangani spektrum resolusi tinggi (4096 channel) tanpa kompleksitas komputasi yang besar.
	3.	Bagaimana membangun model yang tidak bergantung pada dataset eksperimen besar.
	4.	Bagaimana memanfaatkan simulasi fisika plasma untuk melatih model deep learning.

⸻

4. Metode yang Digunakan

Penelitian ini mengusulkan framework LIBS berbasis Informer Transformer.

Model dilatih sepenuhnya menggunakan spektrum sintetis yang dihasilkan dari model fisika plasma.

Pipeline penelitian:

Physics-based simulation
        ↓
Synthetic LIBS spectra
        ↓
Informer Transformer
        ↓
Multi-label classification
        ↓
Element presence prediction

Pendekatan ini disebut sebagai:

Simulation-trained calibration-free LIBS

Tujuannya adalah agar model bisa:
	•	belajar dari simulasi fisika
	•	kemudian diterapkan langsung pada spektrum eksperimen

⸻

5. Arsitektur Model

Model yang digunakan adalah Informer Transformer.

Informer merupakan varian transformer untuk long sequence modeling.

Keunggulan utama Informer adalah penggunaan:

ProbSparse Self-Attention

yang mengurangi kompleksitas dari:

O(L²)

menjadi:

O(L log L)

Ini sangat penting untuk data spektrum LIBS yang memiliki 4096 channel panjang gelombang.  ￼

Konfigurasi model

Parameter model:
	•	d_model = 32
	•	d_ff = 64
	•	attention heads = 4
	•	encoder layers = 2

Optimizer:
	•	AdamW
	•	learning rate = 1e-4
	•	weight decay = 1e-5

Regularisasi:
	•	dropout = 0.4
	•	early stopping

Loss function:

MultiLabel Focal Loss

untuk menangani class imbalance pada dataset unsur.

⸻

6. Dataset

Penelitian menggunakan dua jenis dataset:

1. Dataset Simulasi

Spektrum sintetis dibuat menggunakan:
	•	NIST Atomic Spectra Database
	•	model Saha-Boltzmann plasma equilibrium

Parameter simulasi:

Temperatur elektron:

5000 K – 15500 K

Densitas elektron:

1 × 10^16  –  1 × 10^18 cm⁻³

Spektrum disimulasikan dengan:
	•	Voigt line profile
	•	Doppler broadening
	•	collisional broadening
	•	continuum emission

Rentang spektrum:

200 – 900 nm

Resolusi:

4096 channel

Dataset test:

7500 spektrum sintetis


⸻

2. Dataset Eksperimen

Spektrum eksperimen berasal dari:

Aceh Traditional Women’s Medicine

Prosedur eksperimen:

Laser:

Nd:YAG

λ = 1064 nm
10 Hz

Detektor:
	•	OMA spectrometer
	•	ICCD camera

Rentang spektrum:

200 – 900 nm

Identifikasi unsur manual menggunakan:

NIST Atomic Spectra Database

⸻

7. Desain Eksperimen

Tahapan eksperimen:
	1.	Generate synthetic spectra
	2.	Train Informer model
	3.	Evaluate on synthetic test data
	4.	Apply model to real LIBS spectra

Task yang digunakan:

multi-label classification

Label:

18 kelas
	•	17 unsur
	•	1 background

Unsur yang dipelajari meliputi:
	•	Ca
	•	Si
	•	Cr
	•	Ni
	•	Mg
	•	Cl
	•	Na
	•	Mn
	•	Al
	•	S
	•	Ar
	•	O
	•	C
	•	N
	•	Ti
	•	Co
	•	Fe

⸻

8. Hasil Penelitian

Performa model

Model terbaik:

2-layer Informer

Macro metrics:

F1 Score

0.6445

Precision

0.5938

Recall

0.7733

Model dengan 3 layer mengalami overfitting.

⸻

Performa per unsur

Unsur dengan performa tinggi:
	•	Ca
	•	Cr
	•	Si

F1 score > 0.8

Performa sedang:
	•	Mg
	•	Al

Performa rendah:
	•	Co
	•	Fe

karena overlapping spectral lines.

⸻

Validasi pada data eksperimen

Model memprediksi unsur berikut:

Na
Mg
Ca
Mn

Prediksi ini sesuai dengan identifikasi manual menggunakan database NIST.  ￼

Contoh garis spektrum:

Mg

279.5 nm
280.3 nm

Na doublet

589.0 nm
589.6 nm


⸻

9. Kontribusi Ilmiah

Kontribusi utama penelitian ini:

1

Penggunaan Informer Transformer untuk LIBS spectral analysis

2

Model dilatih sepenuhnya dari simulasi fisika plasma

3

Menunjukkan transfer learning dari synthetic spectra ke experimental spectra

4

Mengurangi kebutuhan calibration standards

5

Mendemonstrasikan potensi calibration-free LIBS berbasis deep learning

⸻

10. Keterbatasan Penelitian

Beberapa keterbatasan penelitian:

1

Model hanya melakukan analisis kualitatif (presence/absence)

bukan prediksi konsentrasi unsur.

2

Beberapa unsur penting tidak terdeteksi:
	•	C
	•	N
	•	O
	•	Fe

karena keterbatasan model simulasi.

3

Simulasi belum mempertimbangkan:
	•	molecular emission
	•	non-LTE plasma
	•	self-absorption

4

Dataset eksperimen masih terbatas.

⸻

11. Relevansi dengan Penelitian Tesis Saya

Penelitian ini sangat relevan dengan penelitian tesis Anda karena:

Kesamaan
	1.	sama-sama menggunakan LIBS spectroscopy
	2.	menggunakan deep learning
	3.	menggunakan transformer architecture
	4.	menggunakan simulasi fisika plasma

⸻

Perbedaan

Artikel ini:

Informer Transformer
multi-label classification
qualitative analysis

Sedangkan penelitian tesis Anda:

CNN + Transformer encoder-decoder
spectral modeling
quantitative prediction
plasma parameter estimation


⸻

Insight penting

Artikel ini menunjukkan bahwa:

synthetic spectra dapat digunakan untuk melatih model LIBS

Ini sangat relevan dengan pendekatan tesis Anda.

⸻

12. Insight untuk Pengembangan Penelitian

Beberapa ide yang bisa diambil:

1

Menggunakan physics-based simulation dataset

untuk melatih model.

2

Menggunakan transformer untuk spektrum panjang

(4096 channel).

3

Menggunakan attention mechanism untuk mengatasi overlapping spectral lines.

4

Menggabungkan:

CNN + Transformer

untuk memodelkan:
	•	fitur lokal
	•	dependensi global.

⸻

✅ Kesimpulan penting dari artikel ini untuk penelitian Anda:

Artikel ini membuktikan bahwa:

deep learning model yang dilatih dari simulasi plasma dapat bekerja pada spektrum LIBS nyata.

Ini adalah konsep sangat penting untuk tesis Anda.

⸻

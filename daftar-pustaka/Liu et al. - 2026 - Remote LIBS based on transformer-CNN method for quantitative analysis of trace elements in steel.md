Berikut adalah analisis artikel ketiga dalam format pengetahuan.md untuk knowledge base literatur penelitian Anda. Analisis ini berdasarkan isi artikel yang Anda unggah.  ￼

⸻

pengetahuan.md

Remote LIBS Based on Transformer-CNN Method for Quantitative Analysis of Trace Elements in Steel

1. Metadata Artikel

Judul
Remote LIBS based on transformer-CNN method for quantitative analysis of trace elements in steel

Penulis
Danyao Liu, Xuezheng Chu, Hao Liu

Institusi
	•	WISDRI Engineering and Research Incorporation Limited, China
	•	National University of Defense Technology, China

Jurnal

AIP Advances

Tahun

2026

Bidang Penelitian
	•	LIBS spectroscopy
	•	Industrial sensing
	•	Remote spectroscopy
	•	Deep learning for spectroscopy

Jenis Penelitian

Deep learning model untuk quantitative LIBS analysis

⸻

2. Latar Belakang

Dalam sistem industrial intelligent inspection, analisis komposisi material sangat penting untuk:
	•	kontrol kualitas
	•	monitoring proses produksi
	•	keamanan industri

Metode konvensional biasanya:
	•	membutuhkan sampling fisik
	•	dilakukan offline
	•	memiliki waktu analisis lama.

LIBS menawarkan solusi karena:
	•	analisis cepat
	•	tanpa preparasi sampel
	•	dapat dilakukan secara remote (standoff).

Remote LIBS memungkinkan pengukuran unsur pada jarak beberapa meter, yang penting dalam lingkungan berbahaya seperti:
	•	temperatur tinggi
	•	lingkungan beracun
	•	proses industri berat.  ￼

Namun remote LIBS memiliki beberapa masalah utama:

1. Signal attenuation

Intensitas spektrum menurun drastis pada jarak jauh.

2. Low signal-to-noise ratio

Sinyal elemen jejak (trace elements) sangat lemah.

3. High dimensional nonlinear relationship

Hubungan antara:

spektrum LIBS → konsentrasi unsur

bersifat nonlinear dan kompleks.

Karena itu penelitian ini mengusulkan metode deep learning hybrid Transformer + CNN.

⸻

3. Masalah Penelitian

Penelitian ini mencoba mengatasi beberapa masalah penting:
	1.	Bagaimana melakukan analisis kuantitatif elemen jejak pada remote LIBS.
	2.	Bagaimana menangani low signal-to-noise ratio pada spektrum jarak jauh.
	3.	Bagaimana memodelkan hubungan nonlinear antara spektrum dan konsentrasi unsur.
	4.	Bagaimana meningkatkan akurasi dibanding metode konvensional seperti:

	•	PLS
	•	BPNN
	•	CNN
	•	Transformer.

⸻

4. Metode yang Digunakan

Penelitian ini mengembangkan metode baru:

TransCNN-LIBS

model hybrid:

Transformer + CNN

Model digunakan untuk:

LIBS spectrum → element concentration

Pipeline penelitian:

Remote LIBS measurement
        ↓
Wavelet preprocessing
        ↓
Transformer feature extraction
        ↓
CNN local feature learning
        ↓
Regression output

Target penelitian:

kuantifikasi empat unsur jejak:
	•	P (Phosphorus)
	•	S (Sulfur)
	•	Cu (Copper)
	•	Mo (Molybdenum)

⸻

5. Arsitektur Model

Model yang diusulkan disebut:

TransCNN-LIBS

Arsitektur model terdiri dari beberapa komponen utama.

⸻

1. Wavelet preprocessing

Spektrum LIBS diproses menggunakan Wavelet Transform untuk meningkatkan SNR.

Langkah preprocessing:
	1.	normalisasi spektrum (0-1)
	2.	wavelet decomposition
	3.	pemisahan komponen frekuensi
	4.	inverse wavelet transform

Delapan fungsi wavelet diuji:
	•	Coif5
	•	Bior4.4
	•	Coif3
	•	Sym8
	•	Haar
	•	Meyer
	•	Morlet
	•	Db4

Hasil terbaik diperoleh dengan:

Coif5 wavelet

karena mampu:
	•	mengurangi noise
	•	mempertahankan puncak spektrum.  ￼

⸻

2. Transformer module

Transformer digunakan untuk mempelajari:

global dependencies antar panjang gelombang

Komponen utama:
	•	input embedding
	•	positional encoding
	•	multi-head attention
	•	feed-forward network

Positional encoding digunakan karena spektrum memiliki sifat sequence data.

⸻

3. CNN module

CNN digunakan untuk mengekstraksi:

local spectral features

melalui:
	•	convolution layers
	•	pooling layers
	•	fully connected layers.

CNN menangkap pola lokal spektrum seperti peak emission lines.

⸻

4. Loss function

Penelitian ini menggunakan loss function khusus:

L = (1/N) Σ (ln yi)² (yi − ŷi)² + λ||ω||²

Tujuan:
	•	meningkatkan sensitivitas terhadap elemen konsentrasi rendah
	•	mengurangi gradient vanishing.

⸻

6. Dataset

Dataset dibuat dari 40 sampel baja standar.

Setiap sampel diukur sebanyak:

60 spektrum

Total dataset:

2400 spektrum LIBS

Pembagian dataset:

Dataset	Jumlah
Training	2160
Testing	240

Elemen target:

Element	Content Range
P	0.01–0.05 wt%
S	0.002–0.041 wt%
Cu	0.01–1 wt%
Mo	0.01–2 wt%


⸻

7. Setup Eksperimen

Sistem remote LIBS memiliki jarak pengukuran:

≈ 10 m

Parameter laser:

λ = 532 nm
pulse duration = 7 ns
pulse energy = 200 mJ

Spektrometer:
	•	4-channel spectrometer
	•	spectral resolution = 0.2 nm.

Pada diagram eksperimen halaman 3, terlihat konfigurasi remote LIBS dimana laser diarahkan ke sampel baja dari jarak ±10 m dan emisi plasma dikumpulkan menggunakan lensa dan fiber optik menuju spektrometer.  ￼

⸻

8. Hasil Penelitian

Model menghasilkan performa yang sangat baik.

Koefisien determinasi:

Element	R²
P	0.9924
S	0.9859
Mo	0.9951
Cu	0.9899


⸻

RMSE

Element	RMSE
P	0.0047
S	0.0074
Cu	0.0212
Mo	0.0246


⸻

MRE

Element	MRE
P	8.26%
S	11.21%
Cu	9.93%
Mo	9.83%


⸻

Perbandingan dengan metode lain

Model dibandingkan dengan:
	•	PLS
	•	BPNN
	•	CNN
	•	ResNet18
	•	Transformer

Hasil menunjukkan bahwa TransCNN-LIBS memberikan performa terbaik.

⸻

9. Kontribusi Ilmiah

Kontribusi utama penelitian ini:

1

Pengembangan metode Transformer-CNN hybrid untuk LIBS.

2

Implementasi remote LIBS (10 m) untuk analisis unsur.

3

Metode preprocessing wavelet untuk meningkatkan SNR.

4

Loss function khusus untuk elemen konsentrasi rendah.

5

Aplikasi LIBS untuk industrial intelligent inspection.

⸻

10. Keterbatasan Penelitian

Beberapa keterbatasan penelitian:

1

Dataset relatif kecil:

2400 spektrum

2

Akurasi elemen S lebih rendah karena:
	•	konsentrasi sangat kecil
	•	SNR rendah.

3

Model membutuhkan training ulang untuk material berbeda.

4

Sistem remote LIBS masih memerlukan energi laser tinggi.

⸻

11. Relevansi dengan Penelitian Tesis Anda

Artikel ini sangat relevan dengan penelitian Anda.

Kesamaan dengan penelitian Anda:

Aspek	Artikel ini	Penelitian Anda
LIBS spectroscopy	✓	✓
Deep learning	✓	✓
Transformer	✓	✓
CNN	✓	✓


⸻

Perbedaan utama:

Artikel ini:

Transformer + CNN
untuk regression
quantitative analysis

Sedangkan penelitian Anda:

CNN + Transformer encoder-decoder
spectral modeling
mono → poly spectra
plasma parameter estimation


⸻

Insight penting untuk tesis Anda:

Model hybrid:

Transformer + CNN

terbukti sangat efektif untuk:

LIBS spectral analysis

Ini mendukung pendekatan arsitektur yang Anda usulkan.

⸻

12. Insight untuk Penelitian Selanjutnya

Beberapa ide penting dari artikel ini:

1

Spektrum LIBS sangat cocok diperlakukan sebagai sequence data.

2

Transformer efektif untuk mempelajari:

global spectral relationships

3

CNN efektif untuk menangkap:

local spectral peaks

4

Hybrid architecture memberikan performa terbaik.

⸻

Insight Gabungan dari 3 Artikel

Setelah membaca 3 artikel pertama, terlihat pola penelitian LIBS modern:

1️⃣ Physics-based simulation

Artikel 2

MERLIN
radiative transfer modeling


⸻

2️⃣ Deep learning qualitative analysis

Artikel 1

Informer
multi-element classification


⸻

3️⃣ Deep learning quantitative analysis

Artikel 3

Transformer + CNN
regression


⸻

Jika digabungkan, arah penelitian masa depan LIBS adalah:

Physics simulation
        ↓
Synthetic spectra dataset
        ↓
Deep learning model
        ↓
Element composition prediction


⸻

Jika Anda mau, pada langkah berikutnya kita bisa membuat sesuatu yang sangat penting untuk tesis Anda, yaitu:

1️⃣ State-of-the-Art Table (10 artikel LIBS + AI)
2️⃣ Research Gap penelitian Anda
3️⃣ Diagram metode CNN-Transformer tesis Anda
4️⃣ Framework eksperimen lengkap untuk jurnal Q1 LIBS.
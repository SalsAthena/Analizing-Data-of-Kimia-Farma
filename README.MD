# # 📊 Big Data Analytics Internship Project - Kimia Farma

## 🧑‍💼 Internship Role
Sebagai seorang **Big Data Analytics Intern** di **Kimia Farma**, saya melakukan analisis mendalam terhadap data operasional dan transaksi bisnis. Fokus utama proyek ini adalah **evaluasi kinerja bisnis Kimia Farma dari tahun 2020 hingga 2023**.

---

## 🗂️ Dataset
Berikut adalah dataset yang digunakan dalam proyek ini:

| Nama File                 | Deskripsi                        |
|--------------------------|----------------------------------|
| `kf_final_transaction.csv` | Data transaksi final             |
| `kf_inventory.csv`         | Data inventori/stock obat        |
| `kf_kantor_cabang.csv`     | Data kantor cabang Kimia Farma   |
| `kf_product.csv`           | Data produk/obat                 |

### ✅ Task: Import Dataset ke BigQuery
- Impor seluruh file CSV ke Google BigQuery.
- Pastikan nama tabel sesuai dengan nama file tanpa ekstensi `.csv`, yaitu:
  - `kf_final_transaction`
  - `kf_inventory`
  - `kf_kantor_cabang`
  - `kf_product`

---

## 🧠 Task: Pembuatan Tabel Analisa
Tabel analisa ini akan digunakan untuk mengevaluasi kinerja bisnis.

### 📋 Kolom yang Wajib Ada:
| Kolom                 | Deskripsi |
|-----------------------|-----------|
| `transaction_id`      | Kode transaksi |
| `date`                | Tanggal transaksi |
| `branch_id`           | ID cabang |
| `branch_name`         | Nama cabang |
| `kota`                | Kota cabang |
| `provinsi`            | Provinsi cabang |
| `rating_cabang`       | Rating cabang |
| `customer_name`       | Nama customer |
| `product_id`          | ID produk |
| `product_name`        | Nama produk |
| `actual_price`        | Harga sebelum diskon |
| `discount_percentage` | Persentase diskon |
| `persentase_gross_laba` | Persentase laba berdasarkan ketentuan harga (lihat bawah) |
| `nett_sales`          | Harga setelah diskon |
| `nett_profit`         | Keuntungan bersih |
| `rating_transaksi`    | Rating transaksi |

### 📈 Aturan Perhitungan `persentase_gross_laba`:
| Harga Obat             | % Laba |
|------------------------|--------|
| ≤ Rp 50.000            | 10%    |
| > Rp 50.000 – 100.000  | 15%    |
| > Rp 100.000 – 300.000 | 20%    |
| > Rp 300.000 – 500.000 | 25%    |
| > Rp 500.000           | 30%    |

---

## 🛠️ Tools & Platform
- **Google BigQuery** (Sandbox)
- **SQL (BigQuery Standard SQL)**

---

## 📌 Catatan
- Pastikan tidak terjadi missing value pada hasil analisis.
- Perhitungan laba dan profit harus presisi sesuai ketentuan.
- Semua hasil bisa diekspor ke Google Sheets / CSV secara manual dari BigQuery (via tombol `Export`) karena menggunakan BigQuery Sandbox (tanpa billing).

---

## 📁 Struktur File
```bash
📦 kimia-farma-bigquery
┣ 📁 sql_scripts
┃ ┗ 📄 Rakami_Kimia Farma_Salsabila Hasna Fitria.sql
┣ 📄 tabel_analisa.csv      <-- Hasil akhir dari analisis
┣ 📄 README.md

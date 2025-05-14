-- Membuat tabel baru bernama final_dataset1 di dalam schema kf_dataset
CREATE TABLE kf_dataset.final_dataset1 AS
SELECT
    -- Kolom-kolom utama dari hasil subquery
    x.transaction_id,
    x.date,
    x.branch_id,
    x.branch_name,
    x.kota,
    x.provinsi,
    x.rating_cabang,
    x.customer_name,
    x.product_id,
    x.product_name,
    x.actual_price,
    x.discount_percentage,
    x.persentase_gross_laba,
    x.nett_sales,
    
    -- Menghitung gross laba sebagai persentase_gross_laba dikali nett_sales
    (x.persentase_gross_laba * x.nett_sales) AS gross_laba,
    
    -- Menghitung nett profit sebagai selisih actual_price dengan nett_sales
    (x.actual_price - x.nett_sales) AS nett_profit,
    
    -- Rating dari transaksi
    x.rating_transaksi
FROM (
    -- Subquery untuk menggabungkan data transaksi, kantor cabang, dan produk
    SELECT
        a.transaction_id,
        a.date,
        a.branch_id,
        b.branch_name,
        b.kota,
        b.provinsi,
        b.rating AS rating_cabang, -- Rating dari cabang
        a.customer_name,
        a.product_id,
        c.product_name,
        c.price AS actual_price,
        a.discount_percentage,

        -- Menentukan persentase gross laba berdasarkan kisaran harga produk
        CASE
            WHEN c.price <= 50000 THEN 0.10
            WHEN c.price > 50000 AND c.price <= 100000 THEN 0.15
            WHEN c.price > 100000 AND c.price <= 300000 THEN 0.20
            WHEN c.price > 300000 AND c.price <= 500000 THEN 0.25
            WHEN c.price > 500000 THEN 0.30
        END AS persentase_gross_laba,

        -- Menghitung penjualan bersih (nett_sales) setelah diskon
        (c.price - (c.price * a.discount_percentage)) AS nett_sales,

        -- Rating dari transaksi
        a.rating AS rating_transaksi

    -- Menggabungkan data dari tabel transaksi, cabang, dan produk
    FROM kf_dataset.kf_final_transaction a
    LEFT JOIN kf_dataset.kf_kantor_cabang b ON a.branch_id = b.branch_id
    LEFT JOIN kf_dataset.kf_product c ON a.product_id = c.product_id
) x;


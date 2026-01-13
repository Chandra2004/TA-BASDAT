# Pertemuan 5 - SQL JOINS

Dokumen ini berisi syntax SQL untuk operasi `INNER JOIN` dan `OUTER JOIN` (LEFT JOIN/RIGHT JOIN) menggunakan berbagai tabel dari schema 3NF.

## 1. Syntax SQL INNER JOIN (2 Tabel)

`INNER JOIN` digunakan untuk menampilkan data yang memiliki kesesuaian (match) di kedua tabel yang dihubungkan.

### Menampilkan Barang beserta Kategorinya

Menghubungkan tabel `barang` dengan `kategori`.

```sql
SELECT
    barang.Kode_barang,
    barang.Nama_barang,
    barang.Harga_sewa,
    kategori.Nama_kategori
FROM barang
INNER JOIN kategori ON barang.Id_kategori = kategori.Id_kategori;
```

### Menampilkan Transaksi beserta Nama Pelanggan

Menghubungkan tabel `transaksi` dengan `pelanggan`.

```sql
SELECT
    transaksi.Id_transaksi,
    transaksi.tanggal_pinjam,
    pelanggan.nama_pelanggan,
    pelanggan.No_hp
FROM transaksi
INNER JOIN pelanggan ON transaksi.Id_Pelanggan = pelanggan.Id_pelanggan;
```

## 2. Syntax SQL INNER JOIN (3 Tabel)

Menggabungkan tiga tabel sekaligus untuk mendapatkan informasi yang lebih lengkap.

### Menampilkan Transaksi, Pelanggan, dan Karyawan yang Melayani

Menghubungkan `transaksi`, `pelanggan`, dan `karyawan`.

```sql
SELECT
    transaksi.Id_transaksi,
    transaksi.tanggal_pinjam,
    pelanggan.nama_pelanggan,
    karyawan.nama_karyawan AS 'Dilayani Oleh'
FROM transaksi
INNER JOIN pelanggan ON transaksi.Id_Pelanggan = pelanggan.Id_pelanggan
INNER JOIN karyawan ON transaksi.Id_Karyawan = karyawan.Id_karyawan;
```

### Menampilkan Detail Barang yang Disewa (Detail -> Barang -> Kategori)

Menghubungkan `detail_transaksi`, `barang`, dan `kategori`.

```sql
SELECT
    detail_transaksi.Id_transaksi,
    barang.Nama_barang,
    kategori.Nama_kategori,
    detail_transaksi.Kondisi_barang
FROM detail_transaksi
INNER JOIN barang ON detail_transaksi.kode_barang = barang.Kode_barang
INNER JOIN kategori ON barang.Id_kategori = kategori.Id_kategori;
```

## 3. Syntax SQL OUTER JOIN (2 Tabel)

`OUTER JOIN` (biasanya `LEFT JOIN`) akan menampilkan semua data dari tabel sebelah kiri (tabel pertama), meskipun tidak ada data yang cocok di tabel sebelah kanan.

### Menampilkan Semua Kategori (Termasuk yang Tidak Memiliki Barang)

Query ini akan menampilkan semua kategori. Jika ada kategori yang belum memiliki barang terdaftar, kolom dari tabel `barang` akan bernilai `NULL`.

```sql
SELECT
    kategori.Nama_kategori,
    barang.Nama_barang
FROM kategori
LEFT JOIN barang ON kategori.Id_kategori = barang.Id_kategori;
```

### Menampilkan Semua Pelanggan (Termasuk yang Belum Pernah Transaksi)

Query ini menampilkan seluruh pelanggan. Jika pelanggan belum pernah melakukan transaksi, data transaksi akan `NULL`.

```sql
SELECT
    pelanggan.nama_pelanggan,
    transaksi.Id_transaksi,
    transaksi.tanggal_pinjam
FROM pelanggan
LEFT JOIN transaksi ON pelanggan.Id_pelanggan = transaksi.Id_Pelanggan;
```

## 4. Syntax SQL OUTER JOIN (3 Tabel)

Menggabungkan tiga tabel menggunakan `LEFT JOIN` untuk melihat data secara hierarkis penuh, bahkan jika relasinya tidak lengkap.

### Menampilkan Semua Kategori -> Barang -> Riwayat Peminjaman

Menampilkan semua kategori, barang-barang di dalamnya (jika ada), dan detail history peminjaman barang tersebut (jika pernah dipinjam).

```sql
SELECT
    kategori.Nama_kategori,
    barang.Nama_barang,
    detail_transaksi.Id_transaksi,
    detail_transaksi.Kondisi_barang
FROM kategori
LEFT JOIN barang ON kategori.Id_kategori = barang.Id_kategori
LEFT JOIN detail_transaksi ON barang.Kode_barang = detail_transaksi.kode_barang;
```

### Analisis: Menampilkan Semua Pelanggan -> Transaksi -> Karyawan

Menampilkan semua pelanggan, transaksi mereka (jika ada), dan karyawan yang melayani (jika ada transaksi).

```sql
SELECT
    pelanggan.nama_pelanggan,
    transaksi.Id_transaksi,
    transaksi.Status_bayar,
    karyawan.nama_karyawan
FROM pelanggan
LEFT JOIN transaksi ON pelanggan.Id_pelanggan = transaksi.Id_Pelanggan
LEFT JOIN karyawan ON transaksi.Id_Karyawan = karyawan.Id_karyawan;
```

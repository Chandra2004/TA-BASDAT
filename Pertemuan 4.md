# Pertemuan 4 - Data Manipulation Language (DML)

Dokumen ini berisi syntax SQL untuk `INSERT`, `UPDATE`, dan `DELETE` berdasarkan tabel-tabel pada schema 3NF.

## 1. Syntax SQL INSERT TABLE

Berikut adalah perintah `INSERT INTO` untuk mengisi data ke dalam tabel.

### Tabel: kategori

```sql
INSERT INTO `kategori` (`Id_kategori`, `Nama_kategori`) VALUES
(1, 'Tenda'),
(2, 'Matras'),
(3, 'Carrier'),
(4, 'Headlamp'),
(5, 'Trekking Pole'),
(6, 'Kompor'),
(7, 'Peralatan Masak'),
(8, 'Sleeping Bag'),
(9, 'Jaket'),
(10, 'Flysheet'),
(11, 'Lampu'),
(12, 'Gas');
```

### Tabel: barang

```sql
INSERT INTO `barang` (`Kode_barang`, `Nama_barang`, `Id_kategori`, `Harga_sewa`) VALUES
('BRG-001', 'Tenda Dome 4P', 1, 150000),
('BRG-002', 'Matras Eiger', 2, 20000),
('BRG-003', 'Carrier Consina 60L', 3, 300000),
('BRG-004', 'Headlamp eiger', 4, 200000),
('BRG-005', 'Trekking Pole', 5, 50000),
('BRG-006', 'Kompor Portable', 6, 250000),
('BRG-007', 'Panci Set', 7, 25000),
('BRG-008', 'Sleeping Bag Eiger', 8, 180000),
('BRG-009', 'Tenda Bivak', 1, 100000),
('BRG-010', 'Cooking Set', 7, 40000),
('BRG-011', 'Jaket Gunung Arei', 9, 160000),
('BRG-012', 'Flysheet', 10, 280000),
('BRG-013', 'Sleeping Bag Thermarest', 8, 200000),
('BRG-014', 'Lampu Tenda', 11, 50000),
('BRG-015', 'Matras', 2, 20000),
('BRG-016', 'Gas', 12, 20000),
('BRG-017', 'Trekking Pole (Standard)', 5, 30000);
```

### Tabel: pelanggan

```sql
INSERT INTO `pelanggan` (`Id_pelanggan`, `nama_pelanggan`, `No_hp`, `Email`, `Alamat_lengkap`) VALUES
('P-001', 'Cristiano Ronaldo', '85217922655', 'cristiano.ronaldo@gmail.com', 'Jl. Mayjend Sungkono No.12, Surabaya'),
('P-002', 'Adidarma', '82234567890', 'agung.adidarma@gmail.com', 'Jl. Soekarno Hatta No.88, Lowokwaru, Malang'),
('P-003', 'Jude Bellingham', '85331234567', 'jude.bellingham@gmail.com', 'Perumahan Puri Indah Blok B2 No.5, Sidoarjo'),
('P-004', 'Luka Modric', '87865432100', 'luka.modric@gmail.com', 'Jl. Hayam Wuruk No.40, Gadingrejo, Pasuruan'),
('P-005', 'Novi Rahmawati', '87851244567', 'novi.rahmawati@gmail.com', 'Jl. Jaksa Agung Suprapto No.11, Lamongan'),
('P-006', 'Andre Bauman', '82288445566', 'andre.bauman@gmail.com', 'Jl. Joyoboyo No.27, Mojoroto, Kediri'),
('P-007', 'Adidarma', '82234567890', 'agung.adidarma@gmail.com', 'Jl. Soekarno Hatta No.88, Lowokwaru, Malang'),
('P-008', 'Kylian Mbappe', '81234567890', 'kylian.mbappe@gmail.com', 'Jl. Bhayangkara No.30, Sooko, Mojokerto'),
('P-009', 'Kevin De Bruyne', '89012345678', 'kevin.debruyne@gmail.com', 'Jl. Merdeka No.17, Sukorejo, Blitar'),
('P-010', 'Luka Modric', '87865432100', 'luka.modric@gmail.com', 'Jl. Hayam Wuruk No.40, Gadingrejo, Pasuruan');
```

### Tabel: karyawan

```sql
INSERT INTO `karyawan` (`Id_karyawan`, `nama_karyawan`, `Shift_karyawan`) VALUES
('K-301', 'Dewi Marlina', 'Pagi'),
('K-302', 'Joko Supriyadi', 'Sore');
```

### Tabel: transaksi

```sql
INSERT INTO `transaksi` (`Id_transaksi`, `Id_Pelanggan`, `Id_Karyawan`, `tanggal_pinjam`, `tanggal_kembali`, `Metode_bayar`, `Status_bayar`, `Tanggal_bayar`, `Total_bayar`, `Denda`, `Keterangan_denda`, `Keterlambatan_pembayaran`, `Ulasan_Pelanggan`, `Rating`) VALUES
('T-1', 'P-001', 'K-301', '2025-06-01', '2025-06-03', 'Transfer', 'Lunas', '2025-06-01', 170000, 0, '-', '-', 'Sangat puas', 5),
('T-2', 'P-002', 'K-302', '2025-06-02', '2025-06-05', 'Cash', 'Lunas', '2025-06-06', 350000, 50000, '-', 'telat 1 hari', 'Muat banyak tapi berat', 4),
('T-3', 'P-003', 'K-302', '2025-06-03', '2025-06-04', 'Transfer', 'Lunas', '2025-06-04', 350000, 100000, 'Trekking pole rusak', '-', '-', 2),
('T-4', 'P-004', 'K-301', '2025-06-04', '2025-06-07', 'Cash', 'Lunas', '2025-06-09', 375000, 100000, '-', 'telat 2 hari', 'Kurang panas kompornya', 3),
('T-5', 'P-005', 'K-301', '2025-06-05', '2025-06-07', 'Transfer', 'Lunas', '2025-06-05', 180000, 0, '-', '-', 'Hangat banget', 5),
('T-6', 'P-006', 'K-302', '2025-06-06', '2025-06-08', 'Transfer', 'Lunas', '2025-06-06', 140000, 0, '-', '-', 'Praktis dan ringan', 5),
('T-7', 'P-007', 'K-301', '2025-06-06', '2025-06-07', 'Transfer', 'Lunas', '2025-06-06', 360000, 200000, 'Jaket sobek', '-', 'kurang oke', 2),
('T-8', 'P-008', 'K-302', '2025-06-07', '2025-06-10', 'Cash', 'Lunas', '2025-06-11', 390000, 80000, '-', 'telat 1 hari', 'Flysheetnya oke', 4),
('T-9', 'P-009', 'K-301', '2025-06-08', '2025-06-11', 'Transfer', 'Lunas', '2025-06-08', 285000, 85000, 'Sleeping Bag berlubang', '-', 'kurang nyaman', 3),
('T-10', 'P-010', 'K-302', '2025-06-09', '2025-06-10', 'Cash', 'Lunas', '2025-06-12', 150000, 60000, '-', 'telat 2 hari', 'Matras nyaman bree', 5);
```

### Tabel: detail_transaksi

```sql
INSERT INTO `detail_transaksi` (`Id_transaksi`, `kode_barang`, `Kondisi_barang`) VALUES
('T-1', 'BRG-001', 'Baik'),
('T-1', 'BRG-002', 'Baik'),
('T-2', 'BRG-003', 'Baik'),
('T-3', 'BRG-004', 'Baik'),
('T-3', 'BRG-005', 'Rusak'),
('T-4', 'BRG-006', 'Baik'),
('T-4', 'BRG-007', 'Baik'),
('T-5', 'BRG-008', 'Baik'),
('T-6', 'BRG-009', 'Baik'),
('T-6', 'BRG-010', 'Baik'),
('T-7', 'BRG-011', 'Rusak'),
('T-8', 'BRG-012', 'Baik'),
('T-8', 'BRG-017', 'Baik'),
('T-9', 'BRG-013', 'Rusak'),
('T-10', 'BRG-014', 'Baik'),
('T-10', 'BRG-015', 'Baik'),
('T-10', 'BRG-016', 'baik sekali');
```

## 2. Syntax SQL UPDATE TABLE

Berikut adalah contoh perintah `UPDATE` untuk mengubah data yang sudah ada.

### Mengubah Harga Sewa Barang

Contoh: Naikkan harga sewa 'Tenda Dome 4P' (BRG-001) menjadi 160000.

```sql
UPDATE `barang`
SET `Harga_sewa` = 160000
WHERE `Kode_barang` = 'BRG-001';
```

### Mengubah Data Pelanggan

Contoh: Memperbarui nomor HP milik pelanggan 'P-002'.

```sql
UPDATE `pelanggan`
SET `No_hp` = '08111222333'
WHERE `Id_pelanggan` = 'P-002';
```

### Mengubah Status Pembayaran Transaksi

Contoh: Mengubah Status Bayar dan Tanggal Bayar pada transaksi 'T-2'.

```sql
UPDATE `transaksi`
SET `Status_bayar` = 'Lunas', `Tanggal_bayar` = '2025-06-06'
WHERE `Id_transaksi` = 'T-2';
```

## 3. Syntax SQL DELETE TABLE

Berikut adalah contoh perintah `DELETE` untuk menghapus data.

### Menghapus Data Kategori (Hanya jika tidak terpakai)

Contoh: Menghapus kategori 'Gas' (Id 12).

```sql
DELETE FROM `kategori`
WHERE `Id_kategori` = 12;
```

### Menghapus Detail Transaksi

Contoh: Menghapus item detail transaksi dengan ID tertentu.

```sql
DELETE FROM `detail_transaksi`
WHERE `Id_detail` = 1;
```

### Menghapus Barang

Contoh: Menghapus barang dengan kode 'BRG-016'.
**Catatan**: Pastikan data tidak direferensikan oleh tabel lain (seperti detail_transaksi) sebelum menghapus, atau setel constraint ON DELETE CASCADE/SET NULL jika memungkinkan.

```sql
DELETE FROM `barang`
WHERE `Kode_barang` = 'BRG-016';
```

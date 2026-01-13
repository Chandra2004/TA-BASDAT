# Dokumentasi Syntax SQL (3NF)

Dokumen ini berisi syntax `CREATE TABLE` dan `ALTER TABLE` untuk semua tabel dalam schema 3NF `@dbl_4_3nf_normalisasi.sql`.

## 2. Syntax CREATE TABLE

Berikut adalah perintah untuk membuat tabel-tabel (tanpa Foreign Key constraints).

### Tabel: kategori
```sql
CREATE TABLE `kategori` (
    `Id_kategori` int(11) NOT NULL AUTO_INCREMENT,
    `Nama_kategori` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`Id_kategori`)
);
```

### Tabel: barang
```sql
CREATE TABLE `barang` (
    `Kode_barang` varchar(50) NOT NULL,
    `Nama_barang` varchar(100) DEFAULT NULL,
    `Id_kategori` int(11) DEFAULT NULL,
    `Harga_sewa` int(11) DEFAULT NULL,
    PRIMARY KEY (`Kode_barang`)
);
```

### Tabel: pelanggan
```sql
CREATE TABLE `pelanggan` (
    `Id_pelanggan` varchar(10) NOT NULL,
    `nama_pelanggan` varchar(100) DEFAULT NULL,
    `No_hp` varchar(15) DEFAULT NULL,
    `Email` varchar(100) DEFAULT NULL,
    `Alamat_lengkap` varchar(150) DEFAULT NULL,
    PRIMARY KEY (`Id_pelanggan`)
);
```

### Tabel: karyawan
```sql
CREATE TABLE `karyawan` (
    `Id_karyawan` varchar(10) NOT NULL,
    `nama_karyawan` varchar(100) DEFAULT NULL,
    `Shift_karyawan` varchar(20) DEFAULT NULL,
    PRIMARY KEY (`Id_karyawan`)
);
```

### Tabel: transaksi
```sql
CREATE TABLE `transaksi` (
    `Id_transaksi` varchar(10) NOT NULL,
    `Id_Pelanggan` varchar(10) DEFAULT NULL,
    `Id_Karyawan` varchar(10) DEFAULT NULL,
    `tanggal_pinjam` date DEFAULT NULL,
    `tanggal_kembali` date DEFAULT NULL,
    `Metode_bayar` varchar(20) DEFAULT NULL,
    `Status_bayar` varchar(20) DEFAULT NULL,
    `Tanggal_bayar` date DEFAULT NULL,
    `Total_bayar` int(11) DEFAULT NULL,
    `Denda` int(11) DEFAULT NULL,
    `Keterangan_denda` varchar(255) DEFAULT NULL,
    `Keterlambatan_pembayaran` varchar(20) DEFAULT NULL,
    `Ulasan_Pelanggan` text DEFAULT NULL,
    `Rating` int(1) DEFAULT NULL,
    PRIMARY KEY (`Id_transaksi`)
);
```

### Tabel: detail_transaksi
```sql
CREATE TABLE `detail_transaksi` (
    `Id_detail` int(11) NOT NULL AUTO_INCREMENT,
    `Id_transaksi` varchar(10) DEFAULT NULL,
    `kode_barang` varchar(10) DEFAULT NULL,
    `Kondisi_barang` varchar(20) DEFAULT NULL,
    PRIMARY KEY (`Id_detail`)
);
```

## 3. Syntax ALTER TABLE

Berikut adalah perintah `ALTER TABLE` untuk menambahkan Foreign Key constraints pada tabel yang berelasi.

### Tabel: barang
Menambahkan relasi ke tabel `kategori`.
```sql
ALTER TABLE `barang`
ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`Id_kategori`) REFERENCES `kategori` (`Id_kategori`);
```

### Tabel: transaksi
Menambahkan relasi ke tabel `pelanggan` dan `karyawan`.
```sql
ALTER TABLE `transaksi`
ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`Id_Pelanggan`) REFERENCES `pelanggan` (`Id_pelanggan`);

ALTER TABLE `transaksi`
ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`Id_Karyawan`) REFERENCES `karyawan` (`Id_karyawan`);
```

### Tabel: detail_transaksi
Menambahkan relasi ke tabel `transaksi` dan `barang`.
```sql
ALTER TABLE `detail_transaksi`
ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`Id_transaksi`) REFERENCES `transaksi` (`Id_transaksi`);

ALTER TABLE `detail_transaksi`
ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`Kode_barang`);
```

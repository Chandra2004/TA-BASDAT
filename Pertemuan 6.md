# Pertemuan 6 - Normalisasi Database & View

Dokumen ini berisi penjelasan mengenai tahapan normalisasi database dari bentuk UNF hingga 3NF, serta kumpulan query `VIEW` dan `UPDATE` untuk keperluan pelaporan dan manajemen data.

## 1. UNF (Unnormalized Form)

### Penjelasan Tabel UNF

Bentuk data paling dasar atau mentah yang belum mengalami proses normalisasi, ditandai dengan adanya pengulangan grup data (_repeating groups_), redundansi informasi, dan kolom yang menampung lebih dari satu nilai (_multivalue attribute_).

Tabel `non_normalisasi` dalam file SQL ini merupakan contoh nyata dari bentuk UNF tersebut, di mana seluruh informasi penyewaan alat outdoor—mulai dari data transaksi, detail pelanggan, data karyawan, hingga rincian barang dan status pembayaran—disatukan dalam satu tabel tunggal yang "gemuk". Hal ini terlihat jelas pada kolom seperti `Nama_Barang` atau `Harga_Sewa` yang memuat beberapa nilai sekaligus (misalnya "Tenda Dome 4P, Matras Eiger") dalam satu baris, yang menyulitkan integritas dan pengolahan data lebih lanjut.

- **Link Spreadsheet:** [https://docs.google.com/spreadsheets/d/1LKTpZRG9sii31ZERMKt-w4fJQ2HMkexAYec8y_oxbGA/edit?gid=2092199918#gid=2092199918](https://docs.google.com/spreadsheets/d/1LKTpZRG9sii31ZERMKt-w4fJQ2HMkexAYec8y_oxbGA/edit?gid=2092199918#gid=2092199918)

---

## 2. 1NF (First Normal Form)

### Penjelasan Tabel 1NF

Tahap pertama normalisasi di mana setiap kolom dalam tabel harus bersifat **atomik**, artinya setiap sel hanya boleh berisi satu nilai tunggal, dan tidak boleh ada _repeating groups_ (kelompok data yang berulang).

Dalam file `1nf_normalisasi.sql`, tabel telah ditransformasikan dari bentuk UNF dengan memecah baris data yang sebelumnya memiliki atribut bernilai ganda (seperti `Nama_Barang`, `Kategori_Barang`, dan `Harga_Sewa` yang dipisahkan koma) menjadi baris-baris terpisah. Setiap baris kini merepresentasikan satu item penyewaan yang spesifik (misalnya, transaksi "T-1" yang menyewa Tenda dan Matras kini muncul sebagai dua baris data berbeda), meskipun hal ini menyebabkan duplikasi data pada kolom informasi transaksi lainnya seperti data pelanggan dan total bayar.

- **Link Spreadsheet:** [https://docs.google.com/spreadsheets/d/1LKTpZRG9sii31ZERMKt-w4fJQ2HMkexAYec8y_oxbGA/edit?gid=1778783199#gid=1778783199](https://docs.google.com/spreadsheets/d/1LKTpZRG9sii31ZERMKt-w4fJQ2HMkexAYec8y_oxbGA/edit?gid=1778783199#gid=1778783199)

---

## 3. 2NF (Second Normal Form)

### Penjelasan Tabel 2NF

Tahap normalisasi yang mensyaratkan data sudah memenuhi kriteria 1NF dan **tidak ada lagi _partial dependency_ (ketergantungan sebagian)**, yaitu kondisi di mana atribut bukan kunci (_non-primary key_) bergantung hanya pada sebagian dari _primary key_ majemuk.

Dalam file `2nf_normalisasi.sql`, masalah tersebut diselesaikan dengan memecah tabel besar menjadi dua entitas terpisah:

1. **Tabel Transaksi**: Menyimpan informasi "header" atau induk transaksi (seperti data pelanggan, karyawan, tanggal, dan status bayar) yang bergantung sepenuhnya pada ID Transaksi.
2. **Tabel Detail Transaksi**: Menyimpan rincian item (seperti kode barang, nama barang, dan harga sewa) yang spesifik untuk setiap barang dalam transaksi tersebut.

Dengan demikian, redundansi data transaksi yang berulang pada setiap baris barang di tahap 1NF berhasil dihilangkan.

- **Link Spreadsheet:** [https://docs.google.com/spreadsheets/d/1LKTpZRG9sii31ZERMKt-w4fJQ2HMkexAYec8y_oxbGA/edit?gid=638611133#gid=638611133](https://docs.google.com/spreadsheets/d/1LKTpZRG9sii31ZERMKt-w4fJQ2HMkexAYec8y_oxbGA/edit?gid=638611133#gid=638611133)

---

## 4. 3NF (Third Normal Form)

### Penjelasan Tabel 3NF

Tahap normalisasi yang mensyaratkan data telah memenuhi 2NF dan **tidak boleh memiliki _transitive dependency_**, yaitu kondisi di mana atribut _non-primary key_ bergantung pada atribut _non-primary key_ lainnya (bukan langsung pada _primary key_ utama).

Dalam file `dbl_4_3nf_normalisasi.sql`, prinsip tersebut diterapkan dengan memisahkan atribut yang tidak bergantung langsung pada `ID_Transaksi` ke dalam tabel master tersendiri—seperti data Pelanggan (Nama, Alamat), dan Karyawan (Nama, Shift). Tabel Transaksi kini hanya menyimpan referensi (_Foreign Key_) ke entitas-entitas tersebut. Hal ini menjamin bahwa setiap perubahan data master (misalnya perubahan alamat pelanggan) cukup dilakukan di satu tempat tanpa perlu mengubah setiap baris riwayat transaksi, memastikan integritas data yang lebih baik.

### Daftar Tabel 3NF:

- `barang`
- `detail_transaksi`
- `karyawan`
- `kategori`
- `pelanggan`
- `transaksi`

* **Link Spreadsheet:** [https://docs.google.com/spreadsheets/d/1LKTpZRG9sii31ZERMKt-w4fJQ2HMkexAYec8y_oxbGA/edit?gid=1760608169#gid=1760608169](https://docs.google.com/spreadsheets/d/1LKTpZRG9sii31ZERMKt-w4fJQ2HMkexAYec8y_oxbGA/edit?gid=1760608169#gid=1760608169)

> **Referensi Gambar & Jawaban:** [Dokumen Google Docs](https://docs.google.com/document/d/1nffZLmrtbbr8APd5De2RXP3w0LlzJgciwxR94tOmvHA/edit?usp=sharing)

---

## 5. VIEW Laporan Frekuensi Penyewaan Alat

Query untuk melihat kategori barang apa yang paling sering disewa.

```sql
CREATE VIEW view_laporan_frekuensi_penyewaan AS
SELECT
    k.Nama_Kategori,
    COUNT(dt.kode_barang) AS Frekuensi_Sewa -- Disesuaikan dengan kolom 3NF (kode_barang)
FROM detail_transaksi dt
JOIN barang b ON dt.kode_barang = b.Kode_barang
JOIN kategori k ON b.Id_kategori = k.Id_kategori
GROUP BY k.Nama_Kategori
ORDER BY Frekuensi_Sewa DESC;
```

## 6. VIEW Statistik Keterlambatan Pelanggan

Query untuk memantau pelanggan yang sering terlambat dan total denda mereka.

```sql
CREATE VIEW view_statistik_keterlambatan_pelanggan AS
SELECT
    p.nama_pelanggan,
    COUNT(t.Id_transaksi) AS Jumlah_Keterlambatan,
    SUM(t.Denda) AS Total_Denda
FROM transaksi t
JOIN pelanggan p ON t.Id_Pelanggan = p.Id_pelanggan
WHERE t.Denda > 0 OR t.Keterlambatan_pembayaran LIKE '%telat%'
GROUP BY p.nama_pelanggan;
```

## 7. VIEW Deteksi Barang Bermasalah

Query untuk mendeteksi kategori barang yang sering dilaporkan rusak setelah dikembalikan.

```sql
CREATE VIEW view_deteksi_barang_bermasalah AS
SELECT
    k.Nama_Kategori,
    COUNT(dt.kode_barang) AS Jumlah_Rusak
FROM detail_transaksi dt
JOIN barang b ON dt.kode_barang = b.Kode_barang
JOIN kategori k ON b.Id_kategori = k.Id_kategori
WHERE dt.Kondisi_barang LIKE '%Rusak%'
GROUP BY k.Nama_Kategori
ORDER BY Jumlah_Rusak DESC;
```

## 8. Update Denda Keterlambatan Barang Kembali

Script untuk menghitung otomatis denda sebesar 15% dari total bayar dikali jumlah hari keterlambatan, jika tanggal bayar melebihi tanggal kembali.

```sql
UPDATE transaksi
SET Denda = (0.15 * Total_bayar * DATEDIFF(Tanggal_bayar, tanggal_kembali))
WHERE Tanggal_bayar > tanggal_kembali;
```

## 9. Update Keterangan Denda

Script untuk otomatis memberi keterangan "Kerusakan barang saat pengembalian" pada transaksi yang memiliki item rusak.

```sql
UPDATE transaksi t
JOIN detail_transaksi dt ON t.Id_transaksi = dt.Id_transaksi
SET t.Keterangan_denda = 'Kerusakan barang saat pengembalian'
WHERE dt.Kondisi_barang LIKE '%Rusak%';
```

## 10. VIEW Rata-rata Rating Pelanggan per Barang

Query untuk melihat kepuasan pelanggan terhadap spesifik barang.

```sql
CREATE VIEW view_rata_rata_rating_per_barang AS
SELECT
    b.Nama_barang,
    ROUND(AVG(t.Rating), 1) AS Rata_Rata_Rating
FROM detail_transaksi dt
JOIN transaksi t ON dt.Id_transaksi = t.Id_transaksi
JOIN barang b ON dt.kode_barang = b.Kode_barang
GROUP BY b.Nama_barang
ORDER BY Rata_Rata_Rating DESC;
```

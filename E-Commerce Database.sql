-- CREATING AND MAINTING DATABASE

CREATE DATABASE Proyek_Basdat_Kelompok01
ON PRIMARY (NAME = EcommercePrimary,
		FILENAME = 'C:\Users\asus\Documents\E-commerce.mdf',
		SIZE = 10MB,
		MAXSIZE = 10000MB,
		FILEGROWTH = 20%),
		(NAME = EcommerceSecondary,
		FILENAME = 'C:\Users\asus\Documents\E-commerce.ndf',
		SIZE = 5MB,
		MAXSIZE = 10000MB,
		FILEGROWTH = 30%)
LOG ON
		(NAME = EcommerceLog,
		FILENAME = 'C:\Users\asus\Documents\E-commerce.ldf',
		SIZE = 30MB,
		MAXSIZE = 5000MB,
		FILEGROWTH = 20%)

sp_helpdb Proyek_Basdat_Kelompok01

--Tabel Akun

CREATE TABLE Akun(
	Id_Akun varchar(10) PRIMARY KEY,
	Email varchar(50),
	Nama varchar(50),
	No_Telepon varchar(50),
	
);




INSERT INTO Akun (Id_Akun, Email, Nama, No_telepon)
VALUES 
('11S22', 'charlos@gmail.com', 'Charlos', '0812-1809-9848'),
('12S22', 'yessi@gmail.com', 'Yessi', '0812-6328-0007'),
('13S22', 'esra@gmail.com', 'Esra', '0858-3105-7136'),
('14S22', 'kartika@gmail.com', 'Kartika', '0813-6154-1794'),
('15S22', 'christian@gmail.com', 'Christian', '0812-6013-6699'),
('16S22', 'chalvin@gmail.com', 'Chalvin', '0853-6520-5722'),
('17S22', 'anton@gmail.com', 'Anton', '0822-6021-5832'),
('18S22', 'lena@gmail.com', 'Lena', '0812-7723-5987'),
('19S22', 'dilan@gmail.com', 'Dilan', '0813-8012-1714'),
('20S22', 'daniel@gmail.com', 'Daniel', '0853-9654-0004');

select * from Akun


-- Tabel Pelanggan

CREATE TABLE Pelanggan (
	Id_Pelanggan varchar(10) PRIMARY KEY,
	Nama varchar(50),
	Alamat varchar(50),
	
);

select * from Pelanggan


INSERT INTO Pelanggan (Id_Pelanggan, Nama, Alamat)
VALUES 
('13S22', 'Chalvin', 'Medan'),
('14S22', 'Yessi', 'Tarutung'),
('16S22', 'Anton', 'Balige'),
('11S22', 'Lena', 'Medan'),
('12S22', 'Dilan', 'Sibolga');

INSERT INTO Pelanggan (Id_Pelanggan, Nama, Alamat)
VALUES 
('21S22', 'David', 'Medan'),
('22S22', 'Andre', 'Tarutung'),
('23S22', 'Tian', 'Balige'),
('24S22', 'Johan', 'Medan'),
('25S22', 'Mitha', 'Sibolga');


select * from Pelanggan




-- Tabel Order

CREATE TABLE Orders (
    Id_Order varchar(10) PRIMARY KEY,
    Nama_Produk varchar(50),
    Diskon varchar(10),
    Harga varchar(10),
    Kuantitas varchar(10),
    Id_Pelanggan varchar(10) REFERENCES Pelanggan (Id_Pelanggan)
);

select * from Orders

INSERT INTO Orders (Id_Order, Nama_Produk, Diskon, Harga, Kuantitas, Id_Pelanggan)
VALUES 
('11CP1', 'Baju', '10%', 'Rp.75.000', '2', '13S22'),
('11CP2', 'Celana Pendek', '20%', 'Rp.70.000', '3', '14S22'),
('11CP3', 'Sendal Gunung', '15%', 'Rp.180.000', '1', '16S22'),
('11CP4', 'Sepatu', '17%', 'Rp.500.000', '1', '11S22'),
('11CP5', 'Hoodie', '10%', 'Rp.250.000', '1', '12S22');

INSERT INTO Orders (Id_Order, Nama_Produk, Diskon, Harga, Kuantitas, Id_Pelanggan)
VALUES
('11CP6', 'Gelang', '10%', 'Rp.15.000', '3', '21S22'),
('11CP7', 'Topi', '20%', 'Rp.33.000', '1', '22S22'),
('11CP8', 'Jam', '15%', 'Rp.500.000', '1', '23S22'),
('11CP9', 'Kaca mata', '17%', 'Rp.500.000', '1', '24S22'),
('11CP10', 'Boneka', '10%', 'Rp.300.000', '1', '25S22');

select * from Orders


-- Tabel Pembayaran 

CREATE TABLE Pembayaran (
    ID_Pembayaran varchar(10) PRIMARY KEY,
    Tanggal_Pembayaran date,
    Metode_Pembayaran varchar(50),
    Jumlah_Pembayaran int
);

select * from Pembayaran

INSERT INTO Pembayaran (ID_Pembayaran, Tanggal_Pembayaran, Metode_Pembayaran, Jumlah_Pembayaran)
VALUES 
('23P01', '2023-01-01', 'Internet Banking', 2),
('23P02', '2023-01-02', 'COD', 3),
('23P03', '2023-01-03', 'COD', 1),
('23P04', '2023-01-04', 'COD', 1),
('23P05', '2023-01-05', 'Internet Banking', 1);

select * from Pembayaran



-- Tabel Detail Pesanan

CREATE TABLE Detail_Pesanan (
    No_Pesanan INT PRIMARY KEY,
    Id_Order VARCHAR(10),
    Id_Produk VARCHAR(10),
    Nama_Pesanan VARCHAR(50),
    Kuantitas INT,
    Tanggal_Pesanan DATE,
    Harga_Satuan VARCHAR(20),
    Status_Pesanan VARCHAR(50),
    Jasa_Pengiriman VARCHAR(50),
    CONSTRAINT FK_Id_Order FOREIGN KEY (Id_Order) REFERENCES Orders(Id_Order)
);

select * from Detail_Pesanan

INSERT INTO Detail_Pesanan (No_Pesanan, Id_Order, Id_Produk, Nama_Pesanan, Kuantitas, Tanggal_Pesanan, Harga_Satuan, Status_Pesanan, Jasa_Pengiriman)
VALUES 
(122, '11CP1', '11YS1', 'Baju', 2, '2023-01-01', 'Rp. 75.000', 'Sudah dibayar', 'JNT'),
(222, '11CP2', '11YS2', 'Celana Pendek', 3, '2023-01-01', 'Rp. 70.000', 'Belum dibayar', 'JNT'),
(322, '11CP3', '11YS3', 'Sendal Gunung', 1, '2023-01-01', 'Rp. 180.000', 'Belum dibayar', 'JNT'),
(422, '11CP4', '11YS4', 'Sepatu', 1, '2023-01-01', 'Rp. 500.000', 'Belum dibayar', 'JNT'),
(522, '11CP5', '11YS5', 'Hoodie', 1, '2023-01-01', 'Rp. 250.000', 'Sudah dibayar', 'JNT');


select * from Detail_Pesanan



-- Tabel Penjual

CREATE TABLE Penjual (
    ID_Penjual VARCHAR(10) PRIMARY KEY,
    Nama_Toko VARCHAR(50),
    Alamat_Toko VARCHAR(100)
);

select * from Penjual

INSERT INTO Penjual (ID_Penjual, Nama_Toko, Alamat_Toko)
VALUES 
('11S22', 'Charlos Shop', 'Jakarta Timur'),
('13S22', 'Mari Belanja', 'Medan'),
('14S22', 'Jamet Store', 'Kalimantan'),
('15S22', 'Serba ada', 'Medan'),
('20S22', 'Your Fashion', 'Jakarta Timur');

select * from Penjual



-- Tabel Pengiriman

CREATE TABLE Pengiriman (
    No_Resi VARCHAR(10) PRIMARY KEY,
    Jasa_Pengiriman VARCHAR(50),
    Tanggal_Pesanan DATE,
    Status_Pengiriman VARCHAR(50),
    Alamat_Pengiriman VARCHAR(100),
    ID_Penjual VARCHAR(10),
    FOREIGN KEY (ID_Penjual) REFERENCES Penjual(ID_Penjual)
);


select * from Pengiriman

INSERT INTO Pengiriman (No_Resi, Jasa_Pengiriman, Tanggal_Pesanan, Status_Pengiriman, Alamat_Pengiriman, ID_Penjual)
VALUES 
('JNT01', 'JNT', '2023-01-01', 'Dikemas', 'Medan', '11S22'),
('JNT02', 'JNT', '2023-01-01', 'Dalam Perjalanan', 'Medan', '13S22'),
('JNT03', 'JNT', '2023-01-01', 'Dalam Perjalanan', 'Tarutung', '14S22'),
('JNT04', 'JNT', '2023-01-01', 'Dikemas', 'Balige', '15S22'),
('JNT05', 'JNT', '2023-01-01', 'Dikemas', 'Medan', '20S22');


select * from Pengiriman



-- Tabel Produk

CREATE TABLE Produk (
    ID_Produk VARCHAR(10) PRIMARY KEY,
    Nama_Produk VARCHAR(50),
    Harga VARCHAR(20),
    Kuantitas INT,
    Kategori VARCHAR(50),
    ID_Penjual VARCHAR(10),
    ID_Keranjang VARCHAR(10),
    FOREIGN KEY (ID_Penjual) REFERENCES Penjual(ID_Penjual)
);

select * from Produk

INSERT INTO Produk (ID_Produk, Nama_Produk, Harga, Kuantitas, Kategori, ID_Penjual, ID_Keranjang)
VALUES 
('11YS1', 'Baju', 'Rp. 75.000', 2, 'Pakaian', '11S22', 'P001'),
('11YS2', 'Celana Pendek', 'Rp. 70.000', 3, 'Pakaian', '13S22', 'P002'),
('11YS3', 'Sendal Gunung', 'Rp. 180.000', 1, 'Sendal', '14S22', 'P003'),
('11YS4', 'Sepatu', 'Rp. 500.000', 1, 'Sepatu', '15S22', 'P004'),
('11YS5', 'Hoodie', 'Rp. 250.000', 1, 'Pakaian', '20S22', 'P005');


select * from Produk



-- Tabel Keranjang

CREATE TABLE Keranjang (
    ID_Keranjang VARCHAR(10) PRIMARY KEY,
    ID_Pelanggan VARCHAR(10),
    Kuantitas INT,
    Catatan VARCHAR(50)
);

select * from Keranjang

INSERT INTO Keranjang (ID_Keranjang, ID_Pelanggan, Kuantitas, Catatan)
VALUES 
('P001', '13S22', 2, 'Stok tersedia'),
('P002', '14S22', 3, 'Stok habis'),
('P003', '16S22', 1, 'Stok tersedia'),
('P004', '11S22', 1, 'Stok habis'),
('P005', '12S22', 1, 'Stok tersedia');

select * from Keranjang


-- Tabel Tinjauan

CREATE TABLE Tinjauan (
    ID_Tinjauan VARCHAR(10) PRIMARY KEY,
    Isi_Tinjauan VARCHAR(100),
    Tanggal_Tinjauan DATE,
    Rating INT,
    ID_Produk VARCHAR(10),
    ID_Pelanggan VARCHAR(10),
    FOREIGN KEY (ID_Produk) REFERENCES Produk(ID_Produk),
    FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan(ID_Pelanggan)
);


select * from Tinjauan

INSERT INTO Tinjauan (ID_Tinjauan, Isi_Tinjauan, Tanggal_Tinjauan, Rating, ID_Produk, ID_Pelanggan)
VALUES 
('001T1', 'Kualitas barang baik', '2023-01-06', 4, '11YS1', '13S22'),
('001T2', 'Kualitas barang sangat baik', '2023-01-07', 5, '11YS2', '14S22'),
('001T3', 'Kualitas barang baik', '2023-01-08', 3, '11YS3', '16S22'),
('001T4', 'Kualitas barang kurang baik', '2023-01-09', 2, '11YS4', '11S22'),
('001T5', 'Kualitas barang baik', '2023-01-10', 4, '11YS5', '12S22');


select * from Tinjauan

/*1. Used to remove a Tabel definition and all the data, indexes, triggers, constraints
and permission specifications for employees and salary_grade Tabel */

drop Table Akun

select * from Akun

/* 2. Add a data manager according to the data shown. Then, show all data manage */INSERT INTO Detail_Pesanan (No_Pesanan, Id_Order, Id_Produk, Nama_Pesanan, Kuantitas, Tanggal_Pesanan, Harga_Satuan, Status_Pesanan, Jasa_Pengiriman)
VALUES 
(622, '11CP6', '11YS6', 'Gelang', 3, '2023-01-01', 'Rp. 15.000', 'Sudah dibayar', 'JNT'),
(722, '11CP7', '11YS7', 'Topi', 1, '2023-01-01', 'Rp. 33.000', 'Belum dibayar', 'JNT'),
(822, '11CP8', '11YS8', 'Jam', 1, '2023-01-01', 'Rp. 500.000', 'Belum dibayar', 'JNT'),
(922, '11CP9', '11YS9', 'Kaca mata', 1, '2023-01-01', 'Rp. 500.000', 'Belum dibayar', 'JNT'),
(1022, '11CP10', '11YS10', 'Boneka', 1, '2023-01-01', 'Rp. 300.000', 'Sudah dibayar', 'JNT');

select * from Detail_Pesanan

/* 3. Change the Pelanggan data which has Id_Pelanggan is 13S22! Show all
of user identity in the Pelanggan Tabel! */

UPDATE Pelanggan
SET nama = 'Andika'
WHERE Id_Pelanggan = '13S22'

SELECT * FROM Pelanggan

/* 4. Displays data on ordered items whose price is below 200,000 and has a name ending
with the letter "G" character!*/

SELECT Nama_Pesanan, Harga_Satuan
FROM Detail_Pesanan
WHERE Nama_Pesanan LIKE '%G' AND Harga_Satuan < 'Rp. 200.000';


/* 5. Change the Detail Pesanan data which has No_pesanan is 622! Show all
of Pesanan in the Detail Pesanan Tabel! */

UPDATE Detail_Pesanan
SET No_Pesanan = '622'
WHERE No_Pesanan = '622'
SELECT * FROM Detail_Pesanan

/*6. Add status column to the Pelanggan Tabel which has data type varchar */
ALTER Table Pelanggan
ADD Aktivitas VARCHAR (50);

SELECT * FROM Pelanggan

/*7. Deleting the Aktivitas column in the Pelanggan Tabel */
ALTER Table Pelanggan
DROP COLUMN Aktivitas;

SELECT * FROM Pelanggan

/*8. Used to perform operations such as addition to Pesanan Prices */

SELECT 
    No_Pesanan,
    Id_Order,
    Id_Produk,
    Nama_Pesanan,
    Kuantitas,
    Tanggal_Pesanan,
    Harga_Satuan AS 'Harga Satuan',
    CONCAT('Rp. ', FORMAT(CAST(REPLACE(REPLACE(Harga_Satuan, 'Rp. ', ''), '.', '') + 10000 AS INT), 'N0')) AS 'Jumlah Harga'
FROM 
    Detail_Pesanan;



/*9. Multiplication between the Kuantitas column and the Harga Satuan to get the total harga*/

SELECT 
    No_Pesanan,
    Id_Order,
    Id_Produk,
    Nama_Pesanan,
    Kuantitas AS 'Kuantitas',
    Tanggal_Pesanan,
    Harga_Satuan AS 'Harga_Satuan',
    CONCAT('Rp. ', FORMAT(Kuantitas * CAST(REPLACE(REPLACE(Harga_Satuan, 'Rp. ', ''), '.', '') AS INT), 'N0')) AS 'Total Harga'
FROM 
    Detail_Pesanan;


/*10. Show No_Pesanan, Id_Produk, Nama_Pesanan, and Kuantitas that has a Kuantitas above 2 */
SELECT 
    No_Pesanan,
    Id_Produk,
    Nama_Pesanan,
    Kuantitas
FROM 
    Detail_Pesanan
WHERE 
    Kuantitas > 2;


/*11. Tampilkan Id_Produk dan Nama_Pesanan dari tabel Produk. Urutkan data berdasarkan id paling awal! */
SELECT 
    P.ID_Produk,
    DP.Nama_Pesanan
FROM 
    Produk P
LEFT JOIN 
    Detail_Pesanan DP ON P.ID_Produk = DP.Id_Produk
ORDER BY 
    P.ID_Produk ASC;



/*1. Tampilkan Id_Pesanan dan Nama_Pesanan dari tabel Detail Pesanan*/

SELECT DISTINCT Id_Produk, Nama_Pesanan
FROM Detail_Pesanan
SELECT * FROM Detail_Pesanan

/*2. Mengembalikan Semua No_Pesanan dan Id_Produk semua akun*/

SELECT No_Pesanan, Id_Produk
FROM Detail_Pesanan
ORDER BY No_Pesanan, Id_Produk;

/* 3.  Menggunakan Kombinasi Nilai di No_Pesanan dan Nama_Pesanan untuk Mengevaluasi Duplikat */

SELECT DISTINCT No_Pesanan, Nama_Pesanan
FROM Detail_Pesanan

/* 4. Featuring Nama_Pesanan along with Pesanan material*/

SELECT DISTINCT Nama_Pesanan
FROM Detail_Pesanan
GROUP BY Nama_Pesanan

/* 5. Count Number of Unique Rows */

SELECT COUNT(DISTINCT Nama_Pesanan)
FROM Detail_Pesanan


/*1. Menampilkan Nama dan No_telepon dari Akun yang memiliki Email 'gmail.com'*/

SELECT Nama, No_telepon
FROM Akun
WHERE Email IN (
    SELECT Email
    FROM Akun
    WHERE Email LIKE '%@gmail.com'
);


/*2. Menampilkan Nama dari Akun yang memiliki Id_Akun unik (tidak ada yang sama dengan akun lain)*/

SELECT Nama
FROM Akun
WHERE (SELECT COUNT(*) FROM Akun AS A WHERE A.Id_Akun = Akun.Id_Akun) = 1;


/*3. Menampilkan Id_Produk dan Nama_Pesanan dari pesanan yang Status_Pesanan-nya sudah dibayar ('Sudah dibayar')*/

SELECT Id_Produk, Nama_Pesanan
FROM Detail_Pesanan
WHERE No_Pesanan IN (
    SELECT No_Pesanan
    FROM Detail_Pesanan
    WHERE Status_Pesanan = 'Sudah dibayar'
);


/*4. Menampilkan No_Pesanan dan Tanggal_Pesanan dari pesanan dengan Kuantitas terbanyak*/

SELECT No_Pesanan, Tanggal_Pesanan
FROM Detail_Pesanan
WHERE Kuantitas = (
    SELECT MAX(Kuantitas)
    FROM Detail_Pesanan
);

/*5. Menampilkan No_Pesanan dan Id_Order dari pesanan yang menggunakan Jasa_Pengiriman 'JNT' dan belum dibayar*/

SELECT No_Pesanan, Id_Order
FROM Detail_Pesanan
WHERE Status_Pesanan = 'Belum dibayar' 
AND Jasa_Pengiriman = 'JNT';



/* 1. INNER JOIN menggabungkan tabel Pelanggan dengan tabel Penjual berdasarkan ID_Pelanggan */

SELECT Pelanggan.Id_Pelanggan, Pelanggan.Nama AS Nama_Pelanggan, Pelanggan.Alamat AS Alamat_Pelanggan,
       Penjual.ID_Penjual, Penjual.Nama_Toko, Penjual.Alamat_Toko
FROM Pelanggan
INNER JOIN Penjual ON Pelanggan.Id_Pelanggan = Penjual.ID_Penjual;



/* 2. LEFT JOIN menggabungkan tabel Pelanggan dengan tabel Penjual berdasarkan ID_Pelanggan */

SELECT *
FROM Pelanggan P
LEFT JOIN Penjual PJ ON P.Id_Pelanggan = PJ.ID_Penjual;


/* 3. RIGHT JOIN menggabungkan tabel Pelanggan dengan tabel Penjual berdasarkan ID_Pelanggan */

SELECT *
FROM Penjual
RIGHT JOIN Pelanggan ON Penjual.ID_Penjual = Pelanggan.Id_Pelanggan;


/* 4. OUTER JOIN menggabungkan tabel Pelanggan dengan tabel Penjual berdasarkan ID_Pelanggan */

SELECT Pelanggan.Id_Pelanggan, Pelanggan.Nama AS Nama_Pelanggan, Pelanggan.Alamat AS Alamat_Pelanggan, Penjual.Nama_Toko, Penjual.Alamat_Toko
FROM Pelanggan
FULL OUTER JOIN Penjual ON Pelanggan.Id_Pelanggan = Penjual.ID_Penjual;


/* 5. CROSS JOIN menggabungkan tabel Pelanggan dengan tabel Penjual berdasarkan ID_Pelanggan */


SELECT p.Id_Pelanggan, p.Nama AS 'Nama Pelanggan', p.Alamat AS 'Alamat Pelanggan', 
       pj.ID_Penjual, pj.Nama_Toko AS 'Nama Toko', pj.Alamat_Toko AS 'Alamat Toko'
FROM Pelanggan p
CROSS JOIN Penjual pj;




/* 1. View 1 - Daftar Detail Pesanan */

CREATE VIEW Daftar_Pesanan AS
SELECT No_Pesanan, Nama_Pesanan, Kuantitas, Tanggal_Pesanan, Harga_Satuan
FROM Detail_Pesanan;

SELECT * FROM Daftar_Pesanan;

/* 2. View 2 - Daftar Pelanggan */

CREATE VIEW Daftar_Pelanggan AS
SELECT Id_Pelanggan, Nama, Alamat
FROM Pelanggan;

SELECT * FROM Daftar_Pelanggan;



/* 3. View 3 - Detail Order Pelanggan */

CREATE VIEW Order_Pelanggan AS
SELECT O.Id_Order, O.Nama_Produk, O.Harga, O.Kuantitas, P.Nama AS 'Nama Pelanggan'
FROM Orders O
JOIN Pelanggan P ON O.Id_Pelanggan = P.Id_Pelanggan;

SELECT * FROM Order_Pelanggan;


/* 4. View 4 - Tinjauan Produk */

CREATE VIEW Tinjauan_Produk AS
SELECT T.ID_Tinjauan, T.Isi_Tinjauan, T.Tanggal_Tinjauan, T.Rating, P.Nama_Produk
FROM Tinjauan T
JOIN Produk P ON T.ID_Produk = P.ID_Produk;

SELECT * FROM Tinjauan_Produk;



/* 5. View 5 - Penjual dan Pengiriman */

CREATE VIEW Penjual_Pengiriman AS
SELECT PJ.ID_Penjual, PJ.Nama_Toko, PG.No_Resi, PG.Tanggal_Pesanan, PG.Status_Pengiriman
FROM Penjual PJ
JOIN Pengiriman PG ON PJ.ID_Penjual = PG.ID_Penjual;


SELECT * FROM Penjual_Pengiriman;


-- Membuat fungsi untuk menghitung total harga pesanan
CREATE FUNCTION HitungTotalHargaFormatted(@HargaSatuan VARCHAR(20), @Kuantitas INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Total INT
    SET @Total = CAST(REPLACE(REPLACE(@HargaSatuan, 'Rp. ', ''), '.', '') AS INT) * @Kuantitas
    RETURN 'Rp.' + FORMAT(@Total, 'N0')
END


SELECT dbo.HitungTotalHargaFormatted(Harga_Satuan, Kuantitas) AS Total_Harga_Formatted
FROM Detail_Pesanan;


-- Menghitung rata-rata harga dari produk 

CREATE FUNCTION dbo.fn_HargaRataRata()
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @AvgPrice DECIMAL(18, 2);
    -- Query untuk menghitung rata-rata harga
    SELECT @AvgPrice = AVG(CAST(REPLACE(REPLACE(Harga, 'Rp. ', ''), '.', '') AS DECIMAL(18, 2)))
    FROM Produk;
    RETURN @AvgPrice;
END;
GO

SELECT FORMAT(dbo.fn_HargaRataRata(), 'Rp ###,###,###.00') AS 'Rata-rata Harga';


-- Menampilkan Semua Data dari Tabel Orders
CREATE PROCEDURE ShowOrders
AS
BEGIN
    SELECT * FROM Orders
END;

EXEC ShowOrders;




-- Menampilkan seluruh data dari Tabel Detail Pesanan

CREATE PROCEDURE ShowOrderDetails
AS
BEGIN
    SELECT 
        No_Pesanan,
        Id_Order,
        Id_Produk,
        Nama_Pesanan,
        Kuantitas,
        Tanggal_Pesanan,
        Harga_Satuan,
        Status_Pesanan,
        Jasa_Pengiriman
    FROM 
        Detail_Pesanan;
END;

EXEC ShowOrderDetails;


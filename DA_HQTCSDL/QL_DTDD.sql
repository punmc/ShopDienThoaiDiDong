
-- Tao DaTa Luu O O C:\ Va Cac thong so
use master
create database QL_DTDD
on primary
(
        name ='QL_DTDD_PRIMARY',
        filename= 'C:\Users\Administrator\Desktop\DA_HQTCSDL\QT_DTDD_DaTa.mdf',
        size= 2 MB,
        maxsize= unlimited,
        filegrowth=10%
)
log on
(
        name= 'QL_DTDD_LOG',
        filename= 'C:\Users\Administrator\Desktop\DA_HQTCSDL\QT_DTDD_DaTa.ldf',
        size= 2 MB,
        maxsize= 20 MB,
        filegrowth= 10%
)
use  QL_DTDD
GO
CREATE TABLE KHACHHANG
(
	MAKH CHAR (7) NOT NULL,
	TENKH NVARCHAR (50),
	NGAYSINH DATE,
	PHAI NVARCHAR(5),
	DIACHI NVARCHAR (50),
	SDT NVARCHAR (11),
	NGAYDK DATE,
	DIEMTHUONG INT,
	CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)
)
CREATE TABLE NHANVIEN
(
	MANV CHAR (7) NOT NULL,
	HOTEN NVARCHAR (50),
	NGAYSINH DATE,
	GIOITINH NVARCHAR (5),
	DCHI NVARCHAR (50),
	SDTNV NVARCHAR (11),
	NGAYVL DATE,
	LUONG MONEY,
	PHUCAP MONEY,
	CHUCVU NVARCHAR (30),
	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV)
)


CREATE TABLE SANPHAM
(
	MAHANG CHAR (7) NOT NULL,
	TENHANG NVARCHAR (50),
	HANGSX NVARCHAR (20),
	SOLUONGSPTON INT,
	DVT NVARCHAR (10),
	NUOCSX NVARCHAR (50),
	GIASP MONEY,
	CONSTRAINT PK_SANPHAM PRIMARY KEY (MAHANG)
)

CREATE TABLE NHACUNGCAP
(
	MANHACC CHAR (7) NOT NULL,
	TENNHACC NVARCHAR (50),
	TENGIAODICH NVARCHAR (20),
	DIACHICC NVARCHAR (80),
	SDTCC NVARCHAR (11),
	CONSTRAINT PK_NHACUNGCAP PRIMARY KEY (MANHACC)
)


CREATE TABLE HOADON
(
	MAHD CHAR (7) NOT NULL,
	MAKH CHAR (7),
	MANV CHAR (7),
	NGAYDAT DATE,
	NGAYGIAO DATE,
	NOIGIAO NVARCHAR (50),
	TONGTIEN MONEY,
	CONSTRAINT PK_HOADON PRIMARY KEY (MAHD),
	CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG (MAKH),
	CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN (MANV)
)

CREATE TABLE CHITIETHD
(
	MAHD CHAR (7) NOT NULL,
	MAHANG CHAR (7) NOT NULL,
	SERI CHAR (15),
	SOLUONG INT,
	GIAGOC MONEY,
	MUCGIAMGIA float,
	CONSTRAINT PK_CHITIETHD PRIMARY KEY (MAHD,MAHANG),
	CONSTRAINT FK_CHITIETHD_HOADON FOREIGN KEY (MAHD) REFERENCES HOADON (MAHD),
	CONSTRAINT FK_CHITIETHD_SANPHAM FOREIGN KEY (MAHANG) REFERENCES SANPHAM (MAHANG)
)

CREATE TABLE DOTKM 
(
	MADOTKM CHAR (7) NOT NULL,
	NGAYBD DATE,
	NGAYKT DATE,
	CONSTRAINT PK_DOTKM PRIMARY KEY (MADOTKM)
)

CREATE TABLE CHITIETKM
(
	MADOTKM CHAR (7) NOT NULL,
	MAHANG CHAR (7) NOT NULL,
	TILEGIAMGIA float,
	CONSTRAINT PK_CHITIETKM PRIMARY KEY (MADOTKM,MAHANG),
	CONSTRAINT FK_CHITIETKM_DOTKM FOREIGN KEY (MADOTKM) REFERENCES DOTKM (MADOTKM),
	CONSTRAINT FK_CHITIETKM_SANPHAM FOREIGN KEY (MAHANG) REFERENCES SANPHAM (MAHANG)
)

CREATE TABLE PHIEUNHAP 
(
	MAPN CHAR (7) NOT NULL,
	NGAYNHAP DATE,
	MANHACC CHAR (7),
	TONGTIENNHAP MONEY,
	CONSTRAINT PK_PHIEUNHAP PRIMARY KEY (MAPN),
	CONSTRAINT FK_PHIEUNHAP_NHACUNGCAP FOREIGN KEY (MANHACC) REFERENCES NHACUNGCAP (MANHACC)
)

CREATE TABLE CHITIETTPN
(
	MAPN CHAR (7) NOT NULL,
	MAHANG CHAR (7) NOT NULL,
	SLNHAP INT,
	GIANHAP MONEY,
	CONSTRAINT PK_CHITIETPN PRIMARY KEY (MAPN,MAHANG),
	CONSTRAINT FK_CHITIETPN_SANPHAM FOREIGN KEY (MAHANG) REFERENCES SANPHAM (MAHANG),
	CONSTRAINT FK_CHITIETPN_PHIEUNHAP FOREIGN KEY (MAPN) REFERENCES PHIEUNHAP(MAPN)
)
------------------
----các ràng buộc
ALTER TABLE KHACHHANG
ADD CONSTRAINT DE_PHAI DEFAULT N'NAM' FOR PHAI 

ALTER TABLE KHACHHANG
ADD CONSTRAINT CK_PHAI CHECK(PHAI=N'NAM' OR PHAI=N'NỮ')

ALTER TABLE KHACHHANG
ADD CONSTRAINT CK_DIEMTHUONG CHECK (DIEMTHUONG>0)
---------------------------------------------------
ALTER TABLE NHANVIEN
ADD CONSTRAINT DE_GIOITINH DEFAULT N'NAM' FOR GIOITINH

ALTER TABLE NHANVIEN
ADD CONSTRAINT CK_PHUCAP CHECK (PHUCAP>0)

ALTER TABLE NHANVIEN
ADD CONSTRAINT CK_GIOITINH CHECK(GIOITINH=N'NAM' OR GIOITINH=N'NỮ')
------------------------------------------------------------------
ALTER TABLE SANPHAM
ADD CONSTRAINT CK_SOLUONGSPTON CHECK (SOLUONGSPTON>0)

ALTER TABLE SANPHAM
ADD CONSTRAINT UNI_TENHANG UNIQUE (TENHANG)
-------------------------------------------------------------------
ALTER TABLE NHACUNGCAP
ADD CONSTRAINT UNI_TENNHACC UNIQUE (TENNHACC)
-------------------------------------------------------------------
ALTER TABLE HOADON
ADD CONSTRAINT CK_TONGTEN CHECK (TONGTIEN>0)
-------------------------------------------------------------------
ALTER TABLE CHITIETHD 
ADD CONSTRAINT CK_SOLUONG CHECK (SOLUONG>0)
-------------------------------------------------------------------
ALTER TABLE CHITIETPN
ADD CONSTRAINT CK_SLNHAP CHECK (SLNHAP>0)
-------------------------------------------------------------------
-----ngày đặt <= ngày giao
CREATE TRIGGER NGAYDAT_NGAYGIAO
ON HOADON
FOR INSERT, UPDATE
AS
	IF((SELECT NGAYDAT FROM HOADON) > (SELECT NGAYGIAO FROM inserted))
	BEGIN
		PRINT 'NGÀY GIAO PHẢI SAU NGÀY ĐẶT HÀNG'
		ROLLBACK TRAN
	END
	ELSE
		COMMIT TRAN
	
-----------------------------------------
--nhập dữ liệu 
--bảng khách hàng
bulk insert KHACHHANG
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\KhachHang.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)
select *from KHACHHANG

--bảng nhân viên
bulk insert NHANVIEN
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\NhanVien.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)
select*from NHANVIEN
--bảng sản phẩm
bulk insert SANPHAM
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\SanPham.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)
select*from SANPHAM
--bảng NCC
bulk insert NHACUNGCAP
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\NhaCungCap.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)
select*from NHACUNGCAP
--bảng hóa đơn 
bulk insert HOADON
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\HoaDon.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)
select*from HOADON
--bảng CTHD
bulk insert CHITIETHD
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\ChiTietHD.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)
select*from CHITIETHD
--bảng DOTKM
bulk insert DOTKM
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\DotKM.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)
select*from DOTKM
--bảng CTKM
bulk insert CHITIETKM
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\ChiTietKM.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)

select*from CHITIETKM
--bảng PN
bulk insert PHIEUNHAP
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\PhieuNhap.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)

select*from PHIEUNHAP
--bảng CTPN
bulk insert CHITIETPN
FROM 'C:\Users\Administrator\Desktop\DA_HQTCSDL\ChiTietPN.txt'
with
(
rowterminator ='\n',
fieldterminator='	',
firstrow=2
)

select*from CHITIETPN


















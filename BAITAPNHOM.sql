CREATE DATABASE BAITAPNHOM
use BAITAPNHOM
go
-- Tạo bảng Bàn
create table Ban 
(
	Maban varchar(3) not null,
	Loaiban nvarchar(50),
	Khuvuc nvarchar(50),
	primary key(Maban)
)
go 
-- Tạo bảng Sản Phẩm 
create table Sanpham 
(
	MaSP varchar(5) not null,
	TenSP nvarchar(50) not null,
	DonGia numeric(10,0) not null,
	primary key (MaSP)
)
go
---Tạo bảng Khách Hàng
create table Khachhang 
(
	MaKH varchar(5) not null,
	TenKH nvarchar(50) not null,
	Ngaysinh date,
	SDT varchar(10) not null,
	Diachi nvarchar(100),
	primary key (MAKH)
)
go
--Tạo bảng Nhân Viên
create table Nhanvien
(
	MaNV varchar(5) not null,
	TenNV nvarchar(50)not null,
	Ngaysinh date not null,
	SDTNV varchar(10) not null,
	Diachi nvarchar(100),
	primary key (MANV)
)
go
--Tạo bảng Nhà cung cấp
create table NCC
(
	MaNCC varchar(5) not null,
	TenNCC nvarchar(50) not null,
	Diachi nvarchar(100) not null,
	SDTNCC varchar(10) not null,
	primary key (MaNCC)
)

-- Tạo bảng Phiếu nhập kho 
create table Phieunhapkho
(
	MaPN varchar(5) not null,
	MaNV varchar(5) not null,
	MaNCC varchar(5) not null,
	Ngaynhap date not null,
	Ghichu nvarchar(100),
	primary key (MaPN),
	foreign key (MaNV) references Nhanvien,
	foreign key (MaNCC) references NCC
)
go
--Tạo bảng Chi tiết phiếu nhập
create table CTPN
(
	MaPN varchar(5) not null,
	MaHang varchar(3) not null,
	Tenhang nvarchar(50) not null,
	Donvitinh nvarchar(10) not null,
	Soluong int not null,
	DonGia numeric(10,0) not null,
	Thanhtien numeric(10,0),
	foreign key (MaPN) references Phieunhapkho,
	constraint PK_CTPN primary key(MaHang,MaPN)
)
go
---Tạo bảng Hóa Đơn 
create table Hoadon 
(
	MaHD varchar(5) not null, 
	MaKH varchar(5) not null,
	MaNV varchar(5) not null,
	NgayHD datetime not null,
	MaBan varchar(3),
	primary key (MaHD),
	foreign key (MaKH) references Khachhang,
	foreign key (Maban)references Ban,
	foreign key (MaNV) references Nhanvien
) 
go
--Tạo bảng Chi tiết hóa đơn
create table CTHD
(
	MaHD varchar(5) not null,
	MaSP varchar(5) not null,
	Dongia numeric(10,0) not null,
	Soluong int not null,
	Tongtien numeric(10,0),
	Tienkhachtra numeric(10,0) not null,
	Tiendu numeric(10,0),
	foreign key(MaHD) references HoaDon,
	foreign key(MaSP) references Sanpham,
	constraint PK_CTHD primary key (MaHD, MaSP)
)
go
--Nhập dữ liệu cho bảng Bàn
	insert into Ban
	values
	('001','Tron','Tang1'),
	('002','Dai','Tang1'),
	('003','Tron','Tang1'),
	('004','Vuong','Tang1'),
	('005','Dai','Tang2'),
	('006','Tron','Tang2'),
	('007','Vuong','Tang2'),
	('008','Tron','Tang2'),
	('009','Tron','Sanh'),
	('010','Dai','Sanh')
	go
--Nhập dữ liệu bảng Nhanvien
	insert into Nhanvien
	values
	('NV001',N'Nguyễn Văn Hùng', '1999/01/01','0702543604',N'19 ĐƯỜNG SỐ 1, ĐIỆN QUANG, ĐIỆN BÀN, QUẢNG NAM'),
	('NV002',N'Nguyễn Thị Hà', '2000/04/02','0788282848',N'HÒA SƠN, HÒA VANG, ĐÀ NẴNG'),
	('NV003',N'Phạm Thị Hoa','2001/12/04','0345453643',N'67 TRẦN VĂN DƯ, MỸ AN, NGŨ HÀNH SƠN, ĐÀ NẴNG'),
	('NV004',N'Hồ Văn Dũng','2002/10/12','0383004005',N'01 THOẠI NGỌC HẦU, TAM KỲ, QUẢNG NAM'),
	('NV005',N'Trần Thị Minh','2002/08/05','0737123321',N'11 THÚC TỀ, THANH KHÊ, TP. ĐÀ NẴNG')
	go
--Nhập dữ liệu bảng Khách hàng
	insert into Khachhang
	values
	('KH001',N'Đào Thị Hương Giang','2002/11/29','0364914502', N'TỔ 2, KHUÊ MỸ, NGŨ HÀNH SƠN, ĐÀ NẴNG'),
	('KH002',N'Dương Thị Kim Cúc','2002/10/08','0707458702', N'123 HOÀI THANH, MỸ AN, NGŨ HÀNH SƠN, ĐÀ NẴNG'),
	('KH003',N'Phạm Thị Vân','2001/03/02','0395785647',N'TỔ 19 - PHƯỜNG PHƯỚC MỸ - SƠN TRÀ - ĐÀ NẴNG '),
	('KH004',N'Nguyễn Thị Thúy Hằng','2002/10/05','0325232353',N'K907 NGUYỄN LƯƠNG BẰNG- QUẬN LIÊU CHIỂU- ĐÀ NẴNG'),
	('KH005',N'Lưu Vĩnh Khôi','1999/02/01', '0722345622',N'TỔ 45 ĐA PHƯỚC II, HÒA KHÁNH BẮC, LIÊN CHIỂU, ĐÀ NẴNG')
	go
--Nhập dữ liệu bảng Sản phẩm
	insert into Sanpham
	values 
	('SP001','Iced Espresso','30000'),
	('SP002','Iced Cafe Latte','32000'),
	('SP003','Americcano','38000'),
	('SP004','Hot Capuchino','40000'),
	('SP005','Chanh Tuyết','35000'),
	('SP006','Passio Chill','32000'),
	('SP007','Cookie Cream','29000'),
	('SP008','Teatox','30000'),
	('SP009','Matcha Green Tea','35000'),
	('SP010','Cà Phê Túi Lọc ','25000'),
	('SP011','Pinky Summer','27000'),
	('SP012','Ananas Tea','30000'),
	('SP013','Peach Tea','25000'),
	('SP014','Teatox','32000'),
	('SP015','Cà phê Blend','25000')
	go
	drop table Hoadon
	
----Nhập dữ liệu Hóa đơn
    insert into Hoadon
	values
	('HD001','KH001','NV001','2022-04-02 08:07:04.000','001'),
	('HD002','KH001','NV001','2022-04-16 10:08:21','002'),
	('HD003','KH003','NV002','2022-04-16 18:08:01',null),
	('HD004','KH003','NV003','2022-05-10 17:08:22','003'),
	('HD005','KH005','NV003','2022-06-12 13:36:12','001'),
	('HD006','KH001','NV003','2022-06-13 10:45:32','007'),
	('HD007','KH003','NV001','2022-07-18 16:08:11','009'),
	('HD008','KH002','NV002','2022-09-20 15:14:14',null),
	('HD009','KH001','NV003','2022-10-10 13:22:21','004'),
	('HD010','KH004','NV002','2022-10-29 06:05:05','006')
	go
--Nhập dữ liệu NCC
	insert into NCC
	values
	('NCC01',N'Cửa hàng Hương Giang',N'TỔ 10, KHUÊ MỸ, NGŨ HÀNH SƠN, ĐÀ NẴNG','0373734347'),
	('NCC02',N'Mart Thúy Hằng',N'61 An Dương Vương, Ngũ Hành Sơn, Đà Nẵng','0777566765'),
	('NCC03',N'Vân Coffe',N'51 NGUYỄN LƯƠNG BẰNG- QUẬN LIÊU CHIỂU- ĐÀ NẴNG','0323234567')
	go

--Nhập dữ liệu CTHD
    insert into CTHD(MaHD,MaSP,Dongia,Soluong,Tienkhachtra) 
	values
	('HD001','SP001','30000','01','100000'),
    ('HD002','SP002','32000','01','32000'),
	('HD003','SP003','38000','02','76000'),
	('HD004','SP002','32000','01','40000'),
	('HD005','SP004','40000','01','45000'),
	('HD006','SP006','32000','01','45000'),
	('HD007','SP005','35000','02','100000'),
    ('HD008','SP004','30000','01','50000'),
	('HD009','SP009','35000','01','55000')
	 go
-- Nhập dữ liệu bảng Phiếu nhập kho 
	insert into Phieunhapkho
	values
	('NK001','NV004','NCC01','2022/11/02',null),
	('NK002','NV004','NCC02','2022/08/06',N'Trả 3 vỏ bình nước Lavie'),
	('NK003','NV005','NCC01','2022/11/02',null),
	('NK004','NV005','NCC03','2022/11/07',N'Không có nợ cũ'),
	('NK005','NV004','NCC03','2022/11/01',null)
	go
-- Nhập dữ liệu bảng Chi tiết phiếu nhập 
	insert into CTPN(MaPN,MaHang,Tenhang,Donvitinh,Soluong,Dongia)
	values
	('NK001','H01',N'Mứt CHUNKY ANDROS ổi hồng 1kg * 8 gói / 1 thùng',N'Gói',1,162000),
	('NK001','H02',N'Đà Lạt Milk sữa tiệt trùng 950ml không đường',N'Hộp',2,34020),
	('NK002','H03',N'Nước bình Lavie',N'Bình',3,60000),
	('NK003','H04',N'Chanh',N'Kg',2,19000),
	('NK003','H05',N'Chanh dây',N'Kg',3,28000),
	('NK004','H06',N'Đào Ngâm Thái',N'Lon',1,40000),
	('NK004','H07',N'Cozy đào túi lọc',N'Hộp',1,34000),
	('NK004','H08',N'Cozy gừng túi lọc',N'Hộp',1,31000),
	('NK005','H09',N'Trân châu 3q Minh Hạnh trắng',N'Gói',1,65000),
	('NK005','H10',N'Sữa đặc ngôi sao Phương Nam xanh',N'Hộp',6,58000),
	('NK005','H11',N'Kem Base',N'Hộp',1,78000)
	go

create trigger tgInsertCTHD
on CTHD
for insert 
as
begin
	update CTHD
	set Tongtien=SoLuong*Dongia
	where MaHD=(select MaHD from inserted)
	update CTHD
	set Tiendu=Tienkhachtra-Tongtien
	where MaHD=(select MaHD from inserted)
end
go
create trigger tgInsertCTPN
ON CTPN
for insert
as
begin
	update CTPN
	set Thanhtien=Dongia*Soluong
	where MaPN=(select MaPN from inserted)
end
update CTHD
SET TONGTIEN=DONGIA*SOLUONG
UPDATE CTHD
SET TIENDU=TIENKHACHTRA-TONGTIEN
UPDATE CTPN
SET THANHTIEN=DONGIA*SOLUONG

alter database BAITAPNHOM
set recovery simple

alter table Nhanvien
add [mahoa sdt] varbinary(max)
update Nhanvien
set [mahoa sdt]=ENCRYPTBYPASSPHRASE('SDTNV', convert(varchar(10),SDTNV))

create table kategori(
id int  primary key IDENTITY(1,1),
ad nvarchar(100) not null
)


create table satıcı(
id int primary key identity(1,1),
ad nvarchar(100) not null,
adres nvarchar(300) 
)



CREATE TABLE Musteri (
id INT PRIMARY KEY IDENTITY(1,1),
ad NVARCHAR(50) NOT NULL,
soyad NVARCHAR(50) NOT NULL,
email NVARCHAR(100) UNIQUE,
sehir NVARCHAR(50),
kayit_tarihi DATE DEFAULT GETDATE()
)



CREATE TABLE Urun (
id int primary key identity(1,1),
ad nvarchar(50) not null,
fiyat decimal(10,2) not null check (fiyat >=0),
stok int not null,
kategori_id int not null,
satici_id int not null,
foreign key (kategori_id) references kategori(id),
foreign key (satici_id) references satıcı(id)
)



CREATE TABLE siparis(
id int primary key identity(1,1),
musteri_id int not null,
tarih date,
toplam_tutar decimal(10,2) check (toplam_tutar >= 0),
odeme_turu nvarchar(100),
foreign key (musteri_id) references Musteri(id)
)


CREATE TABLE Siparis_Detay(
id int primary key identity(1,1),
siparis_id int not null,
urun_id int not null,
adet int not null check (adet >=0),
fiyat decimal(10,2) not null check (fiyat >= 0),
foreign key (siparis_id) references siparis(id),
foreign key (urun_id) references Urun(id)
)

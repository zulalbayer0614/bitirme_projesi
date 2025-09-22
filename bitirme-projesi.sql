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


insert into kategori(ad)
values('araba'),
('elektronik'),
('giyim'),
('spor'),
('kozmetik')


insert into satıcı(ad, adres)
values ('Angarage', 'Ankara'),
('Teknoloji', 'İstanbul'),
('Mavi', 'İstanbul'),
('Asics','İstanbul'),
('Sephora','Ankara')


insert into Musteri(ad, soyad, email, sehir, kayit_tarihi)
values('Zülal','Bayer', 'zulal.bayer0614@gmail.com', 'Ankara', '2025-02-21'),
('Elif Nisa', 'Albayrak', 'elifnisa@gmail.com', 'Zonguldak', '2025-09-26'),
('Ayşegül', 'Seçir', 'aysegul@gmail.com', 'Çankırı', '2025-05-06'),
('Sıla Nur', 'Çorbacı', 'sılanur@gmail.com', 'Kocaeli', '2025-09-18'),
('Hazal','Bayer', 'hazall@gmail.com', 'Konya', '2025-07-21'),
('Hilal', 'Bayer', 'hilal1@gmail.com', 'Ankara', '2025-05-10')


insert into Urun(ad, fiyat, stok, kategori_id, satici_id)
values('Mercedes', 4.000000, 3, 1, 1),
('Telefon', 56.000, 15, 2, 2),
('Pantolon',1000, 50, 3, 3),
('Ayakkabı', 2000, 100, 4 ,4),
('Ruj', 600, 500, 5,5),
('Tablet', 10000, 10, 2,2),
('Ceket', 1499, 20, 3,3),
('Maskara', 500, 400, 5,5),
('Tayt', 850, 300, 4, 4),
('Kahve Makinesi', 25000, 50, 2, 2)

  
/* Fiyat istediğim gibi 400000 çıkmak yerine 4.00 çıktığı için (40000 yerine 4.000000 yazdığım için) 
  update-set kullanarak düzeltme yaptım. */
  
update Urun set fiyat = 400000 
where id = 1
select * from Urun

update Urun set fiyat = 56000 
where id = 2
select * from Urun

insert into siparis(musteri_id, tarih, toplam_tutar, odeme_turu)
values(1, '2025-09-22', 1500, 'Kart'),
(1, '2025-09-22', 600, 'Kart'),
(2, '2025-10-23', 2000, 'Nakit'),
(3, '2025-12-15', 500, 'Kart'),
(4, '2025-08-29', 1000, 'Nakit'),
(5, '2025-04-03', 56000, 'Kart'),
(6, '2026-02-14', 4000000, 'Kart'),
(5, '2025-02-16', 10000, 'Nakit'),
(2, '2024-06-08', 1000, 'Nakit'),
(4, '2025-06-01', 850, 'Nakit'),
(3, '2025-04-07', 600, 'Nakit'),
(6, '2025-11-25', 25000, 'Kart')



insert into Siparis_Detay(siparis_id, urun_id, adet, fiyat)
values(1, 7, 1, 1500),
(2, 5, 1, 600), 
(3, 4, 1, 2000), 
(4, 8, 1, 500), 
(5, 3, 1, 1000),
(6, 2, 1, 56000),
(7, 1, 1, 4000000),
(8, 6, 1, 10000), 
(9, 3, 1, 1000),
(10, 9, 1, 850),
(11, 5, 1, 600),
(12, 10, 1, 25000)





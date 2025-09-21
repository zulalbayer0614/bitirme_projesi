CREATE TABLE Siparis_Detay(
id int primary key identity(1,1),
siparis_id int not null,
urun_id int not null,
adet int not null check (adet >=0),
fiyat decimal(10,2) not null check (fiyat >= 0),
foreign key (siparis_id) references Siparisler(id),
foreign key (urun_id) references Urun(id)
)

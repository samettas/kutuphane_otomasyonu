
create table YayinEvi(
	Yay�nEviID int IDENTITY(1,1) primary key,
	Yay�nEviAd nvarchar(50) not null
)
go
create table Yazar(
	YazarID int IDENTITY(1,1) primary key,
	YazarAd nvarchar(50) not null,
	YazarSoyad nvarchar(50) not null
)
go
create table Kitap(
	KitapID int IDENTITY(1,1) primary key ,
	KitapAd nvarchar(50) not null,
	SayfaSayisi int not null,
	YayimTarihi date not null,
	YazarID int,
	Yay�nEviID int,
	foreign key(YazarID) references Yazar(YazarID),
	foreign key(Yay�nEviID) references YayinEvi(Yay�nEviID)
)
go
create table Bolum(
	BolumID int IDENTITY(1,1) primary key,
	BolumAd nvarchar(50) not null
)
go
create table Birim(
	BirimID int IDENTITY(1,1) primary key,
	BirimAd nvarchar(50) not null
)
go
create table Cinsiyet(
	CinsiyetID int primary key,
	CinsiyetAd nvarchar(20)
)
go
create table Ogrenci(
	OgrenciNO int primary key,
	OgrenciAd nvarchar(50) not null,
	OgrenciSoyad nvarchar(50) not null,
	Cinsiyet int not null,
	BolumID int not null,
	foreign key(Cinsiyet) references Cinsiyet(CinsiyetID),
	foreign key(BolumID) references Bolum(BolumID)
)
go
create table Personel(
	PersonelID int IDENTITY(1,1) primary key,
	PersonelAd nvarchar(50) not null,
	PersonelSoyad nvarchar(50) not null,
	BirimID int not null,
	foreign key(BirimID) references Birim(BirimID)
)
go
create table Kategori(
	KategoriID int IDENTITY(1,1) primary key,
	KategoriAd nvarchar(50) not null
)
go
create table Kiralamalar(
	KiralamaID int IDENTITY(1,1) primary key,
	KiralamaAd nvarchar(50) not null,
	Durum bit default 0,
	Saat time,
	PersonelID int,
	OgrenciNO int,
	foreign key(PersonelID) references Personel(PersonelID),
	foreign key(OgrenciNO) references Ogrenci(OgrenciNO)
)
go
create table Emanet(
	EmanetID int IDENTITY(1,1) primary key,
	AlisTarihi date,
	VerisTarihi date,
	OgrenciNO int,
	KitapID int,
	foreign key(OgrenciNO) references Ogrenci(OgrenciNO),
	foreign key(KitapID) references Kitap(KitapID)
)
go
create table K�TAP_KATEGOR�(
	KitapID int,
	KategoriID int,
	foreign key(KitapID) references Kitap(KitapID),
	foreign key(KategoriID) references Kategori(KategoriID)
)
go 
create table Kiralama_Cesit(
	ID int IDENTITY(1,1) primary key,
	ad nvarchar(50),
	
)
go
create table EmanetArsiv(
	EmanetID int  primary key,
	AlisTarihi date,
	VerisTarihi date,
	OgrenciNO int,
	KitapID int,
	foreign key(OgrenciNO) references Ogrenci(OgrenciNO),
	foreign key(KitapID) references Kitap(KitapID)
)
go
create trigger trg_EmanetArsiv on Emanet
after delete
as
insert into EmanetArsiv select * from deleted
go
create view GecKiralama
as 
select Saat from Kiralamalar 
where Saat=(select max(Saat) from Kiralamalar )
go
create procedure sp_Kitap (@ara int)
as
begin
select * from Kitap where KitapID=@ara
end

insert into Cinsiyet values(1,'Erkek')
insert into Cinsiyet values(2,'Kad�n')
insert into Cinsiyet values(3,'Di�er')


insert into Bolum values('Bilgisayar M�hendisli�i')
insert into Bolum values('Elektrik-Elektronik M�hendisli�i')
insert into Bolum values('End�stri M�hendisli�i')
insert into Bolum values('Havac�l�k ve Uzay M�hendisli�i')
insert into Bolum values('�n�aat M�hendisli�i')
insert into Bolum values('Kimya M�hendisli�i')
insert into Bolum values('Makina M�hendisli�i')
insert into Bolum values('Mimarl�k')
insert into Bolum values('Matematik')
insert into Bolum values('Molek�ler Biyoloji ve Genetik')
insert into Bolum values('Temel Bilimler')
insert into Bolum values('Beslenme ve Diyetetik')
insert into Bolum values('Hem�irelik')
insert into Bolum values('Fizyoterapi ve Rehabilitasyon')
insert into Bolum values('Acil Yard�m ve Afet Y�netimi')
insert into Bolum values('Ergoterapi')
insert into Bolum values('Antren�rl�k E�itimi')
insert into Bolum values('Beden E�itimi ve Spor')
insert into Bolum values('Spor Y�neticili�i')
insert into Bolum values('Felsefe')
insert into Bolum values('�ngiliz Dili ve Edebiyat�')
insert into Bolum values('Psikoloji')
insert into Bolum values('Tarih')
insert into Bolum values('T�rk Dili Ve Edebiyat�')
insert into Bolum values('Ekonometri')
insert into Bolum values('�ktisat')
insert into Bolum values('��letme')
insert into Bolum values('Sa�l�k Y�netimi')

insert into Birim values('Yetkili')
insert into Birim values('Dan��ma')
insert into Birim values('Hizmetli')


insert into Kategori values('Tarih');
insert into Kategori values('Kurgu D���');
insert into Kategori values('Polisiye');
insert into Kategori values('Ki�isel Geli�im');
insert into Kategori values('�ocuk');
insert into Kategori values('Kariyer');
insert into Kategori values('Mizah');
insert into Kategori values('Biyografi');
insert into Kategori values('Giri�imcilik');
insert into Kategori values('K�lt�r');
insert into Kategori values('Psikoloji');
insert into Kategori values('Sa�l�k');
insert into Kategori values('Felsefe');
insert into Kategori values('Macera');
insert into Kategori values('Aksiyon');
insert into Kategori values('Politika');
insert into Kategori values('Siyaset');
insert into Kategori values('Bilim');
insert into Kategori values('Sanat');
insert into Kategori values('Romantik');
insert into Kategori values('Komedi');
insert into Kategori values('Gezi');
insert into Kategori values('Toplum');
insert into Kategori values('A�k');

insert into Yazar values('Z�lf�','Livaneli')
insert into Yazar values('Sabahattin','Ali')
insert into Yazar values('Aziz','Nesin')
insert into Yazar values('Peyami','Safa')
insert into Yazar values('Orhan','Kemal')
insert into Yazar values('Sait Faik','Abas�yan�k')
insert into Yazar values('Ya�ar','Kemal')
insert into Yazar values('Yusuf','At�lgan')

insert into YayinEvi values('Do�an Kitabevi')
insert into YayinEvi values('S�zc� Kitabevi')
insert into YayinEvi values('Nesin Yay�nevi')
insert into YayinEvi values('�t�ken Ne�riyat')
insert into YayinEvi values('Everest Yay�nlar�')
insert into YayinEvi values('�� Bankas� K�lt�r Yay�nlar�')
insert into YayinEvi values('Yap� Kredi Yay�nlar�')
insert into YayinEvi values('Can Yay�nlar�')



insert into Kiralama_Cesit values('�al��ma Odas� 1')
insert into Kiralama_Cesit values('�al��ma Odas� 2')
insert into Kiralama_Cesit values('�al��ma Odas� 3')
insert into Kiralama_Cesit values('�al��ma Odas� 4')
insert into Kiralama_Cesit values('�al��ma Odas� 5')
insert into Kiralama_Cesit values('�al��ma Odas� 6')
insert into Kiralama_Cesit values('�al��ma Odas� 7')
insert into Kiralama_Cesit values('�al��ma Odas� 8')
insert into Kiralama_Cesit values('�al��ma Odas� 9')
insert into Kiralama_Cesit values('�al��ma Odas� 10')
insert into Kiralama_Cesit values('Bilardo 1')
insert into Kiralama_Cesit values('Bilardo 2')
insert into Kiralama_Cesit values('Masa Tenisi 1')
insert into Kiralama_Cesit values('Masa Tenisi 2')

--declare cr_Personel CURSOR 
--for select * from Emanet
--order by EmanetID



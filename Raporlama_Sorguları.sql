/* C. Veri Sorgulama ve Raporlama */
  
-- En çok sipariş veren 5 müşteri

select top 5 Musteri.id, Musteri.ad, count(siparis.id) as SiparisSayisi
from Musteri 
join Siparis on Musteri.id = Siparis.musteri_id
group by Musteri.id, Musteri.ad
order by count(siparis.id) desc

-- En çok satılan ürünler

select
u.id as UrunID,
u.ad as UrunAdi,
sum(adet) as ToplamSatis
from Siparis_Detay sd
join Urun u  on  u.id = sd.urun_id 
group by u.id, u.ad
order by SUM (adet) desc 

-- - En yüksek cirosu olan satıcılar.
select 
s.id as SaticiID,
s.ad as SaticiAdi,
sum(u.fiyat * sd.adet) as Ciro
from satıcı s
join urun u on u.satici_id = s.id
join Siparis_Detay sd on u.id = sd.urun_id
group by s.id, s.ad 
order by sum(u.fiyat * sd.adet) desc


-- Aggregate & Group By:
  
-- Şehirlere göre müşteri sayısı.
select ad, soyad, sehir, count(id) as MüşteriSayisi
from Musteri 
group by sehir, ad, soyad 

-- Kategori bazlı toplam satışlar.
select ad, sum(id) as Toplam_Satislar
from Kategori 
group by ad 

-- Aylara göre sipariş sayısı.
select datename(month, tarih) as HangiAy,
count(id) as Siparis_Sayisi
from siparis 
group by  datename(month, tarih), month(tarih) 
order by month(tarih) asc  


--JOIN’ler:
-- Siparişlerde müşteri bilgisi + ürün bilgisi + satıcı bilgisi
select
 s.id as SiparisID,
 m.ad as MusteriAdi,
 u.ad as UrunAdi,
 st.ad as SaticiAdi,
 sd.adet
from Siparis s
join Musteri m on s.musteri_id = m.id 
join Siparis_Detay sd on s.id =sd.siparis_id
join Urun u on  sd.urun_id = u.id
join satıcı st on u.satici_id = st.id

  
-- Hiç satılmamış ürünler.
  /*  Bütün ürünler satıldığı için boş döndürecek  */
select u.id, u.ad
from urun u
join Siparis_Detay sd on u.id = sd.urun_id 
where sd.urun_id is null


  -- Hiç sipariş vermemiş müşteriler.
  -- Bütün herkes sipariş verdiği için(boş döndürmesini istemedim) sipariş vermemiş yeni bir müşteri ekledim. 
insert into Musteri(ad, soyad, email, sehir, kayit_tarihi)
values('Sema', 'Bayer', 'sema1@gmail.com', 'Ankara', '2025-09-27')

/* Normalde boş döndürmesi gerekirken üstte sipariş vermemiş yeni birisini eklediğim için
hiç sipariş vermemiş müşteri olarak sadece'Sema' adlı müşteriyi döndürecek  */
select m.id, m.ad, s.id
from Musteri m
left join siparis s on m.id = s.musteri_id
where s.id is null


--D. İleri Seviye Görevler (Opsiyonel)

-- En çok kazanç sağlayan ilk 3 kategori.
select top 3
k.id, k.ad,
sum(sd.adet * sd.fiyat) as Kazanc
from urun u
join kategori k on k.id = u.kategori_id
join Siparis_Detay sd on sd.urun_id = u.id
group by k.id, k.ad
order by Kazanc desc


-- Ortalama sipariş tutarını geçen siparişleri bul.
select s.id, s.tarih, s.toplam_tutar
from siparis s
where s.toplam_tutar > (select avg(toplam_tutar) 
from siparis)

-- En az bir kez elektronik ürün satın alan müşteriler.
select distinct m.id, m.ad, m.soyad, m.email
from Musteri m
join siparis s on m.id = s.musteri_id
join Siparis_Detay sd on s.id = sd.siparis_id
join Urun u on u.id = sd.urun_id
join Kategori k on k.id = u.kategori_id
where k.ad = 'Elektronik'
order by m.ad












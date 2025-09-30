Bitirme Projesi: Online Alışveriş Platformu Veri Tabanı
Hazırlayan: Zülal Bayer

Nasıl Tasarladım:
 Öncelikle veri tabanın oluşturulurken benden istenilen Musteri, Urun, Kategori, Satici, Siparis, Siparis_Detay tablolarını CREATE TABLE ile oluşturdum. 
Benden istenilen columnları yaprılarına uygun şekilde (id, nvarchar() vb.) yerleştirdim. Veri tablosundaki ilişkileri FOREIGN KEY ile düzenledim.
Ardından INSERT INTO ile tabloların içine uygun şekilde veriler ekledim. tablodan veri silmek istediğimde DELETE, güncellemem gerektiğinde ise UPDATE SET komutlarını kullandım.
Otomatik olarak stokların azaltmak için CREATE TRIGGER kullandım. İstenilen veri sorgularını da uygun komutları kullanarak çektim.

Karşlaştığım Sorunlar, Zorlandığım Yerler:
 Tablolara fiyat verisi eklerken hata yaptığım için eklediğim fiyatlar ya gereğinden fazla çıktı ya da eksik.
Örnek olarak fiyat istediğim gibi 400000 çıkmak yerine 4.00 çıktığı için (40000 yerine 4.000000 yazdığımdan dolayı).
Stokların otomatik olarak güncellenmesini sağlamak beni en çok zorlayan yerlerden biri oldu ve çok fazla uğraştırdı.
Join komutlarını kullanmak da aynı şekilde beni zorladı ama deneye deneye ve araştırarak nasıl kullanmam gerektiğin çözdüm.
Zorlandığım ve içinden çıkamadığım durumlarda yapay zekaya başvurduğum yerler oldu ama kodları direkt yazdırmak yerine nasıl bir yol izlemem gerektiğini açıklamasını istedim. 
 


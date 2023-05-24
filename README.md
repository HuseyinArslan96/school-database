# MySQL Kodlarıyla Okul Veritabanı Oluşturma
Okul sistemi 10 tablodan oluşur: Kolejler, Binalar, Sınıflar, Bölümler, Kurslar, Ders Kitapları, Personeller, Pozisyonlar, Öğrenciler ve Stajyerler.

**Not:**

Binalar ve Ders Kitapları dışında tüm tabloların ikincil anahtarları vardır. 

**Format (Tablolar):**

Kolej'in bir adı ve kimliği vardır.
Binaların her birinin bir adı vardır.
Dersliklerde projektör olup olmadığı belirtilecek, bina ve projektör bilgisi de verilecek.
Bölümlerin her birinin bir kursu, binası, kişisi ve sınıfı vardır.
Kursların adları ve ders kitaplarının ISBN'leri vardır.
Ders Kitaplarının bir başlığı, yazarı ve ISBN'si vardır.
Kişilerin isimleri ve telefon numaraları vardır.
Pozisyon yetkililerinin unvanları, isimleri ve maaşları vardır.
Öğrencilerin not ortalamaları ve isimleri vardır.
Stajyerlerin saatlik ücreti ve kimliği vardır.

**Biçimin Özeti**

Bu tabloların çoğu verinin benzersiz bir şekilde tanımlanabilmesi için birincil anahtara sahiptir. Ayrıca veriler için benzersiz indeksler yaptım. Yabancı anahtarlar iki tabloyu birbirine bağlar. Örneğin her öğrencinin/öğretim üyesinin Personeller tablosundan bir kişi kimliği vardır; bunun nedeni öğrencinin aynı zamanda kolejde bir kişi olmasıdır. Bu her gerçekleştiğinde Personeller tablosuna talep iletilir. Tabloların oluşturulması tamamen CREATE TABLE kullanılarak yapıldı. Sonra tüm verileri INSERT ve ardından VALUES kullanarak ekledim. Sorgular için bileşik koşullar, hesaplanan alanlar, yerleşik SQL işlevleri, alt sorgular, gruplandırma, sıralama, tabloları birleştirme, güncelleme ve silme gibi operasyonları dahil ettim.
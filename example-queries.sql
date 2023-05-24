use Okul;

SELECT PersonelAdi
FROM Personel
WHERE PersonelID <= 3;

SELECT DersKitabi
FROM DersKitabi
WHERE DersKitabiISBN = 203 OR DersKitabiISBN = 204;

SELECT SUM(PozisyonMaasi) AS EklenenMaas
FROM Pozisyon
WHERE PozisyonMaasi >= 10000; 

SELECT MIN(OgrenciGNO) AS EnDusukGNO
FROM Ogrenci;

SELECT MAX(StudentGPA) AS EnYuksekGNO
FROM Ogrenci;

SELECT COUNT(PersonelID) AS PersonelSayisi
FROM Personel;

SELECT BolumID
FROM Bolum
WHERE SinifNumarasi = (SELECT SinifNumarasi FROM Siniflar WHERE SinifNumarasi = 304);

SELECT KursAdi
FROM Kurs
WHERE DersKitabiISBN < 205
GROUP BY KursID;

SELECT KursAdi
FROM Kurs
WHERE DersKitabiISBN > 202
ORDER BY KursID;

SELECT Bolum.BolumID, Personel.PersonelID
FROM Bolum, Personel
WHERE Bolum.PersonelID = Personel.PersonelID;

SELECT OgrenciAdi FROM Ogrenci
WHERE OgrenciAdi LIKE 'A%'
UNION
SELECT PozisyonAdi FROM Pozisyon
WHERE PozisyonAdi LIKE 'A%';

SELECT PozisyonAdi
FROM Pozisyon
WHERE PozisyonAdi LIKE 'Mat%';

CREATE VIEW PozisyonYetkilileri AS
SELECT PozisyonMaasi
FROM Pozisyon
WHERE PozisyonMaasi >= 7500;

UPDATE Pozisyon
SET PozisyonMaasi = 17000
WHERE PozisyonAdi = 'Bilgisayar Bilimleri Ogretmeni';

DELETE FROM Kurs
WHERE KursAdi = 'Matematik Problemleri';

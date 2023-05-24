CREATE SCHEMA IF NOT EXISTS `Okul` ;
USE `Okul` ;


CREATE TABLE IF NOT EXISTS `Okul`.`Kolej` (
  `KolejAdi` VARCHAR(50) NOT NULL,
  `KolejToplamOgrenci` INT NULL,
  PRIMARY KEY (`KolejAdi`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `KolejAdi_UNIQUE` ON `Okul`.`KolejAdi` (`KolejAdi` ASC);



CREATE TABLE IF NOT EXISTS `Okul`.`Binalar` (
  `BinaID` INT NOT NULL,
  `BinaAdi` VARCHAR(45) NULL,
  `KolejAdi` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BinaID`),
  CONSTRAINT `FK_Binalar_KolejAdi`
    FOREIGN KEY (`KolejAdi`)
    REFERENCES `Okul`.`Kolej` (`KolejAdi`)
    )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `BinaID_UNIQUE` ON `Okul`.`Binalar` (`BinaID` ASC);
CREATE INDEX `KolejAdi_idx` ON `Okul`.`Binalar` (`BinaAdi` ASC);



CREATE TABLE IF NOT EXISTS `Okul`.`Sınıflar` (
  `SinifNumarasi` INT NOT NULL,
  `ProjektorVarMı` VARCHAR(3) NULL,
  `BinaID` INT NULL,
  PRIMARY KEY (`SinifNumarasi`),
  CONSTRAINT `FK_Siniflar_BinaID`
    FOREIGN KEY (`BinaID`)
    REFERENCES `Okul`.`Binalar` (`BinaID`)
    )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `SinifNumarasi_UNIQUE` ON `Okul`.`Siniflar` (`SinifNumarasi` ASC);
CREATE INDEX `BinaID_idx` ON `Okul`.`Siniflar` (`BinaID` ASC);



CREATE TABLE IF NOT EXISTS `Okul`.`DersKitabi` (
  `DersKitabiISBN` INT NOT NULL,
  `DersKitabiBaslik` VARCHAR(45) NULL,
  `DersKitabiYazar` VARCHAR(45) NULL,
  PRIMARY KEY (`DersKitabiISBN`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `DersKitabiISBN_UNIQUE` ON `Okul`.`DersKitabi` (`DersKitabiISBN` ASC);



CREATE TABLE IF NOT EXISTS `Okul`.`Kurs` (
  `KursID` INT NOT NULL,
  `KursAdi` VARCHAR(45) NULL,
  `DersKitabiISBN` INT NULL,
  PRIMARY KEY (`KursID`),
  CONSTRAINT `FK_Kurs_DersKitabiISBN`
    FOREIGN KEY (`DersKitabiISBN`)
    REFERENCES `Okul`.`DersKitabi` (`DersKitabiISBN`)
	)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `KursID_UNIQUE` ON `Okul`.`Kurs` (`KursID` ASC);
CREATE INDEX `DersKitabiISBN_idx` ON `Okul`.`Kurs` (`DersKitabiISBN` ASC);



CREATE TABLE IF NOT EXISTS `Okul`.`Personel` (
  `PersonelID` INT NOT NULL,
  `PersonelTelefonNumarasi` VARCHAR(45) NULL,
  `PersonelAdi` VARCHAR(45) NULL,
  PRIMARY KEY (`PersonelID`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `PersonelID_UNIQUE` ON `Okul`.`Personel` (`PersonelID` ASC);



CREATE TABLE IF NOT EXISTS `Okul`.`Pozisyon` (
  `PozisyonID` INT NOT NULL,
  `PozisyonAdi` VARCHAR(45) NULL,
  `PozisyonMaasi` INT NULL,
  `PersonelID` INT NULL,
  PRIMARY KEY (`PozisyonID`),
  CONSTRAINT `FK_Pozisyon_PersonelID`
    FOREIGN KEY (`PersonelID`)
    REFERENCES `Okul`.`Personel` (`PersonelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `PozisyonID_UNIQUE` ON `Okul`.`Pozisyon` (`PozisyonID` ASC);
CREATE INDEX `PersonelID_idx` ON `Okul`.`Pozisyon` (`PersonelID` ASC);



CREATE TABLE IF NOT EXISTS `Okul`.`Stajyerler` (
  `StajyerID` INT NOT NULL,
  `PersonelID` INT NULL,
  `StajyerSaatlikUcret` INT NULL,
  PRIMARY KEY (`StajyerID`),
  CONSTRAINT `FK_Stajyerler_PersonelID`
    FOREIGN KEY (`PersonelID`)
    REFERENCES `Okul`.`Personel` (`PersonelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `StajyerID_UNIQUE` ON `Okul`.`Stajyerler` (`StajyerID` ASC);
CREATE INDEX `PersonelID_idx` ON `Okul`.`Stajyerler` (`PersonelID` ASC);



CREATE TABLE IF NOT EXISTS `Okul`.`Bolum` (
  `BolumID` INT NOT NULL,
  `BolumKurulusTarihi` DATE NULL,
  `SinifNumarasi` INT NULL,
  `KursID` INT NULL,
  `BinaID` INT NULL,
  `PersonelID` INT NULL,
  PRIMARY KEY (`BolumID`),
  CONSTRAINT `FK_Bolum_KursID`
    FOREIGN KEY (`KursID`)
    REFERENCES `Okul`.`Kurs` (`KursID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bolum_BinaID`
    FOREIGN KEY (`BinaID`)
    REFERENCES `Okul`.`Bina` (`BinaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bolum_PersonelID`
    FOREIGN KEY (`PersonelID`)
    REFERENCES `Okul`.`Personel` (`PersonelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bolum_SinifNumarasi`
    FOREIGN KEY (`SinifNumarasi`)
    REFERENCES `Okul`.`Siniflar` (`SinifNumarasi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `SBolumID_UNIQUE` ON `Okul`.`Bolum` (`BolumID` ASC);
CREATE INDEX `SinifNumarasi_idx` ON `Okul`.`Bolum` (`SinifNumarasi` ASC);
CREATE INDEX `CourseID_idx` ON `Okul`.`Bolum` (`KursID` ASC);
CREATE INDEX `BuildingID_idx` ON `Okul`.`Bolum` (`BinaID` ASC);
CREATE INDEX `PersonID_idx` ON `Okul`.`Bolum` (`PersonelID` ASC);


CREATE TABLE IF NOT EXISTS `Okul`.`Ogrenci` (
  `OgrenciID` INT NOT NULL,
  `OgrenciGNO` DOUBLE(10, 2) NULL,
  `OgrenciAdi` VARCHAR(45) NULL,
  `PersonelID` INT NULL,
  PRIMARY KEY (`OgrenciID`),
  CONSTRAINT `FK_Ogrenci_PersonelID`
    FOREIGN KEY (`PersonelID`)
    REFERENCES `Okul`.`Personel` (`PersonelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `OgrenciID_UNIQUE` ON `Okul`.`Ogrenci` (`OgrenciID` ASC);
CREATE INDEX `PersonID_idx` ON `Okul`.`Ogrenci` (`PersonelID` ASC);



INSERT INTO `Okul`.`Kolej` (`KolejAdi`, `KolejToplamOgrenci`) VALUES ('SCCC', 26711);



INSERT INTO `Okul`.`Binalar` (`BinaID`, `BinaAdi`, `KolejAdi`) VALUES (1, 'A', 'SCCC');
INSERT INTO `Okul`.`Binalar` (`BinaID`, `BinaAdi`, `KolejAdi`) VALUES (2, 'B', 'SCCC');
INSERT INTO `Okul`.`Binalar` (`BinaID`, `BinaAdi`, `KolejAdi`) VALUES (3, 'C', 'SCCC');
INSERT INTO `Okul`.`Binalar` (`BinaID`, `BinaAdi`, `KolejAdi`) VALUES (4, 'D', 'SCCC');
INSERT INTO `Okul`.`Binalar` (`BinaID`, `BinaAdi`, `KolejAdi`) VALUES (5, 'E', 'SCCC');



INSERT INTO `Okul`.`Siniflar` (`SinifNumarasi`, `ProjektorVarMi`, `BinaID`) VALUES (201, 'E', 1);
INSERT INTO `Okul`.`Siniflar` (`SinifNumarasi`, `ProjektorVarMi`, `BinaID`) VALUES (202, 'H', 2);
INSERT INTO `Okul`.`Siniflar` (`SinifNumarasi`, `ProjektorVarMi`, `BinaID`) VALUES (203, 'E', 3);
INSERT INTO `Okul`.`Siniflar` (`SinifNumarasi`, `ProjektorVarMi`, `BinaID`) VALUES (204, 'H', 4);
INSERT INTO `Okul`.`Siniflar` (`SinifNumarasi`, `ProjektorVarMi`, `BinaID`) VALUES (205, 'E', 5);



INSERT INTO `Okul`.`DersKitabi` (`DersKitabiISBN`, `DersKitabiBaslik`, `DersKitabiYazar`) VALUES (201, 'Bilgisayar Bilimleri', 'Huseyin ARSLAN');
INSERT INTO `Okul`.`DersKitabi` (`DersKitabiISBN`, `DersKitabiBaslik`, `DersKitabiYazar`) VALUES (202, 'Kimya İlkeleri', 'Hasan ARSLAN');
INSERT INTO `Okul`.`DersKitabi` (`DersKitabiISBN`, `DersKitabiBaslik`, `DersKitabiYazar`) VALUES (203, 'Fizik Yasalari', 'Alperen POLAT');
INSERT INTO `Okul`.`DersKitabi` (`DersKitabiISBN`, `DersKitabiBaslik`, `DersKitabiYazar`) VALUES (204, 'Matematik Problemleri', 'Asena OZGUR');
INSERT INTO `Okul`.`DersKitabi` (`DersKitabiISBN`, `DersKitabiBaslik`, `DersKitabiYazar`) VALUES (205, 'Felsefe Tarihi', 'Baris ERDEM');



INSERT INTO `Okul`.`Kurs` (`KursID`, `KursAdi`, `DersKitabiISBN`) VALUES (1, 'Bilisim Teknolojileri I', 201);
INSERT INTO `Okul`.`Kurs` (`KursID`, `KursAdi`, `DersKitabiISBN`) VALUES (2, 'Veri Yapılari I', 202);
INSERT INTO `Okul`.`Kurs` (`KursID`, `KursAdi`, `DersKitabiISBN`) VALUES (3, 'Lineer Cebir I', 203);
INSERT INTO `Okul`.`Kurs` (`KursID`, `KursAdi`, `DersKitabiISBN`) VALUES (4, 'Diferansiyel Denklemler I', 204);
INSERT INTO `Okul`.`Kurs` (`KursID`, `KursAdi`, `DersKitabiISBN`) VALUES (5, 'Organik Kimya I', 205);



INSERT INTO `Okul`.`Personel` (`PersonelID`, `PersonelTelefonNumarasi`, `PersonelAdi`) VALUES (1, '635-448-6158', 'Huseyin ARSLAN');
INSERT INTO `Okul`.`Personel` (`PersonelID`, `PersonelTelefonNumarasi`, `PersonelAdi`) VALUES (2, '635-448-6158', 'Hasan ARSLAN');
INSERT INTO `Okul`.`Personel` (`PersonelID`, `PersonelTelefonNumarasi`, `PersonelAdi`) VALUES (3, '635-448-6158', 'Alperen POLAT');
INSERT INTO `Okul`.`Personel` (`PersonelID`, `PersonelTelefonNumarasi`, `PersonelAdi`) VALUES (4, '635-448-6158', 'Asena OZGUR');
INSERT INTO `Okul`.`Personel` (`PersonelID`, `PersonelTelefonNumarasi`, `PersonelAdi`) VALUES (5, '635-448-6158', 'Baris ERDEM');



INSERT INTO `Okul`.`Pozisyon` (`PozisyonID`, `PozisyonAdi`, `PozisyonMaasi`, `PersonelID`) VALUES (1, 'Bilgisayar Bilimleri Ogretmeni', 15000, 'Hüseyin ARSLAN', 1);
INSERT INTO `Okul`.`Pozisyon` (`PozisyonID`, `PozisyonAdi`, `PozisyonMaasi`, `PersonelID`) VALUES (2, 'Kimya Ogretmeni', 15000, 'Hasan ARSLAN', 2);
INSERT INTO `Okul`.`Pozisyon` (`PozisyonID`, `PozisyonAdi`, `PozisyonMaasi`, `PersonelID`) VALUES (3, 'Fizik Ogretmeni', 15000, 'Alperen POLAT', 3);
INSERT INTO `Okul`.`Pozisyon` (`PozisyonID`, `PozisyonAdi`, `PozisyonMaasi`, `PersonelID`) VALUES (4, 'Matematik Ogretmeni', 15000, 'Asena OZGUR', 4);
INSERT INTO `Okul`.`Pozisyon` (`PozisyonID`, `PozisyonAdi`, `PozisyonMaasi`, `PersonelID`) VALUES (5, 'Felsefe Ogretmeni', 15000, 'Baris ERDEM', 5);



INSERT INTO `Okul`.`Stajyerler` (`StajyerID`, `PersonelID`, `StajyerSaatlikUcreti`) VALUES (1, 21, 14.50);
INSERT INTO `Okul`.`Stajyerler` (`StajyerID`, `PersonelID`, `StajyerSaatlikUcreti`) VALUES (2, 22, 15.50);
INSERT INTO `Okul`.`Stajyerler` (`StajyerID`, `PersonelID`, `StajyerSaatlikUcreti`) VALUES (3, 23, 16.50);
INSERT INTO `Okul`.`Stajyerler` (`StajyerID`, `PersonelID`, `StajyerSaatlikUcreti`) VALUES (4, 24, 17.50);
INSERT INTO `Okul`.`Stajyerler` (`StajyerID`, `PersonelID`, `StajyerSaatlikUcreti`) VALUES (5, 25, 18.50);



INSERT INTO `Okul`.`Bolum` (`BolumID`, `BolumKurulusTarihi`, `SinifNumarasi`, `KursID`, `BinaID`, `PersonelID`) VALUES (101, '2017-12-27', 201, 1, 2, 3);
INSERT INTO `Okul`.`Bolum` (`BolumID`, `BolumKurulusTarihi`, `SinifNumarasi`, `KursID`, `BinaID`, `PersonelID`) VALUES (102, '2017-12-27', 202, 2, 3, 4);
INSERT INTO `Okul`.`Bolum` (`BolumID`, `BolumKurulusTarihi`, `SinifNumarasi`, `KursID`, `BinaID`, `PersonelID`) VALUES (103, '2017-12-27', 203, 3, 4, 5);
INSERT INTO `Okul`.`Bolum` (`BolumID`, `BolumKurulusTarihi`, `SinifNumarasi`, `KursID`, `BinaID`, `PersonelID`) VALUES (104, '2017-12-27', 204, 4, 5, 1);
INSERT INTO `Okul`.`Bolum` (`BolumID`, `BolumKurulusTarihi`, `SinifNumarasi`, `KursID`, `BinaID`, `PersonelID`) VALUES (105, '2017-12-27', 205, 5, 1, 2);



INSERT INTO `Okul`.`Ogrenci` (`OgrenciID`, `OgrenciGNO`, `OgrenciAdi`, `PersonelID`) VALUES (1, 4.0, 'Ahmet OZTURK', 11);
INSERT INTO `Okul`.`Ogrenci` (`OgrenciID`, `OgrenciGNO`, `OgrenciAdi`, `PersonelID`) VALUES (2, 3.0, 'Dilara YIGIT', 12);
INSERT INTO `Okul`.`Ogrenci` (`OgrenciID`, `OgrenciGNO`, `OgrenciAdi`, `PersonelID`) VALUES (3, 3.5, 'Eylul HASKAN', 13);
INSERT INTO `Okul`.`Ogrenci` (`OgrenciID`, `OgrenciGNO`, `OgrenciAdi`, `PersonelID`) VALUES (4, 3.0, 'Seda KAPLAN', 14);
INSERT INTO `Okul`.`Ogrenci` (`OgrenciID`, `OgrenciGNO`, `OgrenciAdi`, `PersonelID`) VALUES (5, 4.0, 'Oguz AYDIN', 15);

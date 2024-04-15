# MySQL Kodlarıyla Okul Veritabanı Oluşturma
Okul sistemi 10 tablodan oluşur: Kolejler, Binalar, Sınıflar, Bölümler, Kurslar, Ders Kitapları, Personeller, Pozisyonlar, Öğrenciler ve Stajyerler.

**Not:**

Binalar ve Ders Kitapları dışında tüm tabloların ikincil anahtarları vardır. 

**Format (Tablolar):**

Kolejin bir adı ve kimliği vardır.
Binaların her birinin adı vardır.
Dersliklerde projektör olup olmadığı belirtilmekte, bina ve projektör bilgisi de verilmektedir.
Bölümlerin her birinin bir kursu, binası, kişisi ve sınıfı vardır.
Kursların adları ve ders kitaplarının ISBN'leri vardır.
Ders kitaplarının bir başlığı, yazarı ve ISBN'si vardır.
Kişilerin isimleri ve telefon numaraları vardır.
Pozisyon yetkililerinin unvanları, isimleri ve maaşları vardır.
Öğrencilerin not ortalamaları ve isimleri vardır.
Stajyerlerin saatlik ücreti ve kimliği vardır.

**Biçimin Özeti**

Bu tabloların çoğu verinin benzersiz bir şekilde tanımlanabilmesi için birincil anahtara sahiptir. Ayrıca veriler için benzersiz indeksler yaptım. Yabancı anahtarlar iki tabloyu birbirine bağlar. Örneğin her öğrencinin/öğretim üyesinin Personeller tablosundan bir kişi kimliği vardır; bunun nedeni öğrencinin aynı zamanda kolejde bir kişi olmasıdır. Bu her gerçekleştiğinde Personeller tablosuna talep iletilir. Tabloların oluşturulması tamamen CREATE TABLE kullanılarak yapıldı. Sonra tüm verileri INSERT ve ardından VALUES kullanarak ekledim. Sorgular için bileşik koşullar, hesaplanan alanlar, yerleşik SQL işlevleri, alt sorgular, gruplandırma, sıralama, tabloları birleştirme, güncelleme ve silme gibi operasyonları dahil ettim.

# Creating a School Database with MySQL Codes
The school system consists of 10 tables: Colleges, Buildings, Classes, Departments, Courses, Textbooks, Staff, Positions, Students and Interns.

**Note:**

All tables have secondary keys except Buildings and Textbooks.

**Format (Tables):**

The college has a name and identity.
Each of the buildings has a name.
It is stated whether there are projectors in the classrooms, and building and projector information is also given.
Each of the departments has a course, building, person, and classroom.
Courses have names and textbooks have ISBNs.
Textbooks have a title, author, and ISBN.
People have names and phone numbers.
Position officials have titles, names, and salaries.
Students have their grade point averages and names.
Interns have an hourly wage and ID.

**Summary of Format**

Most of these tables have a primary key so that the data can be uniquely identified. I also made unique indexes for the data. Foreign keys connect two tables. For example, each student/faculty member has a person ID from the Staff table; This is because the student is also a person in the college. Each time this happens, a request is sent to the Personnel table. Creating the tables was done entirely using CREATE TABLE. Then I added all the data using INSERT followed by VALUES. I included compound conditions for queries, calculated fields, built-in SQL functions, subqueries, operations like grouping, sorting, merging tables, updating, and deleting.

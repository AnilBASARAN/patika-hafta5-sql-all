
--                   ODEV 1

--film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
--film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
--film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
--customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?
--film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.

SELECT title, DESCRIPTION FROM film;
SELECT * FROM film WHERE ( length > 60 AND length < 75 );
SELECT * FROM film WHERE ( rental_rate = 0.99 AND replacement_cost = 12.99 ) OR ( replacement_cost = 28.99 );
SELECT last_name FROM customer WHERE first_name = 'Mary';
SELECT * FROM film WHERE   length > 50 AND AND NOT (rental_rate = 2.99 OR rental_rate = 4.99);;


--                   ODEV 2

--Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
--film tablosunda bulunan tüm sütunlardaki verileri 
--replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma koşuluyla sıralayınız ( BETWEEN - AND yapısını kullanınız.)
--.actor tablosunda bulunan first_name ve last_name sütunlardaki verileri 
--first_name 'Penelope' veya 'Nick' veya 'Ed' değerleri olması koşuluyla sıralayınız. ( IN operatörünü kullanınız.)
--film tablosunda bulunan tüm sütunlardaki verileri 
--rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99 olma koşullarıyla sıralayınız. ( IN operatörünü kullanınız.)

---------------------------------------------------

SELECT * FROM film 
WHERE replacement_cost BETWEEN 12.99 AND 16.98;

----------------------------------------------------

SELECT first_name,last_name FROM actor
WHERE first_name IN ('Penelope' OR 'Nick');

----------------------------------------------------

SELECT * FROM film
WHERE rental_rate IN ( 0.99,2.99,4.99) AND replacement_cost IN(12.99,15,99,28,99);



--             ODEV 3  
--country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.
--country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.
--film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.
--film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.
--Kolay Gelsin.

-----------------------------------------------

SELECT country FROM country
WHERE country ~~* 'A%a'; 

-----------------------------------------------

SELECT country FROM country
WHERE country LIKE '%_____a'; 

-----------------------------------------------

SELECT title FROM film
WHERE  (title ~~* '%___T%') OR ( title ~~*'%T___%') OR ( title ~~*'%_T__%') OR (title ~~*'%__T_%');

-- ALTERNATİF OLARAK

SELECT title
FROM film
WHERE title ~~* '%t%' AND LENGTH(title) >= 4;
-- LENGTH() fonksiyonu hücredeki stringin karakter sayısını döner, String.length() gibi

-----------------------------------------------

SELECT * FROM film
WHERE title LIKE 'C%' AND length > 90 AND rental_rate = 2.99;

-----------------------------------------------
--                           ODEV 4
--film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
--film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
--film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?
--country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
--city tablosundaki şehir isimlerinin kaç tanesi 'R' veya r karakteri ile biter?


SELECT DISTINCT replacement_cost FROM film;
SELECT COUNT(DISTINCT replacement_cost) FROM film;
SELECT COUNT(*) FROM film WHERE title LIKE 'T%' AND rating = 'G';
SELECT COUNT(*) FROM country WHERE LENGTH(country) = 5;
SELECT COUNT(*) FROM city WHERE UPPER(city) = '%R';
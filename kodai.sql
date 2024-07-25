-- Pateikite visus duomenis iš rental lentelės, rezultatą išrikiuokite pagal rental_date nuo naujausio įrašo. (rental)
SELECT * FROM rental ORDER BY rental_date DESC;

-- Surūšiuoti filmus nuo brangiausio iki pigiausio (film)
SELECT * FROM film ORDER BY replacement_cost DESC;

-- Išrinkti skirtingos trukmės filmų ilgius (film), išrikiuoti nuo ilgiausiai trunkančio filmo.
SELECT DISTINCT length FROM film ORDER BY length DESC;

-- Išrinkti visus nepasikartojančius vardus aktorių lentelėje (actor)
SELECT DISTINCT first_name FROM actor;

-- Išrinkti nepasikartojančias nuomos kainas (film)
SELECT DISTINCT rental_rate FROM film;

-- Pažymėti filmo title ir description stulpelius ir juos pavadinti filmo pavadinimas, filmo aprašymas (film)
SELECT
	title AS 'filmo pavadinimas'
    ,description AS 'filmo aprašymas'
FROM film;

-- Pateikite visų filmų pavadinimus (title), filmo išleidimo metus (release_year), nuomos kainą (rental_rate) ir dvi naujas kainas: 
-- 	a) nuomos kaina padidinta 10%, 
-- 	b) nuomos kaina padidinta 15%. 
 -- Pavadinkite naujus stulpelius `nauja kaina 10` ir `nauja kaina 15`.
 -- Taip pat paskaičiuokite skirtumą tarp `nauja kaina 15` ir senosios nuomos kainos (rental_rate). Pavadinkite `kainų skirtumas`.
 -- Išrikiuokite rezultatus pagal filmo išleidimo metus nuo naujausio ir pagal filmo pavadinimą abecėlės tvarka.
SELECT
	title AS 'filmo pavadinimas' 
    ,release_year AS 'išleidimo metai'
    ,rental_rate AS 'nuomos kaina'
    ,rental_rate * 1.1 AS 'nauja kaina 10'
    ,rental_rate * 1.15 AS 'nauja kaina 15'
    ,(rental_rate * 1.15) - rental_rate AS 'kainų skirtumas'
FROM film ORDER BY release_year DESC, title; -- JEI release year vienodas atkreips i pavadinima

-- Suskaičiuoti kiek aktorių turime aktorių lentelėje (actor)
SELECT COUNT(actor_id) from actor;

-- Suskaičiuoti kiek turime unikalių aktorių vardų (first_name)
--  (stulpelį pavadinti `Unikalių vardų skaičius`) ir kiek turime unikalių aktorių pavardžių (last_name) (stulpelį pavadinti `Unikalių pavardžių skaičius`).
SELECT 
COUNT(DISTINCT first_name) AS 'Unikalių vardų skaičius'
,COUNT(DISTINCT last_name) AS 'Unikalių pavardžių skaičius'
FROM actor;


SELECT * FROM film;

SELECT
	SUM(length) -- kur skaiciai sudeda
FROM film;

SELECT 
	AVG(length)
    ,FORMAT(AVG(length),1) -- suapvalina
    ,TRUNCATE(AVG(length),2) -- duoda tik skaicius po kablelio, neapvalina
FROM film;

SELECT
	MAX(length) -- maksimali reiksme
    ,MIN(length) -- minimali reiksme
FROM film;

SELECT
	MIN(length) -- minimali reiksme
FROM film;

SELECT
	COUNT(title) -- skaiciuoja netuscias reiksmes
FROM film;

SELECT
	COUNT(distinct title)
FROM film;

-- concat - skirtas tekstu sujungimui
SELECT
	CONCAT(first_name,' ',last_name)
FROM customer;

SELECT
	first_name,
    last_name,
	LOWER(CONCAT(first_name,' ',last_name)) AS vardas_pavarde
FROM customer;

-- upper/lower
SELECT
	LOWER(first_name),
    first_name
FROM customer;

SELECT
	UPPER(description)
FROM film;

SELECT COUNT(password)
FROM staff;

SELECT * FROM customer;

-- kiek yra zmoniu kurie lankosi vienoj ar kitoj parduotuveje 
SELECT
	store_id,
    COUNT(customer_id) AS kiekis
FROM customer
GROUP BY store_id;

SELECT
	special_features
    ,COUNT(*)
FROM film
GROUP BY special_features;

-- Kiek yra kokių vardų (first_name) aktorių lentelėje? (actor) Išrikiuokite nuo didžiausio kiekio  mažėjančia tvarka. 
-- Jei yra besikartojančių vardų su tuo pačiu kiekiu, tuomet vardai turi būti išrikiuoti nuo Z iki A rikiavimo tvarka.

SELECT 
	first_name,
    COUNT(*) AS kiekis
FROM actor
GROUP BY first_name
ORDER BY kiekis DESC, first_name DESC;

SELECT 
	first_name,
    COUNT(*)
FROM actor
GROUP BY first_name
ORDER BY COUNT(*) DESC, first_name DESC;

SELECT 
	first_name,
    COUNT(*)
FROM actor
GROUP BY first_name
ORDER BY 2 DESC, 1 DESC;

-- 1. Išrinkite visus aktorių pavardes ir vardus. (actor). Taip pat sujunkite concat pagalba stulpelį, kurio reikšmė vaizduotų tokią elektroninio pašto struktūrą:
--  vardas.pavardė@gmail.com. Šis stulpelis turėtų būti parašytas mažosiomis raidėmis.
-- Rezultatus išrikiuoti pagal vardą (first_name) nuo Z iki A.

SELECT
	first_name,
    last_name,
    LOWER(CONCAT(first_name,'.',last_name,'@gmail.com')) AS 'Elektroninis pastas'
FROM actor
ORDER BY first_name DESC;

-- 2. Parašykite SQL užklausą, kuri ištrauktų visas nuomos trukmes (rental_duration) iš lentelės
--  „film, suskaičiuokite kiek trukmių skirtingų pasikartoja lentelėje. Surūšiuokite rezultatus nuo dažniausiai pasikartojančios nuomos trukmės.

SELECT 
	rental_duration,
    COUNT(*) AS kiekis
FROM film
GROUP BY rental_duration
ORDER BY kiekis DESC;

SELECT COUNT(DISTINCT rental_duration) from film;

-- 3. Viename stulpelyje pateikite filmo pavadinimą (title) ir filmo ypatybes (special_features). Stulpelius atskirkite: tarpas, brūkšnelis, tarpas.
--  Rezultatą pateikite mažosiomis raidėmis. (film)

SELECT 
	LOWER(CONCAT(title,' - ', special_features)) as FILMAS
FROM film;

-- 4. Kurie aktorių pavardės pasikartoja dažniausiai ir kiek kartų 
SELECT 
	last_name,
    COUNT(*) AS kiekis
FROM actor
GROUP BY last_name
ORDER BY kiekis DESC;

-- 5. Kiek ilgiausiai trunka filmas, saugomas lentoje film?
SELECT 
    MAX(length) as 'Filmo trukme'
FROM film;

-- filtravimas
SELECT * FROM customer;
SELECT
	active
    ,COUNT(1)
FROM customer
GROUP BY active
ORDER BY COUNT(1) DESC;

SELECT
	customer_id,
    active,
    first_name,
    last_name
FROM customer
WHERE active = 0;

SELECT
	title
    ,rental_duration
    ,rental_rate
FROM film
WHERE rental_duration=6;

SELECT
	title
    ,rental_duration
    ,rental_rate
FROM film
WHERE rental_duration < 6;

SELECT
	title
    ,rental_duration
    ,rental_rate
FROM film
WHERE rental_duration <= 6;

SELECT
	title
    ,rental_duration
    ,rental_rate
FROM film
WHERE rental_duration != 6;

SELECT
	title
    ,rental_duration
    ,rental_rate
FROM film
WHERE rental_duration <> 6;

SELECT
    rental_duration
    ,COUNT(*)
FROM film
WHERE rental_duration=6
GROUP BY rental_duration
ORDER BY COUNT(*);

SELECT
	store_id
    ,count(*)
FROM customer
WHERE store_id=1
GROUP BY store_id;

SELECT * FROM film WHERE title = "agent truman";

-- Ištraukti visus filmus, kurie trunka (length) daugiau (>) negu 100 minučių (film)
SELECT 
	title,
    length
FROM film
WHERE length>100;

-- Ištraukti adresą, kuris(-ie) yra rajone (district) Ahal (address)
SELECT 
	district,
    address
FROM address
WHERE district="Ahal";

-- Parašykite užklausą, kuri pateiktų visą informaciją apie filmus, kurių nuomos trukmė (rental_duration) yra 3 dienos (lentelė: film)
SELECT *
FROM film
WHERE rental_duration=3;

-- Pateikite filmo pavadinimą (title), aprašymą (description), išleidimo metus (release_year), reitingą (rating), kur reitingas yra G (lentelė: film)
SELECT 
	title,
    description,
    release_year,
    rating
FROM film
WHERE rating="G";

-- Ištraukti visus adresus (address), kurie neturi pašto kodo (postal_code) ir telefono numerio (phone); lentelė: address
SELECT 
    address,
    postal_code,
    phone
FROM address
WHERE postal_code="" AND phone ="";


-- Ištraukti filmų pavadinimus (title), nuomos laikotarpį (rental_duration), pakeitimo kainą (replacement_cost),
-- kurių nuomos laikotarpis ilgesnis nei 5 dienos ir pakeitimo kaina mažesnė arba lygu 20; lentelė: film
SELECT 
    title,
    rental_duration,
    replacement_cost
FROM film
WHERE rental_duration >5 AND replacement_cost<=20;

-- Ištraukti visą informaciją apie filmus, kurių nuomos kaina (rental_rate) daugiau už 3 dolerius ir reitingas lygus R; lentelė: film
SELECT *
FROM film
WHERE rental_rate >3 AND rating="R";

describe address;

SELECT
	title,
    description,
    length
FROM film
WHERE length<70 AND length>60;

-- OR

SELECT
	title
    ,length
FROM film
WHERE length <50 OR length> 140
ORDER BY length;

SELECT * FROM city LIMIT 5;

-- BETWEEN
SELECT
	title
    ,length
    ,description
FROM film
WHERE length BETWEEN 50 AND 70;

SELECT
	MAX(amount)
FROM payment;

SELECT
	amount,
    customer_id,
    rental_id
FROM payment
WHERE amount BETWEEN 5 AND 12;

SELECT
	rating
FROM film
WHERE rating BETWEEN 'G' AND 'P'; -- Tikrina pirmuosius simbolius

-- in Lygu arba tam arba kitai reiksmei
SELECT 
	title 
    ,length
FROM film
WHERE length IN(47,57,92);

SELECT 
	rating 
    ,title
FROM film
WHERE rating IN('PG','G');

-- LIKE nurodyti zodzio dali %neribotas simboliu kiekis
SELECT *
FROM film
WHERE description LIKE '%documentary%';

SELECT *
FROM film
WHERE title LIKE '%home%';

SELECT *
FROM film
WHERE title LIKE 'home %'; -- turi prasideti zodziu home

SELECT *
FROM film
WHERE title LIKE '%home'; -- turi prasideti zodziu home

SELECT *
FROM actor
WHERE first_name LIKE'_a%'; -- ANTROji raide _-pirma raide betkas

SELECT *
FROM actor
WHERE first_name LIKE'_a_'; -- ANTROji raide _-pirma raide betkas

-- NOT
SELECT *
FROM actor
WHERE first_name NOT LIKE'_a%';

SELECT 
	title 
    ,length
FROM film
WHERE length NOT IN(47,57,92);

-- Ištraukti visus filmų pavadinimus (title) ir jų filmų trukmes (length), kurių trukmė yra trumpesnė nei
-- 50 min arba ilgesnė nei 140 min. Išrikiuokite nuo mažiausios trukmės; lentelė: film

SELECT 
	title 
    ,length
FROM film
WHERE length<50 OR length>140
ORDER BY length;

-- Ištraukti visą informaciją apie adresus, kurie neturi pašto kodo ar telefono numerio
SELECT *
FROM address
WHERE postal_code="" OR phone="";

-- Pateikite 5 klientų vardus ir pavardes, kurių pirkėjo id (customer_id) yra didžiausi customer lentelėje;
SELECT
	customer_id,
	first_name,
    last_name
FROM customer
ORDER BY customer_id DESC
LIMIT 5;

-- Raskite 10 trumpiausių filmų. Pateikite filmų pavadinimą (title), aprašymą (description) ir trukmę (length); lentelė: film
SELECT
	title,
    description,
    length
FROM film
ORDER BY length
LIMIT 10;

-- Išrinkite filmus, kurių išnuomojimo kaina (rental_rate) yra tarp 1 ir 2.99; lentelė: film

SELECT 
	title,
    rental_rate
FROM film
WHERE rental_rate BETWEEN 1 AND 2.99;

-- Išrinkite filmus, kurių trukmė (length) yra tarp 47 ir 100 min. Išrikiuokite nuo ilgiausiai trunkančio filmo mažėjimo tvarka; lentelė: film
SELECT 
	title,
    length
FROM film
WHERE length BETWEEN 47 AND 100
ORDER BY length DESC;

-- Išrinkite filmų pavadinimus, aprašymus, išleidimo metus, nuomos trukmę ir kainą, kai nuomos kaina yra 4.99 arba mažiau, o nuomos trukmė 5 arba 6 dienos.
SELECT 
	title,
    description,
    release_year,
    rental_duration,
    rental_rate,
    replacement_cost
FROM film
WHERE rental_rate<=4.99 AND rental_duration IN(5,6);

-- Išrinkite filmų pavadinimus, aprašymus, kurių pavadinimas prasideda ALI
SELECT 
	title,
    description
FROM film
WHERE title LIKE 'ALI%';

-- Rasti filmus, kuriu pavadinimo antra raidė yra L
SELECT 
	title
FROM film
WHERE title LIKE'_l%'; 

-- Išrinkite filmus kurių nuomojimo trukmė rental_duration nėra tarp 2 ir 4.
SELECT 
	title,
    rental_duration
FROM film
WHERE rental_duration NOT BETWEEN 2 AND 4;

SELECT 
	order_id
    ,first_name
    ,last_name
FROM orders
INNER JOIN customers
ON orders.customer_id=customers.customer_id;

SELECT
	order_id
    ,t2.first_name
    ,t2.last_name
    ,t1.status
FROM orders as t1
JOIN customers t2
ON t1.customer_id=t2.customer_id;

SELECT
	order_id
    ,order_date
    ,first_name
    ,last_name
    ,name
FROM orders t1
JOIN customers t2
ON t1.customer_id=t2.customer_id
JOIN order_statuses t3
ON t3.order_status_id=t1.status;

SELECT
	t1.first_name
    ,t1.last_name
    ,t2.name
FROM sql_store.customers AS t1
JOIN sql_inventory.products AS t2
ON t1.customer_id = t2.product_id;

-- Sujunkite `order_items` lentelę su `products` lentele SQL_STORE duombazėje. Užklausos rezultate pateikite užsakymo id (order_id), produkto pavadinimą (name),
-- pardavimo kiekį (order_items. quantity), pardavimo kainą (order_items.unit_price), bei pardavimo maržą (pardavimo kaina minus savikainą).
-- Savikaina – products.unit_price Išrikiuokite rezultatą pagal produkto pavadinimą įprasta abecėlės tvarka ir
-- pagal kiekį mažėjančia tvarka nuo didžiausio; lentelės: order_items, products.

SELECT
	t1.order_id AS užsakymo_id
    ,t2.name AS produkto_pavadinimas
    ,t1.quantity AS pardavimo_kiekis
    ,t1.unit_price AS pardavimo_kaina
    ,t1.unit_price-t2.unit_price AS pardavimo_marža
FROM order_items t1
JOIN products t2
ON t1.product_id = t2.product_id
ORDER BY t2.name, t1.quantity DESC;

-- `sql_invoicing` duombazėje pateikite mokėjimų datų (`payments` lentelė), sąskaitų faktūrų id (‘invoice_id’),
-- mokėjimų sumas (‘amount’), klientų vardus (‘name’) ir mokėjimų metodų pavadinimą (‘name’).
-- Naudokite: payments, clients, payment_methods lenteles.

SELECT
    t1.date AS  mokėjimo_data
    ,t1.invoice_id AS sąskaitų_faktūrų_id
    ,t1.amount AS mokėjimų_suma
    ,t2.name AS kliento_vardas
    ,t3.name AS mokėjimo_metodo_pavadinimas
FROM payments t1
JOIN clients t2 ON t2.client_id = t1.client_id
JOIN payment_methods t3 ON t1.payment_method = t3.payment_method_id;



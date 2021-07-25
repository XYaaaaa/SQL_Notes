CREATE DATABASE record_company; 
USE record_company;
CREATE TABLE bands (
	id INT NOT NULL auto_increment,  /* AUTO GENERATE ID*/
	name VARCHAR(255) NOT NULL,
    primary key (id)
);

CREATE TABLE albums(
id INT NOT NULL auto_increment,
NAME VARCHAR(255) NOT NULL,
release_year INT,
band_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY(band_id) references bands(id)	/*reference to table band*/
);

/*DATA INSERT*/

INSERT INTO bands(name)
VALUES('IRON Maiden');
insert into bands(name)
values ('deuce'), ('Avenged Sevenfold'), ('Ankor');

SELECT * FROM bands;

select * FROM bands LIMIT 2;

select name from bands; /*just name column*/

select id as 'ID', name as 'band_name' from bands;

select * from bands order by name; /*can ASC or DESC*/

INSERT INTO albums (name, release_year, band_id)
values ('The Number of the beasts',1985,1),
		('POwer Slave',1984,1),
        ('Nightmare',2018,2),
        ('Nightmare',2010,3),
        ('Test Album', NULL,3);
        
SELECT * FROM albums;
 
SELECT DISTINCT name FROM albums; /*DISTINCT */

update albums set release_year = 1982 where id = 1; /*update speficit column using where */

SELECT * FROM albums;

SELECT * FROM albums WHERE release_year < 2000;

select * from albums where name like '%er%' or band_id = 2; /* % means anything*/

select * from albums where release_year between 2000 and 2018;

select * from albums where release_year is null;
delete from albums where id= 5;

/* !! JOIN STATEMENT !!!*/

select * from bands INNER join albums ON bands.id = albums.band_id; 

/*                             left      right  */

select * from bands LEFT  join albums ON bands.id = albums.band_id; 

select * from bands right join albums ON bands.id = albums.band_id; 

/* Aggregate function part*/

SELECT AVG(release_year) from albums;

SELECT SUM(release_year) from albums;

select band_id, count(band_id) from albums group by band_id;
SELECT * FROM albums;


/* ! complicated pratice !*/
SELECT b.name as band_name, count(a.id) as num_albums 
FROM bands as b   /*left is bands */
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;

SELECT b.name as band_name, count(a.id) as num_albums 
FROM bands as b   /*left is bands */
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
HAVING num_albums = 1;

SELECT b.name as band_name, count(a.id) as num_albums 
FROM bands as b   /*left is bands */
LEFT JOIN albums AS a ON b.id = a.band_id
Where b.name = 'Ankor'
GROUP BY b.id
HAVING num_albums = 1;



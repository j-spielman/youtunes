/*
 * Joseph Spielman|YouTunes SQL|1/30/22
 * db_init file.
 */
create database youTunes;

use database youTunes;
/*
 * User creation for youtunes with default password.
 */
create user 'youtunes_user@localhost' identified by 'PASSWORD';

grant all privileges on youTunes.* TO 'youtunes_user@localhost';

DROP TABLE IF EXISTS Artists;
DROP TABLE IF EXISTS Albums;
/*
 * Create  Artists table
 */
create table Artists(
    artist_id int NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    PRIMARY KEY (artist_id)
);
/*
 * Create Albums table
 */
create table Albums(
    album_id int NOT NULL,
    title varchar(255),
    price decimal(10,2),
    genre varchar(255),
    img_url varchar(255),
    artist_id int NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);
/*
 * Create records for Artists table
 */
INSERT INTO Artists VALUES(1,"James","Brown");
INSERT INTO Artists VALUES(2,"Jack","White");
INSERT INTO Artists VALUES(3,"Gorillaz","");
INSERT INTO Artists VALUES(4,"Front","Bottoms");
INSERT INTO Artists VALUES(5,"Ludwig","van Beethoven");
INSERT INTO Artists VALUES(6,"Ghost","");
INSERT INTO Artists VALUES(7,"The Smashing","Pumpkins");
INSERT INTO Artists VALUES(8,"Anamanaguchi","");
INSERT INTO Artists VALUES(9,"Nine","Inch Nails");
INSERT INTO Artists VALUES(10,"The","Ramones");
INSERT INTO Artists VALUES(11,"Talking","Heads");
INSERT INTO Artists VALUES(12,"The","Cure");
INSERT INTO Artists VALUES(13,"Television","");
INSERT INTO Artists VALUES(14,"Violent","Femmes");
INSERT INTO Artists VALUES(15,"Joy","Division");
/*
 * Create records for Albums table
 */
INSERT INTO Albums VALUES(1,"Gold","9.99","Soul","img/gold.jpg",1);
INSERT INTO Albums VALUES(2,"Lazaretto","12.99","Rock","img/lazaretto.jpg",2);
INSERT INTO Albums VALUES(3,"Plastic Beach","4.99","Art Pop","img/plasticBeach.jpg",3);
INSERT INTO Albums VALUES(4,"Rose","9.99","Indie Rock","img/rose.jpg",4);
INSERT INTO Albums VALUES(5,"Symphonies Collection","19.99","Classical","img/beethoven.jpg",5);
INSERT INTO Albums VALUES(6,"Prequelle","12.99","Metal","img/prequelle.jpg",6);
INSERT INTO Albums VALUES(7,"Siamese Dream","5.99","Rock","img/siameseDream.jpg",7);
INSERT INTO Albums VALUES(8,"Endless Fantasy","19.99","Electro-Pop","img/endlessFantasy.jpg",8);
INSERT INTO Albums VALUES(9,"With Teeth","9.99","Industrial","img/withTeeth.jpg",9);
INSERT INTO Albums VALUES(10,"Ramones-Greatest Hits","19.99","Punk","img/ramonesHits.jpg",10);
INSERT INTO Albums VALUES(11,"The Cure","13.99","New Wave","img/theCure.jpg",12);
INSERT INTO Albums VALUES(12,"Marquee Moon","19.99","Punk","img/marqueeMoon.jpg",13);
INSERT INTO Albums VALUES(13,"Remain In Light","19.50","New Wave","img/inLight.jpg",11);
INSERT INTO Albums VALUES(14,"We Can Do Anything","9.99","Rock","img/doAnything.jpg",14);
INSERT INTO Albums VALUES(15,"Unkown Pleasures","19.99","Classical","img/unknownPleasures.jpg",15);

/*
 * Select all for viewing records after creation.
 */
select Albums.title,Albums.price,Albums.genre,Artists.first_name,Artists.last_name
from Albums
INNER JOIN Artists ON Albums.artist_id=Artists.artist_id;




create database youTunes;

use database youTunes;

create user 'youtunes_user@localhost' identified by 'PASSWORD';

grant all privileges on youTunes.* TO 'youtunes_user@localhost';

DROP TABLE IF EXISTS Artists;
DROP TABLE IF EXISTS Albums;

create table Artists(
    artist_id int NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    PRIMARY KEY (artist_id)
);

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

INSERT INTO Artists VALUES(1,"James","Brown");
INSERT INTO Artists VALUES(2,"Jack","White");
INSERT INTO Artists VALUES(3,"Gorillaz","");
INSERT INTO Artists VALUES(4,"Front","Bottoms");
INSERT INTO Artists VALUES(5,"Ludwig","van Beethoven");

INSERT INTO Albums VALUES(1,"Gold","9.99","Soul","img/gold.jpg",1);
INSERT INTO Albums VALUES(2,"Lazaretto","12.99","Rock","img/lazaretto.jpg",2);
INSERT INTO Albums VALUES(3,"Plastic Beach","4.99","Art Pop","img/plasticBeach.jpg",3);
INSERT INTO Albums VALUES(4,"Rose","9.99","Indie Rock","img/rose.jpg",4);
INSERT INTO Albums VALUES(5,"Symphonies Collection","19.99","Classical","img/beethoven.jpg",5);

select Albums.title,Albums.price,Albums.genre,Artists.first_name,Artists.last_name
from Albums
INNER JOIN Artists ON Albums.artist_id=Artists.artist_id;




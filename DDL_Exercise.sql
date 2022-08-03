CREATE database IF NOT EXISTS MovieCatalogue;
USE MovieCatalogue;

CREATE table IF NOT EXISTS Genre (
	GenreID int primary key,
    GenreName varchar(30) not null
);

CREATE table IF NOT EXISTS Directo(
    DirectorID int primary key,
    FirstName varchar(30) not null,
    LastName varchar(30) not null,
    BirthDate date
);

CREATE table IF NOT EXISTS Rating(
    RatingID int primary key,
    RatingName varchar(5) not null 
);

CREATE table IF NOT EXISTS Actor(
    ActorID int primary key,
    FirstName varchar(30) not null,
    LastName varchar(30) not null,
    BirthDate date
);

CREATE table IF NOT EXISTS Movie(
    MovieID int primary key,
    GenreID int not null,
    DirectorID int,
    RatingID int,
    Title varchar(128) not null,
    ReleaseDate date,
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
    FOREIGN KEY (DirectorID) REFERENCES Directo(DirectorID),
    FOREIGN KEY (RatingID) REFERENCES Rating(RatingID)
);

CREATE table IF NOT EXISTS CastMembers(
    CastMemberID int primary key,
    ActorID int not null,
    MovieID int not null,
    Role varchar(50) not null,
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

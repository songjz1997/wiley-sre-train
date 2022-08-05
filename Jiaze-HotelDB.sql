DROP DATABASE IF EXISTS HotelDB;

CREATE DATABASE HotelDB;

-- Make sure we're in the correct database before we add schema.
USE HotelDB;

CREATE TABLE Room (
	RoomId int PRIMARY KEY,
    RoomType VARCHAR(10) NOT NULL,
    ADA_Accessible BOOL NOT NULL DEFAULT 1,
    Standard_Occupancy int not NULL,
    Max_Occupancy int not null,
    Base_price float not null,
    Extra_person_price float not null,
    Is_microwave BOOL NOT NULL DEFAULT 0,
    Is_jacuzzi BOOL NOT NULL DEFAULT 0,
    Is_refrigerator BOOL NOT NULL DEFAULT 0
);

CREATE TABLE Guest (
	GuestId int PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(30) not NULL,
    State int not null,
    Zip int,
    Phone VARCHAR(20) not null
);

CREATE TABLE reservation (
    ReserveId int PRIMARY KEY,
    GuestId int not null,
    FOREIGN KEY (GuestId) REFERENCES Guest(GuestId),
    RoomId int not null,
    FOREIGN KEY (RoomId) REFERENCES Room(RoomId),
    Name VARCHAR(50) NOT NULL,
    NumberofAdults int not null,
    NumberofChildren int not null,
    Startdate date,
    Enddate date,
    RoomCost float
);

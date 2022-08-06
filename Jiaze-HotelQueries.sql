1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

SELECT name,roomid,startdate,enddate FROM reservation WHERE enddate LIKE '2023-07-%';

name,roomid,startdate,enddate
'Song Jiaze','205','2023-06-28','2023-07-02'
'Walter Holaway','204','2023-07-13','2023-07-14'
'Wilfred Vise','401','2023-07-18','2023-07-21'
'Bettyann Seery','303','2023-07-28','2023-07-29'


2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

SELECT name,roomid,startdate,enddate FROM reservation WHERE roomid IN 
(SELECT roomid FROM Room WHERE is_jacuzzi='yes');

name,roomid,startdate,enddate
'Karie Yang','201','2023-03-06','2023-03-07'
'Bettyann Seery','203','2023-02-05','2023-02-10'
'Karie Yang','203','2023-09-13','2023-09-15'
'Song Jiaze','205','2023-06-28','2023-07-02'
'Wilfred Vise','207','2023-04-23','2023-04-24'
'Walter Holaway','301','2023-04-09','2023-04-13'
'Mack Simmer','301','2023-11-22','2023-11-25'
'Bettyann Seery','303','2023-07-28','2023-07-29'
'Duane Cullison','305','2023-02-22','2023-02-24'
'Bettyann Seery','305','2023-08-30','2023-09-01'
'Song Jiaze','307','2023-03-17','2023-03-20'


3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT name,roomid,startdate,numberofadults+numberofchildren AS NumberofPeople FROM reservation 
WHERE name='Song Jiaze';

name,roomid,startdate,NumberofPeople
'Song Jiaze','307','2023-03-17','2'
'Song Jiaze','205','2023-06-28','2'


4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.

SELECT rm.roomid,rv.reserveid,rv.RoomCost from Room rm LEFT OUTER JOIN reservation rv ON rm.roomid=rv.roomid;

roomid,reserveid,RoomCost
'201','4','199.99'
'202','7','349.98'
'203','2','999.95'
'203','21','399.98'
'204','16','184.99'
'205','15','699.96'
'206','12','599.96'
'206','23','449.97'
'207','10','174.99'
'208','13','599.96'
'208','20','149.99'
'301','9','799.96'
'301','24','599.97'
'302','6','924.95'
'302','25','699.96'
'303','18','199.99'
'304','14','184.99'
'305','3','349.98'
'305','19','349.98'
'306',NULL,NULL
'307','5','524.97'
'308','1','299.98'
'401','11','1199.97'
'401','17','1259.97'
'401','22','1199.97'
'402',NULL,NULL


5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

SELECT roomid from reservation where (startdate LIKE '2023-04-%' OR enddate LIKE '2023-04-%') AND (NumberofAdults+NumberofChildren)>2;

roomid
NULL


6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.

SELECT count(r.reserveid) NumberofReservations,g.name from Guest g JOIN reservation r ON g.guestid=r.guestid 
Group by r.guestid Order by count(r.reserveid) DESC,g.name;

NumberofReservations,name
'4','Mack Simmer'
'3','Bettyann Seery'
'2','Aurore Lipton'
'2','Duane Cullison'
'2','Joleen Tison'
'2','Karie Yang'
'2','Maritza Tiltone'
'2','Song Jiaze'
'2','Walter Holaway'
'2','Wilfred Vise'
'1','Zachery Luechtefeld'


7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

SELECT name,address,phone from Guest WHERE Phone='(231) 893-2755';

name,address,phone
'Joleen Tison','87 Queen St.','(231) 893-2755'





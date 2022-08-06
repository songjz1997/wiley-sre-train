USE HotelDB;

INSERT INTO Guest VALUES(1,'Song Jiaze','N.A.','Singapore','SG','000000','12345678');
INSERT INTO Guest VALUES(2,'Mack Simmer','379 Old Shore Street','Council Bluffs','IA','51501','(291) 553-0508');
INSERT INTO Guest VALUES(3,'Bettyann Seery','750 Wintergreen Dr.','Wasilla','AK','99654','(478) 277-9632');
INSERT INTO Guest VALUES(4,'Duane Cullison','9662 Foxrun Lane','Harlingen','TX','78552','(308) 494-0198');
INSERT INTO Guest VALUES(5,'Karie Yang','9378 W. Augusta Ave.','West Deptford','NJ','08096','(214) 730-02988');
INSERT INTO Guest VALUES(6,'Aurore Lipton','762 Wild Rose Street','Saginaw','MI','48601','(377) 507-0974');
INSERT INTO Guest VALUES(7,'Zachery Luechtefeld','7 Poplar Dr.','Arvada','CO','80003','(814) 485-2615');
INSERT INTO Guest VALUES(8,'Jeremiah Pendergrass','70 Oakwood St.','Zion','IL','60099','(279) 491-0960');
INSERT INTO Guest VALUES(9,'Walter Holaway','7556 Arrowhead St.','Cumberland','RI','02864','(446) 396-6785');
INSERT INTO Guest VALUES(10,'Wilfred Vise','77 West Surrey Street','Oswego','NY','13126','(834) 727-1001');
INSERT INTO Guest VALUES(11,'Maritza Tiltone','939 Linda Rd.','Bruke','VA','22015','(446) 351-6860');
INSERT INTO Guest VALUES(12,'Joleen Tison','87 Queen St.','Drexel Hill','PA','19026','(231) 893-2755');


INSERT INTO Room VALUES(201,'Double','no','2','4','199.99','10','yes','yes','no','no');
INSERT INTO Room VALUES(202,'Double','yes','2','4','174.99','10','no','no','yes','no');
INSERT INTO Room VALUES(203,'Double','no','2','4','199.99','10','yes','yes','no','no');
INSERT INTO Room VALUES(204,'Double','yes','2','4','174.99','10','no','no','yes','no');
INSERT INTO Room VALUES(205,'Single','no','2','2','174.99',null,'yes','yes','yes','no');
INSERT INTO Room VALUES(206,'Single','yes','2','2','149.99',null,'yes','no','yes','no');
INSERT INTO Room VALUES(207,'Single','no','2','2','174.99',null,'yes','yes','yes','no');
INSERT INTO Room VALUES(208,'Single','yes','2','2','149.99',null,'yes','no','yes','no');
INSERT INTO Room VALUES(301,'Double','no','2','4','199.99','10','yes','yes','no','no');
INSERT INTO Room VALUES(302,'Double','yes','2','4','174.99','10','no','no','yes','no');
INSERT INTO Room VALUES(303,'Double','no','2','4','199.99','10','yes','yes','no','no');
INSERT INTO Room VALUES(304,'Double','yes','2','4','174.99','10','no','no','yes','no');
INSERT INTO Room VALUES(305,'Single','no','2','2','174.99',null,'yes','yes','yes','no');
INSERT INTO Room VALUES(306,'Single','yes','2','2','149.99',null,'yes','no','yes','no');
INSERT INTO Room VALUES(307,'Single','no','2','2','174.99',null,'yes','yes','yes','no');
INSERT INTO Room VALUES(308,'Single','yes','2','2','149.99',null,'yes','no','yes','no');
INSERT INTO Room VALUES(401,'Suite','yes','3','8','399.99','20','yes','no','yes','yes');
INSERT INTO Room VALUES(402,'Suite','yes','3','8','399.99','20','yes','no','yes','yes');


INSERT INTO reservation VALUES(1,2,308,'Mack Simmer','1','0','2023-2-2','2023-2-4','299.98');
INSERT INTO reservation VALUES(2,3,203,'Bettyann Seery','2','1','2023-2-5','2023-2-10','999.95');
INSERT INTO reservation VALUES(3,4,305,'Duane Cullison','2','0','2023-2-22','2023-2-24','349.98');
INSERT INTO reservation VALUES(4,5,201,'Karie Yang','2','2','2023-3-6','2023-3-7','199.99');
INSERT INTO reservation VALUES(5,1,307,'Song Jiaze','1','1','2023-3-17','2023-3-20','524.97');
INSERT INTO reservation VALUES(6,6,302,'Aurore Lipton','3','0','2023-3-18','2023-3-23','924.95');
INSERT INTO reservation VALUES(7,7,202,'Zachery Luechtefeld','2','2','2023-3-29','2023-3-31','349.98');
INSERT INTO reservation VALUES(8,8,304,'Jeremiah Pendergrass','2','0','2023-3-31','2023-4-5','874.95');
INSERT INTO reservation VALUES(9,9,301,'Walter Holaway','1','0','2023-4-9','2023-4-13','799.96');
INSERT INTO reservation VALUES(10,10,207,'Wilfred Vise','1','1','2023-4-23','2023-4-24','174.99');
INSERT INTO reservation VALUES(11,11,401,'Maritza Tilton','2','4','2023-5-30','2023-6-2','1199.97');
INSERT INTO reservation VALUES(12,12,206,'Joleen Tison','2','0','2023-6-10','2023-6-14','599.96');
INSERT INTO reservation VALUES(13,12,208,'Joleen Tison','1','0','2023-6-10','2023-6-14','599.96');
INSERT INTO reservation VALUES(14,6,304,'Aurore Lipton','3','0','2023-6-17','2023-6-18','184.99');
INSERT INTO reservation VALUES(15,1,205,'Song Jiaze','2','0','2023-6-28','2023-7-2','699.96');
INSERT INTO reservation VALUES(16,9,204,'Walter Holaway','3','1','2023-7-13','2023-7-14','184.99');
INSERT INTO reservation VALUES(17,10,401,'Wilfred Vise','4','2','2023-7-18','2023-7-21','1259.97');
INSERT INTO reservation VALUES(18,3,303,'Bettyann Seery','2','1','2023-7-28','2023-7-29','199.99');
INSERT INTO reservation VALUES(19,3,305,'Bettyann Seery','1','0','2023-8-30','2023-9-1','349.98');
INSERT INTO reservation VALUES(20,2,208,'Mack Simmer','2','0','2023-9-16','2023-9-17','149.99');
INSERT INTO reservation VALUES(21,5,203,'Karie Yang','2','2','2023-9-13','2023-9-15','399.98');
INSERT INTO reservation VALUES(22,4,401,'Duane Cullison','2','2','2023-11-22','2023-11-25','1199.97');
INSERT INTO reservation VALUES(23,2,206,'Mack Simmer','2','0','2023-11-22','2023-11-25','449.97');
INSERT INTO reservation VALUES(24,2,301,'Mack Simmer','2','2','2023-11-22','2023-11-25','599.97');
INSERT INTO reservation VALUES(25,11,302,'Maritza Tilton','2','0','2023-12-24','2023-12-28','699.96');


SET SQL_SAFE_UPDATES = 0;
DELETE FROM reservation WHERE GuestId=(SELECT Guestid from Guest WHERE Name='Jeremiah Pendergrass');
DELETE FROM Guest WHERE Name='Jeremiah Pendergrass';
SET SQL_SAFE_UPDATES = 1;

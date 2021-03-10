USE holidays
;

-- Vide les tables
DELETE FROM booking;
DELETE FROM customers WHERE cno > 0;
DELETE FROM rooms WHERE rno <> '';
DELETE FROM hotels WHERE hno > 0;
ALTER TABLE hotels AUTO_INCREMENT = 1;
DELETE FROM cities WHERE zip <> '';

-- Table CITIES
INSERT INTO cities VALUES ('12203','Albany','US');
INSERT INTO cities VALUES ('60601','Chicago','US');
INSERT INTO cities VALUES ('60615','Chicago','US');
INSERT INTO cities VALUES ('45211','Cincinnati','US');
INSERT INTO cities VALUES ('33575','Clearwater','US');
INSERT INTO cities VALUES ('75243','Dallas','US');
INSERT INTO cities VALUES ('32018','Daytona Beach','US');
INSERT INTO cities VALUES ('33441','Deerfield Beach','US');
INSERT INTO cities VALUES ('48226','Detroit','US');
INSERT INTO cities VALUES ('90029','Hollywood','US');
INSERT INTO cities VALUES ('92714','Irvine','US');
INSERT INTO cities VALUES ('90804','Long Beach','US');
INSERT INTO cities VALUES ('11788','Long Island','US');
INSERT INTO cities VALUES ('90018','Los Angeles','US');
INSERT INTO cities VALUES ('70112','New Orleans','US');
INSERT INTO cities VALUES ('10580','New York','US');
INSERT INTO cities VALUES ('10019','New York','US');
INSERT INTO cities VALUES ('92262','Palm Springs','US');
INSERT INTO cities VALUES ('97213','Portland','US');
INSERT INTO cities VALUES ('60018','Rosemont','US');
INSERT INTO cities VALUES ('95054','Santa Clara','US');
INSERT INTO cities VALUES ('20903','Silver Spring','US');
INSERT INTO cities VALUES ('20037','Seattle','US');
INSERT INTO cities VALUES ('20005','Seattle','US');
INSERT INTO cities VALUES ('20019','Seattle','US');

INSERT INTO cities VALUES 
	('91290','Arpajon','FR'),
	('10431','Athènes','GR'),
	('0054','Erevan','AM'),
	('10316','Stockholm','SE'),
	('00100','Rome','IT'),
	('97232','Lamentin','MQ'),
	('605005','Mattour','IN'),
	('230532','Mumbai','IN'),
	('91150','Etampes','FR'),
	('605001','Pondichery','IN'),
	('4000','Porto','PT'),
	('100-0001','Tokyo','JP'),
	('75001','Paris','FR'),
	('G0A 4V0','Québec','CA'),
	('06400','Cannes','FR'),
	('6000','Perth','AU')
;

-- Table HOTELS
INSERT INTO hotels(name,zip,address) VALUES ('Congress','20005','155 Beechwood St.');
INSERT INTO hotels(name,zip,address) VALUES ('Regency','20037','477 17th Avenue');
INSERT INTO hotels(name,zip,address) VALUES ('Long Island','11788','1499 Grove Street');
INSERT INTO hotels(name,zip,address) VALUES ('Empire State','12203','65 Yellowstone Dr.');
INSERT INTO hotels(name,zip,address) VALUES ('Midtown','10019','12 Barnard St.');
INSERT INTO hotels(name,zip,address) VALUES ('Eighth Avenue','10019','112 8th Avenue');
INSERT INTO hotels(name,zip,address) VALUES ('Lake Michigan','60601','354 OAK Terrace');
INSERT INTO hotels(name,zip,address) VALUES ('Airport','60018','650 C Parkway');
INSERT INTO hotels(name,zip,address) VALUES ('Sunshine','33575','200 Yellowstone Dr.');
INSERT INTO hotels(name,zip,address) VALUES ('Beach','32018','1980 34th St.');
INSERT INTO hotels(name,zip,address) VALUES ('Atlantic','33441','111 78th St.');
INSERT INTO hotels(name,zip,address) VALUES ('Long Beach','90804','35 Broadway');
INSERT INTO hotels(name,zip,address) VALUES ('Indian Horse','92262','16 Main Street');
INSERT INTO hotels(name,zip,address) VALUES ('Star','90029','13 Beechwood Place');
INSERT INTO hotels(name,zip,address) VALUES ('River Boat','70112','788 Main Street');

INSERT INTO hotels(zip,name) VALUES 
	('91290','Hôtel de police'),
	('10431','Miros'),
	('0054','Marriott'),
	('10316','Hilton Slussen'),
	('00100','Napoleon Hotel'),
	('97232','Tropical'),
	('605005','Kumar Hotel'),
	('230532','Calinga Inn'),
	('91150','Ibis'),
	('605001','ANNAMALAI'),
	('4000','Silva Resort'),
	('100-0001','Sunroute Plaza'),
	('75001','Hotel Plaza'),
	('G0A 4V0','Hôtel Universel'),
	('06400','Carlton'),
	('6000','Palfi Inn')
;

-- Table ROOMS
INSERT INTO rooms VALUES ('1-1','single',135.00,1);
INSERT INTO rooms VALUES ('1-2','double',200.00,1);
INSERT INTO rooms VALUES ('3-1','single',45.00,3);
INSERT INTO rooms VALUES ('3-2','double',80.00,3);
INSERT INTO rooms VALUES ('2-1','single',70.00,2);
INSERT INTO rooms VALUES ('2-2','double',100.00,2);
INSERT INTO rooms VALUES ('7-1','single',115.00,7);
INSERT INTO rooms VALUES ('7-2','double',180.00,7);
INSERT INTO rooms VALUES ('8-1','single',90.00,8);
INSERT INTO rooms VALUES ('8-2','double',150.00,8);
INSERT INTO rooms VALUES ('8-3','suite',400.00,8);
INSERT INTO rooms VALUES ('4-1','single',85.00,4);
INSERT INTO rooms VALUES ('4-2','double',140.00,4);
INSERT INTO rooms VALUES ('5-1','single',105.00,5);
INSERT INTO rooms VALUES ('5-2','double',180.00,5);
INSERT INTO rooms VALUES ('5-3','suite',500.00,5);
INSERT INTO rooms VALUES ('6-1','single',120.00,6);
INSERT INTO rooms VALUES ('6-2','double',200.00,6);
INSERT INTO rooms VALUES ('6-3','suite',500.00,6);
INSERT INTO rooms VALUES ('9-1','single',90.00,9);
INSERT INTO rooms VALUES ('9-2','double',150.00,9);
INSERT INTO rooms VALUES ('9-3','suite',300.00,9);
INSERT INTO rooms VALUES ('10-1','single',60.00,10);
INSERT INTO rooms VALUES ('10-2','double',100.00,10);
INSERT INTO rooms VALUES ('11-1','single',70.00,11);
INSERT INTO rooms VALUES ('11-2','double',130.00,11);
INSERT INTO rooms VALUES ('12-1','single',80.00,12);
INSERT INTO rooms VALUES ('12-2','double',140.00,12);
INSERT INTO rooms VALUES ('12-3','suite',350.00,12);
INSERT INTO rooms VALUES ('15-1','single',100.00,15);
INSERT INTO rooms VALUES ('15-2','double',190.00,15);
INSERT INTO rooms VALUES ('15-3','suite',450.00,15);
INSERT INTO rooms VALUES ('13-1','single',160.00,13);
INSERT INTO rooms VALUES ('13-2','double',270.00,13);
INSERT INTO rooms VALUES ('13-3','suite',700.00,13);
INSERT INTO rooms VALUES ('14-1','single',125.00,14);
INSERT INTO rooms VALUES ('14-2','double',200.00,14);
INSERT INTO rooms VALUES ('14-3','suite',600.00,14);

-- Table CUSTOMERS
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (30,'Jenny','Porter','jenny.porter@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (31,'Peter','Brown','peter.brown@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (32,' ','Datasoft','contact@datasoft.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (33,'Rose','Brian','rose.brian@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (34,'Mary','Griffith','mgriffith@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (35,'Martin','Randolph','martin_randolph@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (36,'Sally','Smith','sally.smith@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (37,'Mike','Jackson','mike-jax@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (38,'Rita','Doe','rita.doe@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (39,'George','Howe','ghowe@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (40,'Frank','Miller','frak.miller@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (41,'Susan','Baker','susan.baker@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (42,'Joseph','Peters','jp@greta.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (43,' ','TOOLware','hr@toolware.com','secret');
INSERT INTO customers(cno,fname,lname,mail,pass) VALUES (44,'Antony','Jenkins','antojenk@greta.com','secret');

-- Table BOOKING
INSERT INTO booking VALUES ('4-2',30,'2021-06-13','2021-06-15',140);
INSERT INTO booking VALUES ('8-2',30,'2021-03-24','2021-04-06',150);
INSERT INTO booking VALUES ('9-2',32,'2021-04-14','2021-04-18',150);
INSERT INTO booking VALUES ('13-1',39,'2021-03-01','2021-03-03',160);
INSERT INTO booking VALUES ('5-2',36,'2021-03-14','2021-03-24',180);
INSERT INTO booking VALUES ('7-2',43,'2021-04-12','2021-04-30',180);
INSERT INTO booking VALUES ('15-2',41,'2021-05-12','2021-05-15',190);
INSERT INTO booking VALUES ('1-2',44,'2021-05-01','2021-05-03',200);
INSERT INTO booking VALUES ('14-2',31,'2021-01-23','2021-02-08',200);
INSERT INTO booking VALUES ('6-2',43,'2021-05-14','2021-05-17',200);
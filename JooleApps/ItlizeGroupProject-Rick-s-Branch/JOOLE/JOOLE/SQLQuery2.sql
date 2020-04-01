CREATE TABLE [dbo].[CUSTOMER] (
	[CUSTOMERID] INT        IDENTITY (4001,1) NOT NULL,
	[USERNAME]   NCHAR (50) NOT NULL UNIQUE,
	[PASSWORD]   NCHAR (50) NOT NULL,
	[FULLNAME]   NCHAR (50) NOT NULL,
	[PICTURE]    NCHAR (150) NULL,
	PRIMARY KEY CLUSTERED ([CUSTOMERID] ASC)
);

CREATE TABLE [dbo].[PROJECT] (
	[PROJECT ID]       INT        IDENTITY(1001,1) NOT NULL,
	[PROJECT LOCATION] NCHAR (50) NOT NULL,
	[PROJECT NAME]     NCHAR (50) NOT NULL,
	[CUSTOMERID]       INT        NOT NULL,
	PRIMARY KEY CLUSTERED ([PROJECT ID] ASC),
	FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMER
);

CREATE TABLE Subcat(
	sub_catID INT IDENTITY(1,1),
	sub_catname varchar(50) NOT NULL UNIQUE,
	CategoryName varchar(40) NOT NULL,
	PRIMARY KEY(sub_catID ASC)
);

CREATE TABLE Product(
	productID INT IDENTITY(9001,1),
	sub_catID INT NOT NULL,
	manufName varchar(200) NOT NULL,
	prodname varchar(3000) NOT NULL,
	prodimage varchar(8000),
	price numeric(8,2) NOT NULL,
	series varchar(50) NOT NULL,
	model varchar(200) NOT NULL,
	modelyear INT NOT NULL,
	usetype varchar(200) NOT NULL,
	applicate varchar(200),
	mountingloc varchar(200),
	accessories varchar(300),
	Airflow INT,
	PwrMin numeric(5,2),
	PwrMax numeric(5,2),
	OperatingVoltageMin varchar(20),
	OperatingVoltageMax varchar(20),
	FanSpeedMin varchar(20),
	FanSpeedMax varchar(20),
	NumofSpeeds varchar(20),
	SoundAtMaxSpeed varchar(20),
	FanSweepDiam varchar(20),
	SuctionSpeed varchar(20),
	PipeDiameter varchar(20),
	Brightness varchar(20),
	Warranty varchar(20),
	HeightMin varchar(20),
	HeightMax varchar(20),
	Wght varchar(20),

	PRIMARY KEY(productID ASC),
	FOREIGN KEY(sub_catID) REFERENCES Subcat ON DELETE CASCADE
);

INSERT INTO CUSTOMER
values('svincent', 'sv111', 'Shawn Vincent', ''),
('jgill', 'jg222', 'Julie Gill', ''),
('pparker', 'pp888', 'Peter Parker', '');

INSERT INTO PROJECT
values('Edison','Edison Railways',4002),
('Dunellen','Dunellen-Vic Parker House',4003),
('Brooklyn','Brooklyn-Itlize HQ',4002);


INSERT INTO Subcat
values ('Lights', 'Electrical'),
('Fans', 'Electrical'),
('Pipes', 'Plumbing');

insert into Product
values (1,'General Electric','SuperBrite Bulbs','',3.00,'LB-300','B-RANDOM',2009,'Residential','Outdoor', 'Wall', '','', '3.00', '5.00', '5', '7', '','','','','','','','8','1', '20', '25','0.5'),
(2,'Bajaj Industries','SpinRound','',87.00,'FNS-8000','FA-RANDOM',2019,'Residential', 'Indoor', 'Roof', 'Lights', '3121', '1.92', '24.00', '100', '220', '40', '220', '7', '25', '65','','','','3','45','65','11'),
(2,'General Electric','SpinCircle','https://images.homedepot-static.com/productImages/5b7bbc85-dc24-4c89-abd5-2405df6c064a/svn/brushed-nickel-hunter-ceiling-fans-with-lights-59212-31_1000.jpg',95.00,'FNS-ABAB','FB-RANDOM',2020,'Commercial', 'Indoor', 'Roof', 'Lights', '5467', '1.95', '21.14', '100', '240', '35', '200', '7', '35', '60', '', '','' , '2', '50', '65', '13');

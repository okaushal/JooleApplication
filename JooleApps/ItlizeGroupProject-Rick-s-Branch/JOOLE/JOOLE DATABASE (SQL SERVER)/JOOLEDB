CREATE TABLE [dbo].[CUSTOMER] (
    [CUSTOMERID] INT        NOT NULL,
    [USERNAME]   NCHAR (50) NOT NULL,
    [PASSWORD]   NCHAR (50) NOT NULL,
    [FULLNAME]   NCHAR (50) NOT NULL,
    [PICTURE]    NCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([CUSTOMERID] ASC)
);

CREATE TABLE [dbo].[PROJECT] (
    [PROJECT ID]       INT        NOT NULL,
    [PROJECT LOCATION] NCHAR (50) NOT NULL,
    [PROJECT NAME]     NCHAR (50) NULL,
    [CUSTOMERID]       INT        NOT NULL,
    PRIMARY KEY CLUSTERED ([PROJECT ID] ASC)
);
CREATE TABLE [dbo].[SUPPLIER] (
    [SUPPLIERID] INT        NOT NULL,
    [USERNAME]   NCHAR (50) NOT NULL,
    [PASSWORD]   NCHAR (50) NOT NULL,
    [FULLNAME]   NCHAR (50) NOT NULL,
    [PICTURE]    NCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([SUPPLIERID] ASC)
);
CREATE TABLE [dbo].[Category] (
    [CategoryId]  INT           IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);

CREATE TABLE Subcat(
	sub_catID INT IDENTITY(1,1),
	sub_catname varchar(50) NOT NULL UNIQUE,
	CategoryID INT,
	PRIMARY KEY(sub_catID ASC),
	FOREIGN KEY	(CategoryID) REFERENCES Category ON DELETE CASCADE
);

CREATE TABLE Manufacturer(
	manufID INT IDENTITY(7001,1),
	manufname varchar(50),
	PRIMARY KEY(manufID ASC)
);

CREATE TABLE Product(
	productID INT IDENTITY(9001,1),
	sub_catID INT NOT NULL,
	SUPPLIERID INT NOT NULL,
	manufID INT NOT NULL,
	prodname varchar(3000) NOT NULL,
	prodimage varchar(8000),
	price numeric(8,2) NOT NULL,
	series varchar(50) NOT NULL,
	model varchar(200) NOT NULL,
	modelyear INT NOT NULL,
	model_info varchar(8000),
	techspecs varchar(8000),
	PRIMARY KEY(productID ASC),
	FOREIGN KEY(sub_catID) REFERENCES Subcat ON DELETE CASCADE,
	FOREIGN KEY(SUPPLIERID) REFERENCES SUPPLIER ON DELETE CASCADE,
	FOREIGN KEY(manufID) REFERENCES Manufacturer ON DELETE CASCADE,
);

INSERT INTO Category
values ('Mechanical'),
('Plumbing'),
('Furniture'),
('Electrical');

INSERT INTO Subcat
values ('Lights', 4),
('Fans', 4),
('Pipes', 2);

INSERT INTO Manufacturer
values ('Bajaj Industries'),
('General Electric'),
('AMCO Corp');

INSERT INTO SUPPLIER
values (2001, 'speck', 's311', 'Shawn Peck', ''),
(2002, 'jcollins', 'jco', 'Jill Collins', ''),
(2003, 'kretmob', 'k4500', 'Kate Retmob', '');

insert into Product
values (1,2002,7003,'A Bulbs','',3.00,'LB-300','B-RANDOM',2009,'',''),
(2,2001,7001,'Fan A','',87.00,'FNS-8000','FA-RANDOM',2019,'{Accessories: Lights, Mount:Ceiling}','{Speed:6}'),
(2,2002,7002,'Fan B','https://images.homedepot-static.com/productImages/5b7bbc85-dc24-4c89-abd5-2405df6c064a/svn/brushed-nickel-hunter-ceiling-fans-with-lights-59212-31_1000.jpg',95.00,'FNS-ABAB','FB-RANDOM',2020,'{Accessories: Lights, Mount:Ceiling}','{Speed:7}');

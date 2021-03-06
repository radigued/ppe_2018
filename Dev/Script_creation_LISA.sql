CREATE DATABASE IF NOT EXISTS LISA;
USE LISA;

CREATE TABLE IF NOT EXISTS User(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Login VARCHAR(200) NOT NULL,
	Password VARCHAR(200) NOT NULL,
	Discrimant INT NOT NULL,
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Operation(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Code VARCHAR(50) NOT NULL,
	Title VARCHAR(200),
	StartDate DATETIME,
	EndDate DATETIME,
	ImportIdOperation INT,
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Catalog(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Type VARCHAR(50),
	Label VARCHAR(200),
	Speed VARCHAR(20) NOT NULL,
	Width INT NOT NULL,
	Height INT NOT NULL,
	IdOperation INT NOT NULL,
	ImportIdCatalog INT,
	FOREIGN KEY(IdOperation) REFERENCES Operation(Id),
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Page(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Number INT NOT NULL,
	IdOperation INT NOT NULL,
	ImportIdPage INT,
	FOREIGN KEY(IdOperation) REFERENCES Operation(Id),
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Category(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Label VARCHAR(200) NOT NULL,
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Product(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Code VARCHAR(50) NOT NULL,
	Label VARCHAR(200) NOT NULL,
	Description VARCHAR(2000),
	Quantity INT NOT NULL,
	IdCategory INT NOT NULL,
	ImportIdProduct INT,
	FOREIGN KEY(IdCategory) REFERENCES Category(Id),
	PRIMARY KEY(Id)	
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Attribute(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Label VARCHAR(200),
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS ProductAttribute(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Value VARCHAR(4000),
	IdProduct INT NOT NUll,
	IdAttribute INT NOT NULL,
	FOREIGN KEY(IdProduct) REFERENCES Product(Id),
	FOREIGN KEY(IdAttribute) REFERENCES Attribute(Id),
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Shop(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Label VARCHAR(200),
	ImportIdShop INT,
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS ShopCatalog(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	StartDate DATETIME NOT NULL,
	EndDate DTAETIME NOT NULL,
	IdShop INT NOT NULL,
	IdCatalog INT NOT NULL,
	FOREIGN KEY(IdShop) REFERENCES Shop(Id),
	FOREIGN KEY(IdCatalog) REFERENCES Catalog(Id),
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS PriceCatalogProduct(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Price DECIMAL(2,18),
	PriceBeforeTicket DECIMAL(2,18),
	PriceBeforeCrossed DECIMAL(2,18),	
	ReductionEuro DECIMAL(2,18),
	ReductionPercent DECIMAL(2,18),
	AdvantageEuro DECIMAL(2,18),
	AvantagePercent DECIMAL(2,18),
	Ecotaxe DECIMAL(2,18),
	IdCatalog INT NOT NULL,
	IdProduct INT NOT NULL,
	FOREIGN KEY(IdCatalog) REFERENCES Catalog(Id),
	FOREIGN KEY(IdProduct) REFERENCES Product(Id),
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS PositionProduct(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	ZoneHeight INT NOT NULL,
	ZoneWidth INT NOT NULL,
	ZoneCoordonateX INT NOT NULL,
	ZoneCoordonateY INT NOT NULL,
	IdPage INT NOT NULL,
	IdProduct INT NOT NULL,
	FOREIGN KEY(IdPage) REFERENCES Page(Id),
	FOREIGN KEY(IdProduct) REFERENCES Product(Id),
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS TypeMedia(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Label VARCHAR(200) NOT NULL,
	PRIMARY KEY(Id)
	)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Media(
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Path VARCHAR(4000) NOT NULL,
	IdTypeMedia INT NOT NULL,
	IdProduct INT NOT NULL,
	FOREIGN KEY(IdTypeMedia) REFERENCES TypeMedia(Id),
	FOREIGN KEY(IdProduct) REFERENCES Product(Id),
	PRIMARY KEY(Id)
	)ENGINE=INNODB;
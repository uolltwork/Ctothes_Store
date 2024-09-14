CREATE DATABASE NowSaiGon;
Go

USE NowSaiGon;
Go

--1. Create tables
CREATE TABLE Account(
	account_id int PRIMARY KEY NOT NULL IDENTITY(1,1),
	account_phone varchar(15) NOT NULL,
	account_password varchar(30) NOT NULL,
	role_id int
);
Go

CREATE TABLE Customer(
	customer_id int PRIMARY KEY NOT NULL IDENTITY(1,1),
	customer_fullName nvarchar(50) NOT NULL,
	customer_email varchar(50) NOT NULL,
	customer_address nvarchar(300) NOT NULL ,
	account_id int FOREIGN KEY(account_id) REFERENCES Account(account_id)
);
GO

CREATE TABLE Category(
	category_id int PRIMARY KEY NOT NULL IDENTITY(1,1),
	category_name varchar(50) NOT NULL,
);
Go

CREATE TABLE Product(
	product_id int PRIMARY KEY NOT NULL IDENTITY(1,1),
	product_tittle varchar(150) NOT NULL,
	product_import_price int CHECK(product_import_price >= 0) NOT NULL,
	product_price int CHECK(product_price >= 0) NOT NULL,
	product_sale_percent int CHECK(product_sale_percent >= 0) NOT NULL,
	product_disciption varchar(300),
	catelogy_id int FOREIGN KEY(catelogy_id ) REFERENCES Category(category_id)
);
Go

CREATE TABLE ProductSize(
	product_size_s int NOT NULL,
	product_size_m int NOT NULL,
	product_size_l int NOT NULL,
	product_size_xl int NOT NULL,
	product_id int FOREIGN KEY(product_id) REFERENCES Product(product_id),
	CONSTRAINT "PK_ProductSize" PRIMARY KEY  CLUSTERED 
	(
		"product_id"
	),
) 
Go

CREATE TABLE Orders(
	order_id int PRIMARY KEY NOT NULL IDENTITY(1,1),
	order_date date NOT NULL,
	order_status nvarchar(30) NOT NULL,
	customer_id int FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
	note nvarchar(300)
)
Go

CREATE TABLE Cart( 
	product_id int FOREIGN KEY(product_id) REFERENCES Product(product_id) NOT NULL,
	customer_id int FOREIGN KEY(customer_id) REFERENCES Customer(customer_id) NOT NULL,
	order_id int FOREIGN KEY(order_id) REFERENCES Orders(order_id),
	size nvarchar(2) NOT NULL,
	quantity int NOT NULL,
	PRIMARY KEY(product_id, customer_id,  size)
)
Go

-- 2. Insert values into table
--Insert into table Account
INSERT INTO Account VALUES('0352016906', 'Kce160367@', 1);
INSERT INTO Account VALUES('0342019291', '1234567Aa@', 3);
INSERT INTO Account VALUES('0388456789', '1234567Bb@', 3);
INSERT INTO Account VALUES('0943234567', '1234567Cc@', 3);
INSERT INTO Account VALUES('0912876345', '1234567Dd@', 3);
INSERT INTO Account VALUES('0912322121', '1234567Ee@', 3);
SELECT * FROM Account;


--Insert into table Customer
INSERT INTO Customer VALUES('Admin', 'admin@fpt.edu.vn', 'admin', 1);
INSERT INTO Customer VALUES('Lê Khanh Băng', 'banglkce160367@fpt.edu.vn', 'ấp an thới, thới bình, thới lai, cà mau', 2);
INSERT INTO Customer VALUES('Huỳnh Hữu Nghĩa', 'nghiahhce160367@fpt.edu.vn', 'ấp bình minh, thới bình, thới lai, kiêng giang', 3);
INSERT INTO Customer VALUES('Nguyễn Đường Phú Trọng', 'trongndpce160367@fpt.edu.vn', '123/a Nguyễn văn trường, thới bình, thới lai, an giang', 4);
INSERT INTO Customer VALUES('Lê Trung Uol', 'uolltce160367@fpt.edu.vn', '234/b Nguyễn văn trường thới bình, thới lai, cà mau',5);
INSERT INTO Customer VALUES('Quach Luyl Da', 'abcdef@fpt.edu.vn', '234/b Nguyễn văn trường Thoi lai, thoi binh, an hoa, can tho', 6);
select * from Customer;

--Insert into table Category
INSERT INTO Category VALUES('Tee');
INSERT INTO Category VALUES('Sweeter');
INSERT INTO Category VALUES('Hoddies');
INSERT INTO Category VALUES('Jacket');
INSERT INTO Category VALUES('Pant');
INSERT INTO Category VALUES('Others');
SELECT * FROM Category;

--Insert into table Product
INSERT INTO Product VALUES('CYBER DARK MARCUS TEE', 450000, 500000, 0, 'NEEDS OF WISDOM® / Streetwear / Based in Saigon / Made in Vietnam', 1);
INSERT INTO Product VALUES('HG POLO SHIRTS - TASMAN', 360000, 410000, 0, 'NEEDS OF WISDOM® / Streetwear / Based in Saigon / Made in Vietnam', 1);
INSERT INTO Product VALUES('LITN TEE - BLACK', 357000, 397000, 20, 'NEEDS OF WISDOM® / Streetwear / Based in Saigon / Made in Vietnam', 1);
INSERT INTO Product VALUES('WHEEL OF THUNDER TEE - TASMAN', 335750, 385750, 10, 'NEEDS OF WISDOM® / Streetwear / Based in Saigon / Made in Vietnam', 1);
INSERT INTO Product VALUES('IHTW TEE - CREAM', 316000, 366000, 0, 'NEEDS OF WISDOM® / Streetwear / Based in Saigon / Made in Vietnam', 1);
INSERT INTO Product VALUES('PIXEL NOWSAIGON POLO SHIRT - TASMAN', 259000, 309000, 42, 'NEEDS OF WISDOM® / Streetwear / Based in Saigon / Made in Vietnam', 1);
INSERT INTO Product VALUES('SHERPA HOODIE - B&W', 968000, 1108000, 0, 'NEEDS OF WISDOM® / Streetwear / Based in Saigon / Made in Vietnam', 3);
INSERT INTO Product VALUES('ZIP WASH HOODIE', 455000, 505000, 30, 'NEEDS OF WISDOM® / Streetwear / Based in Saigon / Made in Vietnam', 3);
select product_id from Product;

--Insert into table Product size
INSERT INTO ProductSize VALUES(10, 10 , 10, 10, 1);
INSERT INTO ProductSize VALUES(10, 10 , 10, 10, 2);
INSERT INTO ProductSize VALUES(10, 20 , 10, 10, 3);
INSERT INTO ProductSize VALUES(10, 10 , 10, 10, 4);
INSERT INTO ProductSize VALUES(10, 10 , 20, 10, 5);
INSERT INTO ProductSize VALUES(10, 10 , 10, 10, 6);
INSERT INTO ProductSize VALUES(10, 10 , 10, 10, 7);
INSERT INTO ProductSize VALUES(10, 10 , 10, 10, 8);
select * from ProductSize;

--Insert into table Order
select * from Orders;
insert into Orders values('1/1/2000','Admin',1,'order cua admin dung de quan ly cart chua order')

--Insert into table Cart
select * from Cart;



USE KingdomOfKod;
GO

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('sales_statement'))
BEGIN;
    DROP TABLE [sales_statement];
END;
GO

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('sales'))
BEGIN;
    DROP TABLE [sales];
END;  
GO

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('export_destination'))
BEGIN;
    DROP TABLE [export_destination];
END;
GO

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('product'))
BEGIN;
    DROP TABLE [product];
END;
GO

CREATE TABLE [export_destination] (
    [export_destination_code] INTEGER NOT NULL,
    [export_destination_name] VARCHAR(255) NULL,
	PRIMARY KEY ([export_destination_code])
);
GO

CREATE TABLE [product] (
    [product_code] INTEGER NOT NULL IDENTITY(101, 1),
    [product_name] VARCHAR(255) NULL,
    [unit_price] INTEGER NULL,
	PRIMARY KEY ([product_code])
);
GO

CREATE TABLE [sales] (
    [report_code] INTEGER NOT NULL IDENTITY(1101, 1),
    [salesDate] DATE NULL,
	[export_destination_code] INTEGER NOT NULL FOREIGN KEY REFERENCES export_destination(export_destination_code),
	PRIMARY KEY ([report_code])	
);
GO

CREATE TABLE [sales_statement] (
    [report_code] INTEGER NOT NULL FOREIGN KEY REFERENCES sales(report_code),
    [product_code] INTEGER NOT NULL FOREIGN KEY REFERENCES product(product_code),
	[quantity] INTEGER NULL
);
GO

INSERT INTO export_destination([export_destination_code],[export_destination_name]) VALUES(12,'The Kingdom of Minanmi');
INSERT INTO export_destination([export_destination_code],[export_destination_name]) VALUES(23,'Alpha Empire');
INSERT INTO export_destination([export_destination_code],[export_destination_name]) VALUES(25,'The Kingdom of Ritol');

INSERT INTO product([product_name], [unit_price]) VALUES('Melon',800);
INSERT INTO product([product_name], [unit_price]) VALUES('Strawberry',150);
INSERT INTO product([product_name], [unit_price]) VALUES('Apple',120);
INSERT INTO product([product_name], [unit_price]) VALUES('Lemon',200);

INSERT INTO sales([salesDate], [export_destination_code]) VALUES('2017-03-05', 12);
INSERT INTO sales([salesDate], [export_destination_code]) VALUES('2017-03-07', 23);
INSERT INTO sales([salesDate], [export_destination_code]) VALUES('2017-03-08', 25);
INSERT INTO sales([salesDate], [export_destination_code]) VALUES('2017-03-10', 12);
INSERT INTO sales([salesDate], [export_destination_code]) VALUES('2017-03-12', 25);

INSERT INTO sales_statement([report_code],[product_code], [quantity]) VALUES(1101, 101, 1100);
INSERT INTO sales_statement([report_code],[product_code], [quantity]) VALUES(1102, 102, 300);
INSERT INTO sales_statement([report_code],[product_code], [quantity]) VALUES(1102, 103, 1700);
INSERT INTO sales_statement([report_code],[product_code], [quantity]) VALUES(1103, 104, 500);
INSERT INTO sales_statement([report_code],[product_code], [quantity]) VALUES(1104, 101, 2500);
INSERT INTO sales_statement([report_code],[product_code], [quantity]) VALUES(1105, 103, 2000);
INSERT INTO sales_statement([report_code],[product_code], [quantity]) VALUES(1105, 104, 700);
GO

SELECT product_name
FROM product;
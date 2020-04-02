
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/30/2020 12:29:46
-- Generated from EDMX file: C:\Users\mashiro\source\repos\okaushal\ItlizeGroupProject\JOOLE\JOOLE\JOOLE\Models\JOOLE.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Database];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Subcat__Category__2C3393D0]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Subcats] DROP CONSTRAINT [FK__Subcat__Category__2C3393D0];
GO
IF OBJECT_ID(N'[dbo].[FK__Product__manufID__32E0915F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK__Product__manufID__32E0915F];
GO
IF OBJECT_ID(N'[dbo].[FK__Product__sub_cat__30F848ED]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK__Product__sub_cat__30F848ED];
GO
IF OBJECT_ID(N'[dbo].[FK__Product__SUPPLIE__31EC6D26]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK__Product__SUPPLIE__31EC6D26];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[CUSTOMERs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CUSTOMERs];
GO
IF OBJECT_ID(N'[dbo].[Manufacturers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Manufacturers];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[PROJECTs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PROJECTs];
GO
IF OBJECT_ID(N'[dbo].[Subcats]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subcats];
GO
IF OBJECT_ID(N'[dbo].[SUPPLIERs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SUPPLIERs];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(20)  NOT NULL
);
GO

-- Creating table 'CUSTOMERs'
CREATE TABLE [dbo].[CUSTOMERs] (
    [CUSTOMERID] int  NOT NULL,
    [USERNAME] nchar(50)  NOT NULL,
    [PASSWORD] nchar(50)  NOT NULL,
    [FULLNAME] nchar(50)  NOT NULL,
    [PICTURE] nchar(150)  NULL
);
GO

-- Creating table 'Manufacturers'
CREATE TABLE [dbo].[Manufacturers] (
    [manufID] int IDENTITY(1,1) NOT NULL,
    [manufname] varchar(50)  NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [productID] int IDENTITY(1,1) NOT NULL,
    [sub_catID] int  NOT NULL,
    [SUPPLIERID] int  NOT NULL,
    [manufID] int  NOT NULL,
    [prodname] varchar(3000)  NOT NULL,
    [prodimage] varchar(8000)  NULL,
    [price] decimal(8,2)  NOT NULL,
    [series] varchar(50)  NOT NULL,
    [model] varchar(200)  NOT NULL,
    [modelyear] int  NOT NULL,
    [model_info] varchar(8000)  NULL,
    [techspecs] varchar(8000)  NULL
);
GO

-- Creating table 'PROJECTs'
CREATE TABLE [dbo].[PROJECTs] (
    [PROJECT_ID] int  NOT NULL,
    [PROJECT_LOCATION] nchar(50)  NOT NULL,
    [PROJECT_NAME] nchar(50)  NULL,
    [CUSTOMERID] int  NOT NULL
);
GO

-- Creating table 'Subcats'
CREATE TABLE [dbo].[Subcats] (
    [sub_catID] int IDENTITY(1,1) NOT NULL,
    [sub_catname] varchar(50)  NOT NULL,
    [CategoryID] int  NULL
);
GO

-- Creating table 'SUPPLIERs'
CREATE TABLE [dbo].[SUPPLIERs] (
    [SUPPLIERID] int  NOT NULL,
    [USERNAME] nchar(50)  NOT NULL,
    [PASSWORD] nchar(50)  NOT NULL,
    [FULLNAME] nchar(50)  NOT NULL,
    [PICTURE] nchar(150)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [CUSTOMERID] in table 'CUSTOMERs'
ALTER TABLE [dbo].[CUSTOMERs]
ADD CONSTRAINT [PK_CUSTOMERs]
    PRIMARY KEY CLUSTERED ([CUSTOMERID] ASC);
GO

-- Creating primary key on [manufID] in table 'Manufacturers'
ALTER TABLE [dbo].[Manufacturers]
ADD CONSTRAINT [PK_Manufacturers]
    PRIMARY KEY CLUSTERED ([manufID] ASC);
GO

-- Creating primary key on [productID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([productID] ASC);
GO

-- Creating primary key on [PROJECT_ID] in table 'PROJECTs'
ALTER TABLE [dbo].[PROJECTs]
ADD CONSTRAINT [PK_PROJECTs]
    PRIMARY KEY CLUSTERED ([PROJECT_ID] ASC);
GO

-- Creating primary key on [sub_catID] in table 'Subcats'
ALTER TABLE [dbo].[Subcats]
ADD CONSTRAINT [PK_Subcats]
    PRIMARY KEY CLUSTERED ([sub_catID] ASC);
GO

-- Creating primary key on [SUPPLIERID] in table 'SUPPLIERs'
ALTER TABLE [dbo].[SUPPLIERs]
ADD CONSTRAINT [PK_SUPPLIERs]
    PRIMARY KEY CLUSTERED ([SUPPLIERID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryID] in table 'Subcats'
ALTER TABLE [dbo].[Subcats]
ADD CONSTRAINT [FK__Subcat__Category__2C3393D0]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Categories]
        ([CategoryId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Subcat__Category__2C3393D0'
CREATE INDEX [IX_FK__Subcat__Category__2C3393D0]
ON [dbo].[Subcats]
    ([CategoryID]);
GO

-- Creating foreign key on [manufID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK__Product__manufID__32E0915F]
    FOREIGN KEY ([manufID])
    REFERENCES [dbo].[Manufacturers]
        ([manufID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Product__manufID__32E0915F'
CREATE INDEX [IX_FK__Product__manufID__32E0915F]
ON [dbo].[Products]
    ([manufID]);
GO

-- Creating foreign key on [sub_catID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK__Product__sub_cat__30F848ED]
    FOREIGN KEY ([sub_catID])
    REFERENCES [dbo].[Subcats]
        ([sub_catID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Product__sub_cat__30F848ED'
CREATE INDEX [IX_FK__Product__sub_cat__30F848ED]
ON [dbo].[Products]
    ([sub_catID]);
GO

-- Creating foreign key on [SUPPLIERID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK__Product__SUPPLIE__31EC6D26]
    FOREIGN KEY ([SUPPLIERID])
    REFERENCES [dbo].[SUPPLIERs]
        ([SUPPLIERID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Product__SUPPLIE__31EC6D26'
CREATE INDEX [IX_FK__Product__SUPPLIE__31EC6D26]
ON [dbo].[Products]
    ([SUPPLIERID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
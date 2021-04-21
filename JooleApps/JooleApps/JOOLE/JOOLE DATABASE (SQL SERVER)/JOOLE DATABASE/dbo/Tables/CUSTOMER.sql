﻿CREATE TABLE [dbo].[CUSTOMER] (
    [CUSTOMERID] INT        NOT NULL,
    [USERNAME]   NCHAR (50) NOT NULL,
    [PASSWORD]   NCHAR (50) NOT NULL,
    [FULLNAME]   NCHAR (50) NOT NULL,
    [PICTURE]    NCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([CUSTOMERID] ASC)
);

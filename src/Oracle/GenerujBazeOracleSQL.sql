IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Wlasciciel]') AND type in (N'U'))
    DROP TABLE [dbo].[Wlasciciel]
GO
CREATE TABLE [dbo].[Wlasciciel] (
[Imie] char(10)  NOT NULL  
, [Nazwisko] char(10)  NOT NULL  
, [IdWlasciciela] smallint  NOT NULL  
)
GO

ALTER TABLE [dbo].[Wlasciciel] ADD CONSTRAINT [Wlasciciel_PK] PRIMARY KEY CLUSTERED (
[IdWlasciciela]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PapierWartosciowy]') AND type in (N'U'))
    DROP TABLE [dbo].[PapierWartosciowy]
GO
CREATE TABLE [dbo].[PapierWartosciowy] (
[Symbol] char(10)  NOT NULL  
, [AktualnaWartosc] decimal(10,2)  NOT NULL  
, [IloscWydanychWalorow] smallint  NOT NULL  
)
GO

ALTER TABLE [dbo].[PapierWartosciowy] ADD CONSTRAINT [PapierWartosciowy_PK] PRIMARY KEY CLUSTERED (
[Symbol]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posiadacze]') AND type in (N'U'))
    DROP TABLE [dbo].[Posiadacze]
GO
CREATE TABLE [dbo].[Posiadacze] (
[IdWlasciciela] smallint  NOT NULL  
, [Symbol] char(10)  NOT NULL  
, [IloscKupionychWalorow] smallint  NOT NULL  
)
GO

ALTER TABLE [dbo].[Posiadacze] ADD CONSTRAINT [Posiadacze_PK] PRIMARY KEY CLUSTERED (
[IdWlasciciela]
, [Symbol]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Wymiana]') AND type in (N'U'))
    DROP TABLE [dbo].[Wymiana]
GO
CREATE TABLE [dbo].[Wymiana] (
[IdSprzedawcy] smallint  NOT NULL  
, [IdKupujacego] smallint  NOT NULL  
, [Cena] decimal(10,2)  NOT NULL  
, [Ilosc] smallint  NOT NULL  
, [Data] datetime  NOT NULL  
, [Symbol] char(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Wymiana] ADD CONSTRAINT [Wymiana_PK] PRIMARY KEY CLUSTERED (
[Data]
, [Symbol]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Surowiec]') AND type in (N'U'))
    DROP TABLE [dbo].[Surowiec]
GO
CREATE TABLE [dbo].[Surowiec] (
[Symbol] char(10)  NOT NULL  
, [Surowiec] char(10)  NULL  
)
GO

ALTER TABLE [dbo].[Surowiec] ADD CONSTRAINT [Surowiec_PK] PRIMARY KEY CLUSTERED (
[Symbol]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Akcja]') AND type in (N'U'))
    DROP TABLE [dbo].[Akcja]
GO
CREATE TABLE [dbo].[Akcja] (
[Symbol] char(10)  NOT NULL  
, [Akcja] char(10)  NULL  
)
GO

ALTER TABLE [dbo].[Akcja] ADD CONSTRAINT [Akcja_PK] PRIMARY KEY CLUSTERED (
[Symbol]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Obligacje]') AND type in (N'U'))
    DROP TABLE [dbo].[Obligacje]
GO
CREATE TABLE [dbo].[Obligacje] (
[Symbol] char(10)  NOT NULL  
, [Obligacje] char(10)  NULL  
)
GO

ALTER TABLE [dbo].[Obligacje] ADD CONSTRAINT [Obligacje_PK] PRIMARY KEY CLUSTERED (
[Symbol]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Waluty]') AND type in (N'U'))
    DROP TABLE [dbo].[Waluty]
GO
CREATE TABLE [dbo].[Waluty] (
[Symbol] char(10)  NOT NULL  
, [Waluta] char(10)  NULL  
)
GO

ALTER TABLE [dbo].[Waluty] ADD CONSTRAINT [Waluty_PK] PRIMARY KEY CLUSTERED (
[Symbol]
)
GO
GO

GO

GO

ALTER TABLE [dbo].[Posiadacze] WITH CHECK ADD CONSTRAINT [Wlasciciel_Posiadacze_FK1] FOREIGN KEY (
[IdWlasciciela]
)
REFERENCES [dbo].[Wlasciciel] (
[IdWlasciciela]
)
ALTER TABLE [dbo].[Posiadacze] WITH CHECK ADD CONSTRAINT [PW_Posiadacze_FK1] FOREIGN KEY (
[Symbol]
)
REFERENCES [dbo].[PapierWartosciowy] (
[Symbol]
)
GO

ALTER TABLE [dbo].[Wymiana] WITH CHECK ADD CONSTRAINT [Wlasciciel_Wymiana_FK1] FOREIGN KEY (
[IdSprzedawcy]
)
REFERENCES [dbo].[Wlasciciel] (
[IdWlasciciela]
)
ALTER TABLE [dbo].[Wymiana] WITH CHECK ADD CONSTRAINT [PapierWartosciowy_Wymiana_FK1] FOREIGN KEY (
[Symbol]
)
REFERENCES [dbo].[PapierWartosciowy] (
[Symbol]
)
ALTER TABLE [dbo].[Wymiana] WITH CHECK ADD CONSTRAINT [Wlasciciel_Wymiana_FK2] FOREIGN KEY (
[IdKupujacego]
)
REFERENCES [dbo].[Wlasciciel] (
[IdWlasciciela]
)
GO

ALTER TABLE [dbo].[Surowiec] WITH CHECK ADD CONSTRAINT [PapierWartosciowy_Surowiec_FK1] FOREIGN KEY (
[Symbol]
)
REFERENCES [dbo].[PapierWartosciowy] (
[Symbol]
)
GO

ALTER TABLE [dbo].[Akcja] WITH CHECK ADD CONSTRAINT [PapierWartosciowy_Akcja_FK1] FOREIGN KEY (
[Symbol]
)
REFERENCES [dbo].[PapierWartosciowy] (
[Symbol]
)
GO

ALTER TABLE [dbo].[Obligacje] WITH CHECK ADD CONSTRAINT [PW_Obligacje] FOREIGN KEY (
[Symbol]
)
REFERENCES [dbo].[PapierWartosciowy] (
[Symbol]
)
GO

ALTER TABLE [dbo].[Waluty] WITH CHECK ADD CONSTRAINT [PapierWartosciowy_Waluty_FK1] FOREIGN KEY (
[Symbol]
)
REFERENCES [dbo].[PapierWartosciowy] (
[Symbol]
)
GO


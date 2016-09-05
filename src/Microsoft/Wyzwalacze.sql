CREATE TRIGGER [dbo].[BezUjemnych] on [dbo].[PapierWartosciowy]
FOR INSERT
AS
DECLARE 
@wartosc int;
select @wartosc = AktualnaWartosc from INSERTED;
DECLARE 
@ilosc int;
select @ilosc = IloscWydanychWalorow FROM INSERTED;
IF(@wartosc <= 0 OR @ilosc <= 0)
BEGIN
	PRINT 'DANE NIE MOGA BYC UJEMNE';
END;


CREATE TRIGGER [dbo].[insert_Wlasciciel] ON Wymiana
for delete
AS
rollback;
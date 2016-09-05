--ZAKLADAMY ZE SPRZEDAJACY POSIADA WPISANY REKORD W TABELI POSIADACZE Z SYMBOLEM
ALTER PROCEDURE akcjaWYMIANY @Symbol char(3), @idSprzedajacego int, @idKupujacego int, @cena numeric(10,2), @ilosc int
AS
 declare @IleMaKupujacy int, @IleMaSprzedajacy int
BEGIN
	Select @IleMaSprzedajacy=ILOSCKUPIONYCHWALOROW from Posiadacze WHERE IDWLASCICIELA=@idSprzedajacego;
	IF @IleMaSprzedajacy >= @ilosc
	BEGIN
		INSERT INTO Wymiana (Data, Symbol, IdSprzedawcy, IdKupujacego, Cena, Ilosc)
		VALUES (SYSDATETIME(), @Symbol, @idSprzedajacego, @idKupujacego, @cena, @ilosc);
		UPDATE POSIADACZE SET ILOSCKUPIONYCHWALOROW=(@IleMaSprzedajacy - @ilosc) where IDWLASCICIELA = @idSprzedajacego and SYMBOL = @Symbol;
		
		if EXISTS(SELECT ILOSCKUPIONYCHWALOROW from Posiadacze WHERE IDWLASCICIELA=@idKupujacego and Symbol = @Symbol)
		BEGIN
			SELECT @IleMaKupujacy = ILOSCKUPIONYCHWALOROW from Posiadacze WHERE IDWLASCICIELA=@idKupujacego;
			UPDATE POSIADACZE SET ILOSCKUPIONYCHWALOROW+=@ilosc where IDWLASCICIELA = @idKupujacego and SYMBOL = @Symbol;
		END
		ELSE
			INSERT INTO POSIADACZE (idWlasciciela, Symbol, ILOSCKUPIONYCHWALOROW) VALUES (@idKupujacego, @Symbol, @ilosc);
		PRINT 'TRANSFER DONE';
	END
	ELSE
		PRINT 'Brak wystarczajacej ilosci walorow. Transfer przerwany.';
END;

EXEC akcjaWYMIANY 'KGH', 1, 3, 160, 100;

GO
CREATE PROCEDURE dodajAkcje @Symbol char(3), @Nazwa varchar(10), @AktualnaWartosc int, @IloscWalorow int
AS
DECLARE @info varchar(64);
BEGIN
	if not exists (SELECT 1 FROM PAPIERWARTOSCIOWY WHERE Symbol = @symbol)
		BEGIN
			insert into PapierWartosciowy (Symbol, AktualnaWartosc, ILOSCWYDANYCHWALOROW) values (@Symbol, @AktualnaWartosc, @iloscWalorow);
			insert into Akcja (Symbol, Akcja) values (@Symbol, @Nazwa);
			select @info = 'Akcja dodana';
		END
	ELSE
		select @info = 'Akcja o symbolu:"' + @Symbol + '" istnieje. Procedura przerwana';
	Print @info;
END;


EXEC dodajAkcje 'KOF', 'KOFOL', 50, 200000;
GO


CREATE PROCEDURE dodajWlasciciela @Imie char(10), @Nazwisko char(10)
AS
BEGIN
	insert into Wlasciciel(imie, nazwisko) values (@Imie, @nazwisko);
END;

EXEC dodajWlasciciela 'Amadeusz', 'Mocarz';

GO
ALTER PROCEDURE incAkcje @oProcent int
AS
DECLARE
@SYMBOL CHAR(3);
DECLARE
@Procent decimal(4,2) = 1 + @oProcent/100.0;
BEGIN
	DECLARE CURSORAKCJE CURSOR FOR SELECT SYMBOL FROM AKCJA;
	OPEN CURSORAKCJE;
	FETCH NEXT FROM CURSORAKCJE INTO @SYMBOL;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE PAPIERWARTOSCIOWY SET AKTUALNAWARTOSC *= @Procent where SYMBOL = @SYMBOL;
		Print 'Zwiekszono:' + @Symbol +' o ' + cast(@procent as varchar) + '%';
		FETCH NEXT FROM CURSORAKCJE INTO @SYMBOL;
	END;
	CLOSE CURSORAKCJE;
	DEALLOCATE CURSORAKCJE;
END;

EXEC incAkcje 15;

Select * from PAPIERWARTOSCIOWY;
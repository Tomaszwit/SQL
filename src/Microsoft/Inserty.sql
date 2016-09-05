---inserty do WLASCICIELA

INSERT INTO WLASCICIEL (IdWlasciciela, Imie, Nazwisko)
VALUES (0, 'Tomasz', 'Witkowski');

INSERT INTO WLASCICIEL (IdWlasciciela, Imie, Nazwisko)
VALUES (1, 'Bill', 'Gates');

INSERT INTO WLASCICIEL (IdWlasciciela, Imie, Nazwisko)
VALUES (2, 'Jan', 'Madry');

INSERT INTO WLASCICIEL (IdWlasciciela, Imie, Nazwisko)
VALUES (3, 'Grzegorz', 'Grozny');

--- inserty do PapierWartosciowy - WIG20
INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('ALR',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('ACP',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('BZW',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('CCC',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('CPS',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('ENA',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('ENG',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('EUR',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('KGH',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('LPP',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('MBK',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('OPL',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('PEO',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('PGE',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('PGN',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('PKN',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('PKO',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('PZU',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('SNS',10,10000);

INSERT INTO PapierWartosciowy (Symbol, AktualnaWartosc, IloscWydanychWalorow)
VALUES ('TPE',10,10000);

--- Inserty do Posiadacze
INSERT INTO Posiadacze (IDWLASCICIELA, SYMBOL, ILOSCKUPIONYCHWALOROW)
VALUES (0,'EUR',10000);

INSERT INTO Posiadacze (IDWLASCICIELA, SYMBOL, ILOSCKUPIONYCHWALOROW)
VALUES (1,'KGH',10000);

INSERT INTO Posiadacze (IDWLASCICIELA, SYMBOL, ILOSCKUPIONYCHWALOROW)
VALUES (2,'BZW',100);

INSERT INTO Posiadacze (IDWLASCICIELA, SYMBOL, ILOSCKUPIONYCHWALOROW)
VALUES (2,'PZU',350);

INSERT INTO Posiadacze (IDWLASCICIELA, SYMBOL, ILOSCKUPIONYCHWALOROW)
VALUES (2,'PKO',220);

INSERT INTO Posiadacze (IDWLASCICIELA, SYMBOL, ILOSCKUPIONYCHWALOROW)
VALUES (3,'PKN',5000);

INSERT INTO Posiadacze (IDWLASCICIELA, SYMBOL, ILOSCKUPIONYCHWALOROW)
VALUES (3,'TPE',5000);

-- Ustawienie rodzaju papieru wartosciowego
INSERT INTO Akcja (Symbol, Akcja) VALUES ('ALR','ALIOR');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('ACP','ASSECOPOL');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('BZW','BZWBK');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('CCC','CCC');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('CPS','CYFRPLSAT');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('ENA','ENEA');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('ENG','ENERGA');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('EUR','EUROCASH');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('KGH','KGHM');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('LPP','LPP');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('MBK','MBANK');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('OPL','ORANGEPL');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('PEO','PEKAO');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('PGE','PGE');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('PKN','PKNORLEN');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('PKO','PKOBP');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('PZU','PZU');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('SNS','SYNTHOS');
INSERT INTO Akcja (Symbol, Akcja) VALUES ('TPE','TAURONPE');








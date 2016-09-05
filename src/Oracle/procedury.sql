CREATE OR REPLACE PROCEDURE SHOWUDZIALOWCY (SYMBOL VARCHAR2, MinUdzial int)  
AS
CURSOR udzialowiec IS
  Select Imie, Nazwisko, PapierWartosciowy.Symbol, (iloscKupionychWalorow/iloscWydanychwalorow*100) as Udzial
  from Wlasciciel, Posiadacze, PapierWartosciowy
  WHERE Posiadacze.Symbol = SYMBOL and
      Posiadacze.Symbol = PapierWartosciowy.Symbol and
      Posiadacze.idWlasciciela = Wlasciciel.idWlasciciela and
      Udzial > minUdzial;
v_wlasciciel udzialowiec%rowtype;
BEGIN
  dbms_output.put_line('Udzialowcy ' || SYMBOL || ' o minimalnym udziale ' || MinUdzial);
  OPEN UDZIALOWIEC;
  LOOP
    FETCH UDZIALOWIEC INTO v_wlasciciel;
    dbms_output.put_line(SYMBOL || ':' ||v_wlasciciel.Udzial || '% posiada:' || v_wlasciciel.imie || ' ' || v_wlasciciel.nazwisko);
    EXIT WHEN UDZIALOWIEC%NotFound;
  END LOOP;
END;

--tranzakcje na dzis
CREATE OR REPLACE PROCEDURE SHOWTODAYTRANSACTIONS
AS
CURSOR OBROTY IS
  Select Wymiana.symbol, AktualnaWartosc, sum(Wymiana.Ilosc) as Obrotow
  from Wymiana, papierwartosciowy
  where Data = SYSDATE and
  PapierWartosciowy.Symbol = Wymiana.Symbol
  group by Wymiana.Symbol, Papierwartosciowy.aktualnawartosc
  order by Obrotow desc;
  v_obrotow OBROTY%rowtype;
BEGIN
  OPEN OBROTY;
  LOOP
    FETCH OBROTY INTO V_obrotow;
    dbms_output.put_line(v_obrotow.symbol || ' ' || v_obrotow.Obrotow || ' ' || v_obrotow.AktualnaWartosc || 'pln');
    EXIT WHEN Obroty%NotFound;
  END LOOP;
END;
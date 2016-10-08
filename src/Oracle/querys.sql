1. //najczesciej wystepujacy symbol w tabeli wymiana
select symbol, count(*) as Transakcji
from wymiana
group by symbol
HAVING  count(*) = (
                    SELECT MAX(Tranzakcji) FROM(
                                        SELECT symbol, count(*) Transakcji
                                        from wymiana
                                        group by symbol
                                        )
                   );

2. //Wyswietlenie udzialowców do każdej spółki

select Imie, Nazwisko, PapierWartosciowy.Symbol, (iloscKupionychWalorow/iloscWydanychwalorow*100 ||'%') as Udział
from Wlasciciel, Posiadacze, PapierWartosciowy
WHERE Posiadacze.Symbol = PapierWartosciowy.Symbol and
      Posiadacze.idWlasciciela = Wlasciciel.idWlasciciela
Order by papierwartosciowy.symbol;


3. //Wyświetlenie kto najwięcej zainwestował na calej giełdzie

Select wlasciciel.idwlasciciela as Identyfikator, Wlasciciel.imie, wlasciciel.nazwisko, sum(iloscKupionychWalorow*PapierWartosciowy.AktualnaWartosc) as "Zainwestowana w PLN"
from Posiadacze, PapierWartosciowy, Wlasciciel
where Posiadacze.idwlasciciela = wlasciciel.idwlasciciela and
Posiadacze.Symbol = PapierWartosciowy.Symbol
group by wlasciciel.idwlasciciela, wlasciciel.imie, wlasciciel.nazwisko;

4. //Wyświetlanie informacji o inwestorach

Select idWlasciciela as Identyfikator, Imie, Nazwisko
from wlasciciel;


5. //Poszukiwanie powtarzających sie unikatowych identyfikatorów Inwestorów

select idWlasciciela
from Wlasciciel
having count(idWlasciciela) > 1
group by idwlasciciela;



6. //notowanie wig 20 czyli spólek które są wpisane do tabeli PapierWartosciowy

select (Floor(avg(aktualnawartosc)) || ' PLN') as "Wig 20"
from papierwartosciowy;

7. // transakcji na dany dzień dla każdej akcji

Select Wymiana.symbol, AktualnaWartosc, sum(Wymiana.Ilosc) as Obrotów
from Wymiana, papierwartosciowy
where Data between '15/06/22' and '15/06/23' and
PapierWartosciowy.Symbol = Wymiana.Symbol
group by Wymiana.Symbol, Papierwartosciowy.aktualnawartosc
order by Obrotow desc;

8. //Propozycja wszystkich akcji jakie sa na gieldzie

Select Akcja, Akcja.Symbol, (AktualnaWartosc || ' PLN') as Wartość
from PapierWartosciowy, akcja
where PapierWartosciowy.Symbol = Akcja.Symbol;

9. //Sprawdzanie tranzakcji inwestora

Select Wymiana.symbol, ilosc, wymiana.data
from Wymiana, papierwartosciowy
where PapierWartosciowy.Symbol = Wymiana.Symbol and
Data between '15/06/22' and '15/06/23' and
(Wymiana.idkupujacego = 0 or wymiana.idsprzedawcy = 0);






select ID,
       PROGETTO,
       ATTIVITA,
       DATA_INIZIO,
       DATA_FINE,
       STATO,
       ASSEGNATO_A,
       COSTO,
       BUDGET
  from D02_ATTIVITA;
  
  select A.PROGETTO,
       A.ATTIVITA,
       A.DATA_INIZIO,
       A.DATA_FINE,
       A.DATA_FINE – A.DATA_INIZIO as GIORNI
  from D02_ATTIVITA A;
  
  select A.*
  from D02_ATTIVITA A
 where PROGETTO = 'Sito Web pubblico';

select A.*
  from D02_ATTIVITA A
 where ATTIVITA like ‘Co%';

select A.*
  from D02_ATTIVITA A
 where ATTIVITA like ‘%to';

select A.*
  from D02_ATTIVITA A
 where ATTIVITA like ‘%comp%';
 
 select A.*
  from D02_ATTIVITA A
 where BUDGET is null;

select A.*
  from D02_ATTIVITA A
 where BUDGET is not null;

select A.*
  from D02_ATTIVITA A
 where BUDGET = 500;
 
 select A.*
  from D02_ATTIVITA A
 where BUDGET <> 500;

select A.*
  from D02_ATTIVITA A
 where BUDGET <> 500
   and BUDGET is null;

select A.*
  from D02_ATTIVITA A
 where NVL(BUDGET,0) <> 500;

select A.*
  from D02_ATTIVITA A
 where NVL(BUDGET,0)<> 500
   and BUDGET is null;
   
 select a.*
  from d02_attivita a
 where data_inizio > date'2023-01-03';

 select a.*
  from d02_attivita a
 where data_inizio > to_date('01/03/2023','DD/MM/YYYY');

 select a.*
  from d02_attivita a
 where data_inizio > to_date('01/03/2023 13:00:00','DD/MM/YYYY hh24:MI:SS');

select a.data_inizio,
       a.data_inizio + 1 giorno_successivo,
       a.data_fine - a.data_inizio giorni_attivita
  from d02_attivita a;

select classifica,
       nome,
       nazione,
       settore,
       revenue_2020,
       anno_inizio
  from d03_classifica_ft;
  
select classifica,
       nome,
       nazione,
       settore,
       revenue_2020,
       anno_inizio
  from d03_classifica_ft
 where nazione = 'Italy';
 
  select classifica,
         nome,
         nazione,
         settore,
         revenue_2020,
         anno_inizio
    from d03_classifica_ft
   where nazione = 'Italy'
order by classifica
   fetch next 3 rows only; 

   select nazione,
          count(*) as numero
     from d03_classifica_ft
 group by nazione;
 
    select nazione,
          count(*) as numero,
          sum(revenue_2020) as tot_revenue_2020
     from d03_classifica_ft
 group by nazione;
  
   select count(*) as numero,
          count(web) as numero_web,
          count(distinct nazione) numero_nazioni
     from d03_classifica_ft;


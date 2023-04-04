select 
       dipendente,
       tariffa,
       cliente,
       commessa,
       data,
       ore,
       importo
  from d05_attivita_vw
  
  select 
       sum(ore) tot_ore,
       sum(importo)importo
  from d05_attivita_vw

select dipendente,
           sum(ore) tot_ore,
           sum(importo)importo
      from d05_attivita_vw
  group by dipendente

select dipendente,
           cliente,
           sum(ore) tot_ore,
           sum(importo)importo
      from d05_attivita_vw
  group by dipendente,
           cliente

select 
       data,
       to_char(data,'YYYY')    anno,
       to_char(data,'MM')      mese,
       to_char(data,'MONTH')   mese_desc,
       to_char(data,'YYYY-MM') annomese,
       to_char(data,'Q')       trimestre,
       to_char(data,'YYYY-Q')  annotrimestre
  from d05_attivita_vw
  
  select to_char(data,'YYYY')anno,
           sum(ore) tot_ore,
           sum(importo)importo
      from d05_attivita_vw
  group by to_char(data,'YYYY')

select to_char(data,'YYYY-MM')annomese,
           cliente,
           sum(ore) tot_ore,
           sum(importo)importo
      from d05_attivita_vw
  group by to_char(data,'YYYY-MM'),
           cliente

update d08_vendita set quantita = round(quantita,2)
update d08_prodotto set prezzo_vendita = round(prezzo_vendita,2)
update d08_prodotto set prezzo_acquisto = round(prezzo_acquisto,2)

select sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw

select zona,
       sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw
 group by zona

select cliente,
       sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw
  group by cliente
  
select zona,
       cliente,
       sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw
 group by zona,
          cliente  



select null zona,
       null cliente,
       sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw
 union all
select zona,
       null cliente,
       sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw
 group by zona
 union all
select null zona,
       cliente,
       sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw
 group by cliente
 union all
select zona,
       cliente,
       sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw
 group by zona,
          cliente 

select zona,
       cliente,
       sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw
 group by 
     grouping sets(
       (zona,cliente),
       (zona),
       (cliente),
       ()
     )

select zona,
       cliente,
       grouping(zona)raggr_zona,
       grouping(cliente)raggr_cliente,
       grouping(zona)*grouping(cliente)raggr_zona_cliente,
       sum(quantita) quantita, 
       sum(valore) valore
  from d08_vendita_vw
 group by 
     grouping sets(
       (zona,cliente),
       (zona),
       (cliente),
       ()
     )
order by zona,cliente

select zona,
       cliente,
       grouping(zona)raggr_zona,
       grouping(cliente)raggr_cliente,
       grouping(zona)*grouping(cliente)raggr_zona_cliente,
       grouping_id(zona,cliente) liv_zona_cliente,      
       sum(quantita) quantita, 
       sum(valore) valore,
       case 
          when sum(quantita)<> 0 
          then round(sum(valore)/sum(quantita),2) 
          else 0 
       end prezzo_medio
  from d08_vendita_vw
 group by 
     grouping sets(
       (zona,cliente),
       (zona),
       (cliente),
       ()
     )
order by zona,cliente

select zona,
       cliente,
       grouping(zona)                   raggr_zona,
       grouping(cliente)                raggr_cliente,
       grouping(zona)*grouping(cliente) raggr_zona_cliente,
       grouping_id(zona,cliente)        liv_zona_cliente,
       sum(quantita) quantita, 
       sum(valore) valore,
       case 
          when sum(quantita)<> 0 
          then round(sum(valore)/sum(quantita),2) 
          else 0 
       end prezzo_medio
  from d08_vendita_vw
 group by 
     cube(zona,cliente)
order by zona,cliente

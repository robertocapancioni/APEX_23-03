create or replace view d14_prodotto_vw as
select 
       p.id,
      tp.tipo_prodotto,
       p.prodotto,
       p.prezzo_acquisto,
       p.prezzo_vendita
  from d14_prodotto p
  join d14_tipo_prodotto tp
    on p.tipo_prodotto_id = tp.id
create or replace view d08_prodotto_vw as
select 
       p.id,
      tp.tipo_prodotto,
       p.prodotto,
       p.prezzo_acquisto,
       p.prezzo_vendita
  from d08_prodotto p
  join d08_tipo_prodotto tp
    on p.tipo_prodotto_id = tp.id

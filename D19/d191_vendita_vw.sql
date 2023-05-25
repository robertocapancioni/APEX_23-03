create or replace view d191_vendita_vw as
select v.id,
       v.cliente_id,
       c.cliente,
       c.zona_cliente,
       v.prodotto_id,
       p.prodotto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       v.data,
       v.quantita,
       v.importo
  from d191_vendita v
  join d191_cliente c on v.cliente_id = c.id 
  join d191_prodotto p on v.prodotto_id = p.id
  join d191_tipo_prodotto tp on p.tipo_prodotto_id = tp.id;
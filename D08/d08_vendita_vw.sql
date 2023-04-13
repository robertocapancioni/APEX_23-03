
create or replace view d08_vendita_vw as
select v.id,
       v.cliente_id,
       c.cliente,
       v.prodotto_id,
       p.prodotto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       v.data,
       v.quantita
  from d08_vendita v
  join d08_cliente c on v.cliente_id = c.id
  join d08_prodotto p on v.prodotto_id = p.id
  join d08_tipo_prodotto tp on p.tipo_prodotto_id = tp.id

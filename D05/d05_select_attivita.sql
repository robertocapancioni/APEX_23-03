select 
       a.id,
       a.dipendente_id,
       d.dipendente,
       d.tariffa,
       a.cliente_id,
       c.cliente,
       a.commessa_id,
       m.commessa,
       a.data,
       a.ore,
       d.tariffa * a.ore importo
  from d05_attivita a
  join d05_dipendente d on a.dipendente_id = d.id
  join d05_cliente    c on a.cliente_id    = c.id
  join d05_commessa   m on a.commessa_id   = m.id
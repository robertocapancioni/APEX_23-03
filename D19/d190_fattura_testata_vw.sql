create or replace view d190_fattura_testata_vw as
select ft.id,
       ft.cliente_id,
       ft.anno,
       ft.numero,
       ft.descrizione,
       ft.data,
       c.codice_cliente,
       c.ragione_sociale,
       c.piva,
       c.indirizzo,
       c.codice_sdi
  from d190_fattura_testata ft
  join d190_cliente c on ft.cliente_id = c.id;

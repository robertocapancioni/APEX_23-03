select *
  from d12_fattura_testata;

select json_object(*) testata
  from d12_fattura_testata;

select json_object(
                   key 'ID'          is id,
                   key 'CLIENTE_ID'  is cliente_id,
                   key 'ANNO'        is anno,
                   key 'NUMERO'      is numero,
                   key 'DESCRIZIONE' is descrizione,
                   key 'DATA'        is data
                    ) testata
  from d12_fattura_testata;
  
select json_object(
                   key 'ID'              is t.id,
                   key 'CLIENTE_ID'      is t.cliente_id,
                   key 'RAGIONE_SOCIALE' is c.ragione_sociale,
                   key 'ANNO'            is t.anno,
                   key 'NUMERO'          is t.numero,
                   key 'DESCRIZIONE'     is t.descrizione,
                   key 'DATA'            is t.data
                    ) testata
  from d12_fattura_testata t
  join d12_cliente c on t.cliente_id = c.id;

select *
  from d12_fattura_testata;

select json_object(*) testata
  from d12_fattura_testata;

select json_object(
                   key 'ID'          value id,
                   key 'CLIENTE_ID'  value cliente_id,
                   key 'ANNO'        value anno,
                   key 'NUMERO'      value numero,
                   key 'DESCRIZIONE' value descrizione,
                   key 'DATA'        value data
                    ) testata
  from d12_fattura_testata;

select json_object(
                   'ID'          value id,
                   'CLIENTE_ID'  value cliente_id,
                   'ANNO'        value anno,
                   'NUMERO'      value numero,
                   'DESCRIZIONE' value descrizione,
                   'DATA'        value data
                    ) testata
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
                   'ID'         is  id,
                   'CLIENTE_ID' is  cliente_id,
                   'ANNO'       is  anno,
                   'NUMERO'     is  numero,
                   'DESCRIZIONE'is  descrizione,
                   'DATA'       is  data
                    ) testata
  from d12_fattura_testata;

  select json_object(
                     id,
                     cliente_id,
                     anno,
                     numero,
                     descrizione,
                     data
                    ) testata
  from d12_fattura_testata;


select json_object(
                   key 'ID'          value id,
                   key 'CLIENTE_ID'  value cliente_id,
                   key 'ANNO'        value anno,
                   key 'NUMERO'      value numero,
                   key 'DESCRIZIONE' value descrizione ,
                   key 'DATA'        value data ,
                   key 'MIO_NULLO'   value null
                   null on null ) testata
  from d12_fattura_testata;

  select json_object(
                   key 'ID'          value id,
                   key 'CLIENTE_ID'  value cliente_id,
                   key 'ANNO'        value anno,
                   key 'NUMERO'      value numero,
                   key 'DESCRIZIONE' value descrizione ,
                   key 'DATA'        value data ,
                   key 'MIO_NULLO'   value null
                   absent on null ) testata
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

select * 
  from d12_fattura_dettaglio;

select json_object(*) righe_dettaglio 
  from d12_fattura_dettaglio;

select  
json_arrayagg(riga) riga
from d12_fattura_dettaglio;

select  
json_arrayagg(riga 
              order by riga
              ) riga
from d12_fattura_dettaglio;

select  
json_arrayagg(riga 
              order by riga
              returning clob) riga
from d12_fattura_dettaglio;


select  
FATTURA_TESTATA_ID,
json_arrayagg(riga 
              order by riga
              returning clob) riga
from d12_fattura_dettaglio
group by FATTURA_TESTATA_ID;

select  
FATTURA_TESTATA_ID,
json_arrayagg(json_object(riga) 
              order by riga
              returning clob) riga
from d12_fattura_dettaglio
group by FATTURA_TESTATA_ID;

select  
FATTURA_TESTATA_ID,
json_arrayagg(json_object(id,
                          fattura_testata_id,
                          riga,
                          key 'DESCR' is descrizione, 
                          quantita,
                        importo 
                          ) 
              order by riga
              returning clob) riga
from d12_fattura_dettaglio
group by FATTURA_TESTATA_ID;

select json_object(
                   t.id,
                   t.cliente_id,
                   c.ragione_sociale,
                   t.anno,
                   t.numero,
                   t.descrizione,
                   t.data,
                   'righe'           is (
                                            select  
                                            json_arrayagg(json_object(d.id,
                                                                      d.fattura_testata_id,
                                                                      d.riga,
                                                                      d.descrizione, 
                                                                      d.quantita,
                                                                      d.importo 
                                                                      ) 
                                                        order by riga
                                                        returning clob) riga
                                            from d12_fattura_dettaglio d
                                            where d.fattura_testata_id = t.id)
                                         ) fattura
  from d12_fattura_testata t
  join d12_cliente c on t.cliente_id = c.id;


create or replace view d12_fattura_json_vw as
select t.id,
       json_object(
                   t.id,
                   t.cliente_id,
                   c.ragione_sociale,
                   t.anno,
                   t.numero,
                   t.descrizione,
                   t.data,
                   'righe'           is (
                                            select  
                                            json_arrayagg(json_object(d.id,
                                                                      d.fattura_testata_id,
                                                                      d.riga,
                                                                      d.descrizione, 
                                                                      d.quantita,
                                                                      d.importo 
                                                                      ) 
                                                        order by riga
                                                        returning clob) riga
                                            from d12_fattura_dettaglio d
                                            where d.fattura_testata_id = t.id)
                                         ) fattura
  from d12_fattura_testata t
  join d12_cliente c on t.cliente_id = c.id;

select * from d12_fattura_json_vw;

select * from json_table(
                    (
                    select fattura 
                      from d12_fattura_json_vw
                     where id =1
                    ),
                    '$[*]'
                        columns(
                            ragione_sociale VARCHAR2(400) PATH '$.ragione_sociale',
                            anno varchar2(10) PATH '$.anno',
                            numero varchar2(10) PATH '$.numero',
                            nested PATH '$.righe[*]'
                            columns(
                                 riga varchar2(10) PATH '$.riga',
                                 descrizione varchar2(100) PATH '$.descrizione',
                                 quantita number PATH '$.quantita',
                                 importo number PATH '$.importo'
                            )
                        )
                 );

https://docs.oracle.com/en/database/oracle/oracle-database/21/adjsn/json-path-expressions.html





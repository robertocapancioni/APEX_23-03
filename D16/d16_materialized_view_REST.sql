create or replace view d16_vendita_vw as
select id
      ,data
      ,prodotto
      ,cliente
      ,zona_cliente
      ,quantita
      ,importo
 from json_table(
apex_web_service.make_rest_request(p_url => 'https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/d16_vendita/?q={"importo": {"$and": [{"$gt": 100},{"$lt":300}]}}',
                                                         p_http_method => 'GET'
                                                         ),
                            '$.items[*]' columns( 
                                                 id              number        path '$.id'
                                                ,data            date          path '$.data' 
                                                ,prodotto        varchar2(100) path '$.prodotto'
                                                ,cliente         varchar2(100) path '$.cliente'
                                                ,zona_cliente    varchar2(100) path '$.zona_cliente'
                                                ,quantita        number        path '$.quantita'
                                                ,importo         number        path '$.importo'
                                                )
);

select * from d16_vendita_vw


create materialized view d16_vendita_mvw 
   refresh start with sysdate
   next sysdate + 1/24 
   as 
   select id
      ,data
      ,prodotto
      ,cliente
      ,zona_cliente
      ,quantita
      ,importo
 from json_table(
apex_web_service.make_rest_request(p_url => 'https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/d16_vendita/',
                                                         p_http_method => 'GET'
                                                         ),
                            '$.items[*]' columns( 
                                                 id              number        path '$.id'
                                                ,data            date          path '$.data' 
                                                ,prodotto        varchar2(100) path '$.prodotto'
                                                ,cliente         varchar2(100) path '$.cliente'
                                                ,zona_cliente    varchar2(100) path '$.zona_cliente'
                                                ,quantita        number        path '$.quantita'
                                                ,importo         number        path '$.importo'
                                                )
);

-- documentazione apex_web_service.make_rest_request
https://docs.oracle.com/en/database/oracle/apex/23.1/aeapi/MAKE_REST_REQUEST-Function.html

select 
apex_web_service.make_rest_request(
    p_url => 'https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17_vendita/',
    p_http_method => 'GET'
   ) vendita
from dual;


select * 
  from json_table(
apex_web_service.make_rest_request(
    p_url => 'https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17_vendita/',
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


https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17_vendita/?limit=200

https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17_vendita/?offset=50

https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17_vendita/?q={"Prodotto":{"$instr":"cotto"}}

https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17_vendita/?q={"importo":{"$lte":100}}

https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17_vendita/?q={"data":{"$lte":{"$date":"2021-03-08T23:59:59Z"}}}

https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17_vendita/?q={"importo": {"$and": [{"$gt": 100},{"$lt":300}]}}

-- documentazione filtri
https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/21.4/aelig/developing-REST-applications.html#GUID-091748F8-3D14-402B-9310-25E6A9116B47







select 
apex_web_service.make_rest_request(
    p_url => 'https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17/vendita/',
    p_http_method => 'GET'
   ) vendita
from dual;


select col001, col002, col003, col004, col005, col006, col007
from table(apex_data_parser.parse
(  p_content => apex_web_service.make_rest_request_b
    ('https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17/vendita_csv/', 'GET')
  , p_file_name => 'big-mac-source-data.csv'
  , p_skip_rows => 1
));


select to_number(col001) id, 
       to_date(substr(col002,1,10),'yyyy-mm-dd')data, 
       col003 prodotto, 
       col004 cliente, 
       col005 zona_cliente, 
       to_number(replace(col006,'.',','))quantita, 
       to_number(replace(col007,'.',',')) importo
from table(apex_data_parser.parse
(  p_content => apex_web_service.make_rest_request_b
    ('https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17/vendita_csv/', 'GET')
  , p_file_name => 'big-mac-source-data.csv'
  , p_skip_rows => 1
));


select 
apex_web_service.make_rest_request(
    p_url => 'https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d17/vendita_csv/',
    p_http_method => 'GET'
   ) vendita
from dual;




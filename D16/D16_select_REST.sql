select * from json_table(
APEX_WEB_SERVICE.MAKE_REST_REQUEST(p_url => 'https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d11_vendita//',
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

https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d11_vendita/?offset=50
https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d11_vendita/?q={"Prodotto":{"$instr":"cotto"}}
https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d11_vendita/?q={"importo":{"$lte":100}}
https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d11_vendita/?q={"data":{"$lte":{"$date":"2021-03-08T23:59:59Z"}}}
https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d11_vendita/?q={"importo": {"$and": [{"$gt": 100},{"$lt":300}]}}





-- documentazione filtri
https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/21.4/aelig/developing-REST-applications.html#GUID-091748F8-3D14-402B-9310-25E6A9116B47
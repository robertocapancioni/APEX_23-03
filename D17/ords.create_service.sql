

--https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/21.3/aelig/ORDS-reference.html
--begin
--    ords.enable_schema;
--end;
--/
--BEGIN
--    ords.enable_schema(
--                      p_enabled => true,
--                      p_schema => 'CED',
--                      p_url_mapping_type => 'BASE_PATH',
--                      p_url_mapping_pattern => 'api',
--                      p_auto_rest_auth => false
--    );
--
--    COMMIT;
--END;
--/


begin
ords.create_service(
      p_module_name => 'd17' ,
      p_base_path  => '/d17/',
      p_pattern =>  'vendita/' ,
      p_items_per_page => 25,
      p_source  =>  'select * from d17_vendita order by id');
commit;
end;
/
/*

ORDS.DELETE_MODULE(
   p_module_name  => 'd17');


BEGIN
    ords.define_module(
            p_module_name => 'd17' ,
            p_base_path  => '/d17/',
            p_items_per_page => 25,
            p_status => 'PUBLISHED'
    );

    COMMIT;
END;
/

BEGIN
    ords.define_template(
            p_module_name => 'd17' ,
            p_pattern =>  'vendita/' 
    );
    COMMIT;
END;
/

BEGIN
    ords.define_handler(
            p_module_name => 'd17' ,
            p_pattern =>  'vendita/', 
            p_method => 'GET',
            p_source_type => ords.source_type_collection_feed,
            p_source => 'select * from d17_vendita order by id',
            p_items_per_page => 25
    );

    COMMIT;
END;
/

BEGIN
    ords.define_template(
            p_module_name => 'd17' ,
            p_pattern =>  'vendita_csv/' 
    );
    COMMIT;
END;
/

BEGIN
    ords.define_handler(
            p_module_name => 'd17' ,
            p_pattern =>  'vendita_csv/', 
            p_method => 'GET',
            p_source_type => ords.source_type_csv_query,
            p_source => 'select * from d17_vendita order by id',
            p_items_per_page => 25
    );

    COMMIT;
END;
/
*/
begin
  ords.create_role('d17.ROLE');     
 
  ords.create_privilege(
      p_name => 'd17.PRIVILEGE',
      p_role_name => 'd17.ROLE',
      p_label => 'd17 data',
      p_description => 'Provide access to d17 data');
  commit;
end;
/

--select id,name from user_ords_privileges where name = 'd17';

begin
 ords.create_privilege_mapping(
      p_privilege_name => 'd17.PRIVILEGE',
      p_pattern => '/d17/*');     
  commit;
end;
/

--select privilege_id, name, pattern from user_ords_privilege_mappings;
begin 
 oauth.delete_client(
      p_name => 'client_d17');
 commit;
end;
/


begin 
 oauth.create_client(
      p_name => 'client_d17',
      p_grant_type => 'client_credentials',
      p_privilege_names => 'd17.PRIVILEGE',
      p_support_email =>'pippo@pippo.com');
 commit;
end;
/

--select name, client_id,client_secret from user_ords_clients where name = 'client_d17';

begin 
 oauth.grant_client_role(
     'client_d17',
     'd17.ROLE');
 commit;
end;
/



begin 
 oauth.grant_client_role(
     'client_d17',
     'oracle.dbtools.role.autorest.WKSP_MA0.d17_VENDITA');
 commit;
end;
/

--select * from user_ords_client_roles where client_name = 'client_d17';
https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/d17/vendita/
https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/oauth/token






--https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/21.1/aelig/developing-REST-applications.html#GUID-92A40ABE-115E-40CF-BFF0-DE0C1ED8786C


OAUTH2
URL token -- indirizzo web
CLIENT ID -- nome utente
CLIENT SECRET -- password


declare 
l_response clob :='';
BEGIN
    apex_web_service.oauth_authenticate_credential(
        p_token_url => 'https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/oauth/token',
        p_credential_static_id => 'client_d17');
        l_response := APEX_WEB_SERVICE.MAKE_REST_REQUEST(p_url => 'https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/d17/vendita/',
                                                         p_http_method => 'GET',
                                                         p_scheme => 'OAUTH_CLIENT_CRED');    
       htp.prn(l_response);
END;
/

	

declare 
l_response clob :='';
BEGIN
apex_web_service.oauth_authenticate(
        p_token_url => 'https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/oauth/token',
        p_client_id     => 'FaA9q1eAOs5iE3fWsydfPQ..',
        p_client_secret => 'g0IFXwO6UroE-vl3f0nqFw..');
        l_response := APEX_WEB_SERVICE.MAKE_REST_REQUEST(p_url => 'https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/d17/vendita/',
                                                         p_http_method => 'GET',
                                                         p_scheme => 'OAUTH_CLIENT_CRED');    
       htp.prn(l_response);
END;
/

select * from json_table(
q'|{"items":[{"id":1,"data":"2020-08-31T00:00:00Z","prodotto":"Prosciutto cotto","cliente":"Russo Maida","zona_cliente":"SUD","quantita":24,"importo":413.04},{"id":2,"data":"2020-11-28T00:00:00Z","prodotto":"Prosciutto cotto","cliente":"Lombardi Minervino","zona_cliente":"SUD","quantita":14,"importo":240.94},{"id":3,"data":"2021-04-17T00:00:00Z","prodotto":"Prosciutto cotto","cliente":"Esposito Marinetta","zona_cliente":"NORD","quantita":14,"importo":240.94},{"id":4,"data":"2021-06-24T00:00:00Z","prodotto":"Prosciutto cotto","cliente":"Russo Maida","zona_cliente":"SUD","quantita":29,"importo":499.09},{"id":5,"data":"2021-01-20T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Conti Marina","zona_cliente":"SUD","quantita":15,"importo":85.65},{"id":6,"data":"2021-05-03T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Martinelli Medardo","zona_cliente":"NORD","quantita":20,"importo":114.2},{"id":7,"data":"2021-07-03T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Moretti Meneo","zona_cliente":"CENTRO","quantita":26,"importo":148.46},{"id":8,"data":"2021-01-24T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Rossi Macaria","zona_cliente":"NORD","quantita":25,"importo":142.75},{"id":9,"data":"2020-09-27T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Gallo Margherita","zona_cliente":"SUD","quantita":27,"importo":155.1},{"id":10,"data":"2020-08-03T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Longo Mattia","zona_cliente":"CENTRO","quantita":13,"importo":74.23},{"id":11,"data":"2021-02-14T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Leone Maurizio","zona_cliente":"SUD","quantita":10,"importo":57.1},{"id":12,"data":"2020-12-29T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Fontana Mariella","zona_cliente":"CENTRO","quantita":22,"importo":125.62},{"id":13,"data":"2020-12-24T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Giordano Mario","zona_cliente":"NORD","quantita":25,"importo":142.75},{"id":14,"data":"2021-03-01T00:00:00Z","prodotto":"Prosciutto crudo","cliente":"Colombo Massimiliano","zona_cliente":"SUD","quantita":14,"importo":79.94},{"id":15,"data":"2020-08-08T00:00:00Z","prodotto":"Bresaola","cliente":"Moretti Meneo","zona_cliente":"CENTRO","quantita":11,"importo":65.78},{"id":16,"data":"2021-04-16T00:00:00Z","prodotto":"Bresaola","cliente":"Cassano Martino","zona_cliente":"CENTRO","quantita":28,"importo":167.44},{"id":17,"data":"2020-12-20T00:00:00Z","prodotto":"Salame","cliente":"Ferrari Mafalda","zona_cliente":"CENTRO","quantita":28,"importo":194.32},{"id":18,"data":"2020-12-12T00:00:00Z","prodotto":"Salame","cliente":"Giordano Mario","zona_cliente":"NORD","quantita":30,"importo":208.2},{"id":19,"data":"2020-07-30T00:00:00Z","prodotto":"Salame","cliente":"Gallo Margherita","zona_cliente":"SUD","quantita":27,"importo":187.38},{"id":20,"data":"2020-09-19T00:00:00Z","prodotto":"Salame","cliente":"Costa Marianna","zona_cliente":"NORD","quantita":16,"importo":111.04},{"id":21,"data":"2020-11-03T00:00:00Z","prodotto":"Salame","cliente":"Ricci Marita","zona_cliente":"CENTRO","quantita":11,"importo":76.34},{"id":22,"data":"2021-02-11T00:00:00Z","prodotto":"Mortadella","cliente":"Costa Marianna","zona_cliente":"NORD","quantita":28,"importo":44.24},{"id":23,"data":"2020-09-13T00:00:00Z","prodotto":"Mortadella","cliente":"Martinelli Medardo","zona_cliente":"NORD","quantita":19,"importo":30.02},{"id":24,"data":"2020-12-09T00:00:00Z","prodotto":"Mortadella","cliente":"Ricci Marita","zona_cliente":"CENTRO","quantita":12,"importo":18.96},{"id":25,"data":"2021-02-25T00:00:00Z","prodotto":"Mortadella","cliente":"Fontana Mariella","zona_cliente":"CENTRO","quantita":16,"importo":25.28},{"id":26,"data":"2020-12-28T00:00:00Z","prodotto":"Mortadella","cliente":"Marino Mercurio","zona_cliente":"SUD","quantita":26,"importo":41.08},{"id":27,"data":"2021-03-07T00:00:00Z","prodotto":"Mortadella","cliente":"Russo Maida","zona_cliente":"SUD","quantita":25,"importo":39.5},{"id":28,"data":"2020-08-21T00:00:00Z","prodotto":"Speck","cliente":"Conti Marina","zona_cliente":"SUD","quantita":13,"importo":95.68},{"id":29,"data":"2021-01-15T00:00:00Z","prodotto":"Speck","cliente":"Rossi Macaria","zona_cliente":"NORD","quantita":19,"importo":139.84},{"id":30,"data":"2021-02-21T00:00:00Z","prodotto":"Speck","cliente":"Lombardi Minervino","zona_cliente":"SUD","quantita":16,"importo":117.76}],"hasMore":true,"limit":30,"offset":0,"count":30,"links":[{"rel":"self","href":"https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/d12/vendita/"},{"rel":"describedby","href":"https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/metadata-catalog/d12/vendita/"},{"rel":"first","href":"https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/d12/vendita/"},{"rel":"next","href":"https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/ma0/d12/vendita/?offset=30"}]}|',
 '$.items[*]' columns( 
      id              number        path '$.id'
     ,data date path '$.data'
     ,prodotto       varchar2(100)  path '$.prodotto'
     ,cliente       varchar2(100)  path '$.cliente'
  )
 )

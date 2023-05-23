-- link documentazione
https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/21.3/aelig/ORDS-reference.html

BEGIN
 --ords.delete_module(p_module_name  => 'd18');

    ords.define_module(
            p_module_name => 'd18' ,
            p_base_path  => '/d18/',
            p_items_per_page => 25,
            p_status => 'PUBLISHED',
            p_comments =>'Modulo d18'
    );
END;
/

BEGIN
    ords.define_template(
            p_module_name => 'd18' ,
            p_pattern =>  'vendita/',
            p_comments => 'Template Vendita in d18' 
    );

END;
/

BEGIN
    ords.define_handler(
            p_module_name => 'd18' ,
            p_pattern =>  'vendita/', 
            p_method => 'GET',
            p_source_type => ords.source_type_collection_feed,
            p_source => 'select * from d18_vendita order by id',
            p_items_per_page => 25
    );
END;
/


BEGIN
     --ords.delete_role('d18.ROLE'); 
     ords.create_role('d18.ROLE'); 
END;
/

DECLARE
  l_priv_roles owa.vc_arr;
  l_priv_patterns owa.vc_arr;
  l_priv_modules owa.vc_arr;
BEGIN
  l_priv_roles(1) := 'd18.ROLE';
  
  l_priv_patterns(1) := '/d18/*';

  l_priv_modules(1) := 'd18';
  --ords.delete_privilege('d18.PRIVILEGE');
  ords.define_privilege(
    p_privilege_name     => 'd18.PRIVILEGE',
    p_roles              => l_priv_roles,
    p_patterns           => l_priv_patterns,
    P_modules            => l_priv_modules,
    p_label              => 'Privilege d18',
    p_description        => 'Gestisce dati del modulo d18'
  );
END;
/

-- link documentazione
https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/21.3/aelig/OAUTH-reference.html

begin 
 --oauth.delete_client(p_name => 'client_d18');
 oauth.create_client(
      p_name => 'client_d18',
      p_grant_type => 'client_credentials',
      p_privilege_names => 'd18.PRIVILEGE',
      p_support_email =>'d18@capancioni.com');
 end;
/

begin 
 oauth.grant_client_role(
     'client_d18',
     'd18.ROLE');
end;
/

-- verifica i ruoli
select client_name,role_name from user_ords_client_roles where client_name = 'client_d18';

-- trova client e password
select name, client_id,client_secret from user_ords_clients where name = 'client_d18';

--client_id     = 3qsw4hofosN8zif-NSeDuQ..
--client_secret = dYYr2wE3xad4xOsJh4F9Kg..

-- url per token
https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/oauth/token

-- url per modello
https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d18/vendita/


-- link documentazione
https://docs.oracle.com/en/database/oracle/apex/23.1/aeapi/APEX_WEB_SERVICE.html


declare 
l_response clob :='';
BEGIN
apex_web_service.oauth_authenticate(
        p_token_url => 'https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/oauth/token',
        p_client_id     => '3qsw4hofosN8zif-NSeDuQ..',
        p_client_secret => 'dYYr2wE3xad4xOsJh4F9Kg..');

        l_response := APEX_WEB_SERVICE.MAKE_REST_REQUEST(p_url => 'https://cnde8nae4maapcd-oramms.adb.eu-zurich-1.oraclecloudapps.com/ords/at0/d18/vendita/',
                                                         p_http_method => 'GET',
                                                         p_scheme => 'OAUTH_CLIENT_CRED');    
       htp.prn(l_response);
END;
/



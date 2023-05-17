select 
apex_web_service.make_rest_request(
    p_url => 'https://g0a16906b023bfa-odcecmi.adb.eu-frankfurt-1.oraclecloudapps.com/ords/usrx00/d16_vendita/',
    p_http_method => 'GET'
   ) vendita
from dual;

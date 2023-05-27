create or replace package d20_pkg as 
    function get_for_role(p_app_id number, p_role varchar2) return varchar2; 
    function has_user_role(p_app_id number, p_user varchar2, p_role varchar2) return boolean; 
end; 
/

create or replace package body d20_pkg as 
    function get_for_role(p_app_id number, p_role varchar2) return varchar2 
    is 
    l_utenti varchar2(100); 
    begin 
      select listagg(user_name,',') within group (order by user_name) utenti into l_utenti 
        from apex_appl_acl_user_roles  
       where application_id = p_app_id 
         and role_static_id = p_role; 
         apex_debug.info('Estratti utenti filtrando per application_id = %s e ruolo = %s e sono: %s ',p_app_id,p_role, l_utenti); 
         return l_utenti; 
    end get_for_role; 
 
    function has_user_role(p_app_id number, p_user varchar2, p_role varchar2) return boolean 
    is 
    begin 
      return apex_acl.has_user_role ( 
             p_application_id => p_app_id,  
             p_user_name      => p_user, 
             p_role_static_id => p_role ); 
    end has_user_role; 
 
end d20_pkg;
/

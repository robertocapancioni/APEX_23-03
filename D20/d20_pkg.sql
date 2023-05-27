create or replace package d20_pkg as
    function get_for_role(p_app_id number, p_role varchar2) return varchar2;
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
         return l_utenti;
    end get_for_role;
end d20_pkg;
/

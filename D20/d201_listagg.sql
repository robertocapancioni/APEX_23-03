select distinct application_id,role_static_id,listagg(user_name,',') within group ( order by user_name ) 
                              over (partition by application_id,role_static_id) 
                              utenti 
         --user_name utenti
        from apex_appl_acl_user_roles   ; 

not apex_acl.has_user_role (
        p_application_id => :APP_ID, 
        p_user_name      => :APP_USER,
        p_role_static_id => 'CONTRIBUTOR' )




not apex_acl.has_user_role (
        p_application_id => :APP_ID, 
        p_user_name      => :APP_USER,
        p_role_static_id => 'CONTRIBUTOR' )
and
not apex_acl.has_user_role (
        p_application_id => :APP_ID, 
        p_user_name      => :APP_USER,
        p_role_static_id => 'ADMINISTRATOR' )
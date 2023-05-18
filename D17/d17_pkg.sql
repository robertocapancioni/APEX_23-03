create or replace package d17_pkg is 
function is_administrator ( 
                      p_app_id   in number, 
                      p_app_user in varchar2 
                    ) return boolean; 
 
function is_contributor ( 
                      p_app_id   in number, 
                      p_app_user in varchar2 
                    ) return boolean; 

function is_reader ( 
                      p_app_id   in number, 
                      p_app_user in varchar2 
                    ) return boolean;                     
end d17_pkg; 
/

create or replace package body d17_pkg is 
function is_administrator ( 
                      p_app_id   in number, 
                      p_app_user in varchar2 
                    ) return boolean is
begin
    return 
        apex_acl.has_user_role (
        p_application_id => p_app_id, 
        p_user_name      => p_app_user,
        p_role_static_id => 'ADMINISTRATOR' );
end is_administrator; 
 
function is_contributor ( 
                      p_app_id   in number, 
                      p_app_user in varchar2 
                    ) return boolean is
begin
return 
        apex_acl.has_user_role (
        p_application_id => p_app_id, 
        p_user_name      => p_app_user,
        p_role_static_id => 'ADMINISTRATOR' )
or 
        apex_acl.has_user_role (
        p_application_id => p_app_id, 
        p_user_name      => p_app_user,
        p_role_static_id => 'CONTRIBUTOR' );
end is_contributor; 

function is_reader ( 
                      p_app_id   in number, 
                      p_app_user in varchar2 
                    ) return boolean is
begin
    if nvl(apex_app_setting.get_value(
    p_name => 'ACCESS_CONTROL_SCOPE'),'x') = 'ALL_USERS' then
        -- allow user not in the ACL to access the application
        return true;
    else
        -- require user to have at least one role
        return apex_acl.has_user_any_roles (
            p_application_id => p_app_id, 
            p_user_name      => p_app_user);
    end if;
end is_reader;                     
end d17_pkg; 
/

select distinct u.application_id card_initials,
                     u.application_name card_title,
                     'f?p=' || u.application_id || ':1:'||v('APP_SESSION')card_link,
                     nvl(s.substitution_value,'fa-apex')card_icon,
                     null card_text,
                     null card_subtext 
       from apex_appl_acl_user_roles u
  left join apex_application_substitutions s 
             on u.workspace = s.workspace
            and u.application_id = s.application_id
            and s.substitution_string = 'APP_ICON_CLASS'
       join apex_application_auth a
             on u.workspace = a.workspace
            and u.application_id = a.application_id
            and a.is_current_authentication='Y'
            and a.cookie_name = 'D192'
      where u.user_name=v('APP_USER');

select v.id,
       v.cliente,
       v.zona_cliente,
       v.prodotto,
       v.tipo_prodotto,
       v.data,
       v.quantita,
       v.importo
  from d191_vendita_vw v
  where exists (
select 1
  from apex_appl_acl_user_roles r
 where r.application_id = :app_id
   and r.user_name = :app_user
   and r.role_static_id in (v.zona_cliente,'ADMINISTRATOR')
 );

select v.id,
       v.cliente,
       v.zona_cliente,
       v.prodotto,
       v.tipo_prodotto,
       v.data,
       v.quantita,
       v.importo
  from d191_vendita_vw v
  where exists (
select 1
  from apex_appl_acl_user_roles r
  left join d191_ruolo_tipo_prodotto rtp on r.role_static_id = rtp.ruolo
 where r.application_id = :APP_ID
   and r.user_name = :APP_USER
   and (rtp.tipo_prodotto||':' like '%'||v.tipo_prodotto||':'||'%' or r.role_static_id = 'ADMINISTRATOR')
 );
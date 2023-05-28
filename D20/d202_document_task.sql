select d.*,
       a.*
  from apex_tasks t
  join table (apex_approval.get_tasks ('INITIATED_BY_ME'))a
    on t.task_id = a.task_id and t.application_id = a.app_id
  join d202_documento d 
    on t.detail_pk = d.id
 where a.app_id = :APP_ID

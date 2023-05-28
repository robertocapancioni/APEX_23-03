select t.task_id,
       t.application_id,
       t.task_def_name,
       t.task_def_static_id,
       t.detail_pk,
       t.subject,
       t.initiator,
       t.actual_owner,
       t.state,
       t.outcome,
       h.event_type,
       h.event_creator,
       h.old_state,
       h.new_state,
       h.old_actual_owner,
       h.new_actual_owner,
       h.outcome history_outcome,
       h.event_timestamp 
  from APEX_TASK_HISTORY h
  join APEX_TASKS t on h.task_id = t.task_id
                   and h.application_id = t.application_id
 where t.application_id = 786 and t.detail_pk = 1
   and h.event_type_code = 'COMPLETE'
order by h.event_timestamp 

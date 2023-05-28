declare
l_task_id number;
begin

    l_task_id := apex_approval.create_task(
            p_application_id => :APP_ID,
            p_task_def_static_id => 'CEO',
            p_initiator => :RICHIEDENTE, 
            p_parameters => apex_approval.t_task_parameters(
                1 => apex_approval.t_task_parameter(static_id => 'CODICE', string_value => :CODICE)
        ),
        p_detail_pk => :APEX$TASK_PK
    );

update d202_documento
   set stato = 'CEO'
 where id = :APEX$TASK_PK;
end;

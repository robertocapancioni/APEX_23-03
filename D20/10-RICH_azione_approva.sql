declare
l_stato_da_id d20_documento_dettaglio.stato_da_id%type;
l_stato d20_stato.stato%type :='10-RICH';
l_richiedente d20_documento.richiedente%type := :APP_USER;
begin
:RICHEDENTE := l_richiedente;
:STATO      := l_stato;
select id into l_stato_da_id from d20_stato where stato =l_stato;
insert into d20_documento_dettaglio (documento_id,data,utente,stato_da_id,stato_a_id) values (:APEX$TASK_PK,sysdate,l_richiedente,l_stato_da_id,l_stato_da_id);
end;

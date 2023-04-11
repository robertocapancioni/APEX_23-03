create or replace trigger d07_cliente_audit_trg
    after 
    update or delete 
    on d07_cliente
    for each row    
declare
   l_azione varchar2(10);
begin
   -- determine the azione type
   l_azione := case  
         when updating then 'UPDATE'
         when deleting then 'DELETE'
   end;

   -- insert a row into the audit table   
   insert into d07_audit (tabella, azione, utente, data)
   values('CLIENTE', l_azione, coalesce(sys_context('APEX$SESSION','APP_USER'),user), sysdate);
end;
/

insert into d07_cliente (codice_cliente,ragione_sociale,piva) values ('C001','Oracle SPA','01060000666');
update d07_cliente set email = 'oracle@oracle.com'where codice_cliente='C001';
delete from d07_cliente where codice_cliente='C001';

select * from d07_audit;

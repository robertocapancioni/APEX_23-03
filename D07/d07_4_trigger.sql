create or replace editionable trigger  d07_tipo_documento_biu 
    before insert or update  
    on d07_tipo_documento 
    for each row 
begin 
 if :new.tipo_documento like '% %' then
     raise_application_error(-20001,'Il tipo tipo_documento non può contenere spazi');
 end if;
end d07_tipo_documento_biu; 
/


create or replace editionable trigger  d07_tipo_documento_biu 
    before insert or update  
    on d07_tipo_documento 
    for each row 
declare
l_rec d07_tipo_documento%rowtype;
begin 
    l_rec.tipo_documento        := :new.tipo_documento;
    --l_rec.descrizione   := :new.descrizione;
    --l_rec.prezzo        := :new.prezzo;

    d07_vld.tipo_documento(p_rec => l_rec);
end d07_tipo_documento_biu; 
/
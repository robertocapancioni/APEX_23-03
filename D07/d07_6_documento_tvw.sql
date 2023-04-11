create or replace view d07_documento_tvw as
select 
 id,
 tipo_documento_id,
 codice,
 data_documento,
 firma_yn,
 categoria
 from d07_documento;

create or replace trigger d07_documento_tvw_itrg 
instead of insert on d07_documento_tvw 
for each row 
begin 
        d07_documento_api.insert_row (
            p_id                          => null,
            p_tipo_documento_id           => null,
            p_codice                      => null,
            p_data_documento              => null,
            p_firma_yn                    => null,
            p_categoria                   => null
            );
end; 
/

create or replace trigger d07_documento_tvw_utrg 
instead of update on d07_documento_tvw 
for each row 
begin 
        d07_documento_api.update_row (
            p_id                          => null,
            p_tipo_documento_id           => null,
            p_codice                      => null,
            p_data_documento              => null,
            p_firma_yn                    => null,
            p_categoria                   => null
            );
end; 
/

create or replace trigger d07_documento_tvw_dtrg 
instead of delete on d07_documento_tvw 
for each row 
begin 
        d07_documento_api.delete_row (
        p_id                           => null
    );
end; 
/
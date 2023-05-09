Collections

https://docs.oracle.com/en/database/oracle/apex/22.2/aeapi/APEX_COLLECTION.html#GUID-859B488C-2628-44D7-969F-50872C685B76

    APEX_COLLECTION.CREATE_COLLECTION(
        p_collection_name => 'EMPLOYEES');

    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(
        p_collection_name IN VARCHAR2);

APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY ( -- c001 .. c050
    p_collection_name    IN VARCHAR2,
    p_query              IN VARCHAR2,
    p_generate_md5       IN VARCHAR2 default 'NO',
    p_truncate_if_exists IN VARCHAR2 default 'NO');

APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY2 ( -- n001 .. n005, d001 .. d005, c001 .. c050
    p_collection_name    IN VARCHAR2,
    p_query              IN VARCHAR2,
    p_generate_md5       IN VARCHAR2 default 'NO',
    p_truncate_if_exists IN VARCHAR2 default 'NO');

    APEX_COLLECTION.TRUNCATE_COLLECTION (
            p_collection_name   IN VARCHAR2);

    APEX_COLLECTION.DELETE_COLLECTION(
            p_collection_name IN VARCHAR2);

    l_seq := APEX_COLLECTION.ADD_MEMBER(
                    p_collection_name => 'GROCERIES'
                    p_c001            => 'Grapes',
                    p_c002            => 'Imported',
                    p_n001            => 125,
                    p_d001            => sysdate );

    APEX_COLLECTION.ADD_MEMBER(
            p_collection_name => 'GROCERIES'
            p_c001            => 'Grapes',
            p_c002            => 'Imported',
            p_n001            => 125,
            p_d001            => sysdate );
    END;

    APEX_COLLECTION.UPDATE_MEMBER (
        p_collection_name => 'Departments',
        p_seq => '2',
        p_c001 => 'Engineering',
        p_c002 => 'Sales');
    
    APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (
    p_collection_name IN VARCHAR2,
    p_seq             IN NUMBER,
    p_clob_number     IN NUMBER,
    p_clob_value      IN VARCHAR2 ); -- 6 overloding: varchar2 , number , date , clob , blob , xmltype

    APEX_COLLECTION.DELETE_MEMBER (
            p_collection_name IN VARCHAR2,
            p_seq IN VARCHAR2)
    



begin
    --APEX_COLLECTION.DELETE_COLLECTION ('D12_FATTURA_TESTATA');
if not apex_collection.collection_exists('D12_FATTURA_TESTATA') then
    apex_collection.create_collection('D12_FATTURA_TESTATA');
  for r in (select id,
                   cliente_id,
                   anno,
                   numero,
                   descrizione,
                   data 
              from d12_fattura_testata
        )
  loop
    apex_collection.add_member(p_collection_name=>'D12_FATTURA_TESTATA'
                              ,p_n001 => r.id
                              ,p_n002 => r.cliente_id
                              ,p_c001 => r.anno
                              ,p_c002 => r.numero
                              ,p_c003 => r.descrizione
                              ,p_d001 => r.data
    );
  end loop;
end if;
end;


select seq_id seq_id
      ,n001 id
      ,n002 cliente_id
      ,c001 anno
      ,c002 numero
      ,c003 descrizione
      ,d001 data 
  from apex_collections where collection_name='D12_FATTURA_TESTATA';


APEX_COLLECTION.ADD_MEMBER (
                               p_collection_name=>'D12_FATTURA_TESTATA'
                              ,p_n001 => :P26_id
                              ,p_n002 => :P26_cliente_id
                              ,p_c001 => :P26_anno
                              ,p_c002 => :P26_numero
                              ,p_c003 => :P26_descrizione
                              ,p_d001 => :P26_data);
                              
APEX_COLLECTION.UPDATE_MEMBER (
                               p_collection_name=>'D12_FATTURA_TESTATA'
                              ,p_seq  => :P26_SEQ_ID
                              ,p_n001 => :P26_id
                              ,p_n002 => :P26_cliente_id
                              ,p_c001 => :P26_anno
                              ,p_c002 => :P26_numero
                              ,p_c003 => :P26_descrizione
                              ,p_d001 => :P26_data);

APEX_COLLECTION.DELETE_MEMBER (
                               p_collection_name=>'D12_FATTURA_TESTATA'
                              ,p_seq  => :P26_SEQ_ID);

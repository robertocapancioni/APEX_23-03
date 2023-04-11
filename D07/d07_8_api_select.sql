select 
replace(
replace(
replace(
replace(
q'~
create or replace package @TABLE@_api_ext
is
    /* example:
        
        begin
        @TABLE@_api_ext.set_row (
            p_row_status => :APEX$ROW_STATUS,
            @A_AGG@
            );
        end;
     */
    procedure set_row  (
        p_row_status in varchar2 default null,
        @B_AGG@
    );
end @TABLE@_api_ext;
/



create or replace package  body @TABLE@_api_ext
is
    procedure set_row  (
        p_row_status in varchar2 default null,
        @B_AGG@
    )
    is
    begin  
         case p_row_status  
         when 'C' then 
             @TABLE@_api.insert_row (
                @C_AGG@
                );
         when 'U' then  
             @TABLE@_api.update_row (
                @C_AGG@
                );
         when 'D' then  
             @TABLE@_api.delete_row (
                p_id                          => p_id
                );
         end case;  
    end set_row;  
end @TABLE@_api_ext;
/
~'
,'@TABLE@',lower(table_name))
,'@A_AGG@',A_AGG)
,'@B_AGG@',B_AGG)
,'@C_AGG@',C_AGG)sql
from (
select c.owner,
       c.table_name,
       LISTAGG(a,',') WITHIN GROUP( ORDER BY c.column_id) AS a_agg,
       LISTAGG(b,',') WITHIN GROUP( ORDER BY c.column_id) AS b_agg,
       LISTAGG(c,',') WITHIN GROUP( ORDER BY c.column_id) AS c_agg
    from (
 select c.column_id, 
        c.owner,
        c.table_name, 
        c.column_name,
        'p_'||lower(c.column_name)||' => :PX_'||upper(c.column_name) a, 
        'p_'||lower(c.column_name)||' in '||lower(c.table_name||'.'||c.column_name)||'%type default null' b,
        'p_'||lower(c.column_name)||' => p_'||lower(c.column_name) c 
  from all_tab_columns c
    )c
 where c.owner='AT0'
   and c.table_name='d07_DOCUMENTO'
 group by c.owner , c.table_name 
)a0
 ;
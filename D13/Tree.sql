select case when connect_by_isleaf = 1 then 0
            when level = 1             then 1
            else                           -1
       end as status, 
       level, 
       "ENAME" as title, 
       null as icon, 
       "EMPNO" as value, 
       null as tooltip, 
       --f?p=App:Page:Session:Request:Debug:ClearCache:itemNames:itemValues:PrinterFriendly
       apex_util.prepare_url('f?p='||:app_id||':4:'||:app_session||'::::P4_EMPNO:'||EMPNO) as link
from "#OWNER#"."EMP"
start with "MGR" is null
connect by prior "EMPNO" = "MGR"
order siblings by "ENAME"
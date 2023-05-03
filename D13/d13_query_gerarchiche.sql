select empno,
       ename,
       job,
       mgr,
       prior ename mgr_ename,
       prior job mgr_job,
       connect_by_root empno root_empno,
       hiredate,
       sal,
       level,
       SYS_CONNECT_BY_PATH(ename,'/')path,
       lpad(' ', level,'*' )||ename  as ename_indented,
       --CONNECT_BY_ISCYCLE cycle,
       CONNECT_BY_ISLEAF leaf
  from emp
 start with empno =7839
 connect by -- nocycle 
   prior empno = mgr
 order siblings by ename

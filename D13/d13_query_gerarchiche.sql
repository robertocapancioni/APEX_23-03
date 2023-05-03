select empno,
       ename,
       job,
       mgr,
       hiredate,
       sal
  from emp;

select empno,
       ename,
       job,
       mgr,
       hiredate,
       sal
  from emp
  start with mgr is null
  connect by prior empno = mgr;

select empno,
       ename,
       job,
       mgr,
       hiredate,
       sal,
       level
  from emp
  start with mgr is null
  connect by prior empno = mgr
  order siblings by ename;

select empno,
       ename,
       job,
       mgr,
       prior ename mgr_ename,
       prior job mgr_job,
       hiredate,
       sal,
       level
  from emp
  start with mgr is null
  connect by prior empno = mgr
  order siblings by ename;
  
select empno,
       ename,
       job,
       mgr,
       prior ename mgr_ename,
       prior job mgr_job,
       connect_by_root empno root_empno,
       hiredate,
       sal,
       level
  from emp
  start with mgr is null
  connect by prior empno = mgr
  order siblings by ename;

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
       SYS_CONNECT_BY_PATH(ename,'/') path
  from emp
  start with mgr is null
  connect by prior empno = mgr
  order siblings by ename;
  
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
       SYS_CONNECT_BY_PATH(ename,'/') path,
       CONNECT_BY_ISLEAF leaf
  from emp
  start with mgr is null
  connect by prior empno = mgr
  order siblings by ename;
  
 update emp set mgr = 7566 where empno=7839
 
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
       SYS_CONNECT_BY_PATH(ename,'/') path,
       CONNECT_BY_ISLEAF leaf
  from emp
  start with empno = 7839
  connect by prior empno = mgr
  order siblings by ename;
  
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
       SYS_CONNECT_BY_PATH(ename,'/') path,
       CONNECT_BY_ISLEAF leaf
  from emp
  start with empno = 7839
  connect by nocycle prior empno = mgr
  order siblings by ename;
 
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
       SYS_CONNECT_BY_PATH(ename,'/') path,
       CONNECT_BY_ISLEAF leaf,
       CONNECT_BY_ISCYCLE cycle
  from emp
  start with empno = 7839
  connect by nocycle prior empno = mgr
  order siblings by ename;
  
 update emp set mgr = null where empno=7839;  
 
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
 start with mgr is null
 connect by -- nocycle 
   prior empno = mgr
 order siblings by ename;

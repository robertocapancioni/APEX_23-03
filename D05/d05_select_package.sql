select * from dual;

select d05_my_pkg.my_func(p_param1 => 3
                         ,p_param2 => 5) somma
from dual;

declare
l_param1 number := 10;
l_param2 number :=null;
begin
d05_my_pkg.my_proc(p_param1 => l_param1
                  ,p_param2 => l_param2);

htp.prn(l_param2);

end;
/


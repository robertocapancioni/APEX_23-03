create or replace package d05_my_pkg
is
    procedure my_proc (
        p_param1                      in number,
        p_param2                     out number
    );

    function my_func (
        p_param1                      in number,
        p_param2                      in number
    ) return number;
end d05_my_pkg;
/


create or replace package  body d05_my_pkg
is
    procedure my_proc (
        p_param1                      in number,
        p_param2                     out number
    )
    is

    begin
       p_param2 := 2 * p_param1;
    end my_proc;

    function my_func (
        p_param1                      in number,
        p_param2                      in number
    ) return number
    is
    begin
        return p_param1 + p_param2;
    end my_func;
end d05_my_pkg;
/
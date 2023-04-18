create or replace package d09_ft_pkg is

function ranking_mcr1(
                        p_country in varchar2 default null,
                        p_sector  in varchar2 default null
                        ) return clob sql_macro;

function ranking_scr1(
                        p_country in varchar2 default null,
                        p_sector  in varchar2 default null
                        ) return clob;
end d09_ft_pkg;
/

create or replace package body d09_ft_pkg is

function ranking_mcr1(
                        p_country in varchar2 default null,
                        p_sector  in varchar2 default null
                        ) return clob sql_macro is
begin
  RETURN q'{
            select id,
                   rank,
                   web,
                   name,
                   ranking_2021,
                   ranking_2020,
                   country,
                   sector,
                   agr_perc,
                   cagr_perc,
                   revenue_2020,
                   revenue_2017,
                   employees_2020,
                   employees_2017,
                   founding_year,
                   year_ranking
              from d09_classifica_ft
             where instr( ':' || nvl(p_country,country)  || ':', ':' || country   || ':' ) > 0
               and instr( ':' || nvl(p_sector,sector)  || ':', ':' || sector   || ':' ) > 0 
  }';
end ranking_mcr1;

function ranking_scr1(
                        p_country in varchar2 default null,
                        p_sector  in varchar2 default null
                        ) return clob  is
begin
  RETURN replace(replace(
          q'{
             select id,
                   rank,
                   web,
                   name,
                   ranking_2021,
                   ranking_2020,
                   country,
                   sector,
                   agr_perc,
                   cagr_perc,
                   revenue_2020,
                   revenue_2017,
                   employees_2020,
                   employees_2017,
                   founding_year,
                   year_ranking
              from d09_classifica_ft
             where instr( ':' || nvl(p_country,country)  || ':', ':' || country   || ':' ) > 0
               and instr( ':' || nvl(p_sector,sector)  || ':', ':' || sector   || ':' ) > 0 
  }'
  ,'p_country',''''||p_country||'''')
  ,'p_sector' ,''''||p_sector||'''')
  ;
end ranking_scr1;

end d09_ft_pkg;
/
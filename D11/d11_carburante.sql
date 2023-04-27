select targa,
         data,
         litri,
         km_progr
    from d11_carburante
order by targa,data;

select targa,
         data,
         litri,
         km_progr,
         lead(km_progr) over(partition by targa 
                                 order by data,km_progr  ) km_progr_successivi
    from d11_carburante
order by targa,data;

select targa,
         data,
         litri,
         km_progr,
         lag(km_progr)  over(partition by targa 
                                 order by data  ) km_progr_precedenti,
         lead(km_progr) over(partition by targa 
                                 order by data  ) km_progr_successivi
    from d11_carburante
order by targa,data;

with carburante as(
               select targa,
                      data,
                      litri,
                      km_progr,
                      lead(km_progr) over(partition by targa 
                                              order by data  ) km_progr_successivi
                 from d11_carburante
    )
   select targa,
          data,
          litri,
          km_progr,
          km_progr_successivi - km_progr km,
          case 
              when litri<>0
              then round(nvl(km_progr_successivi - km_progr,0) /litri,2)
              else 0
          end km_medi_litro
     from carburante
 order by targa,data

select targa,
       data,
       litri,
       km_progr,
       rank() over(partition by targa 
                               order by data ) rank
  from d11_carburante
  order by targa,rank;
 
 select targa,
       data,
       litri,
       km_progr,
       rank() over(partition by targa 
                               order by data ) rank,
       dense_rank() over(partition by targa 
                               order by data ) dense_rank
  from d11_carburante
  order by targa,rank

with carburante as (
     select targa,
            data,
            litri,
            km_progr,
            rank() over(partition by targa 
                            order by data,km_progr,id ) rank,
            dense_rank() over(partition by targa 
                                  order by data,km_progr,id ) dense_rank
       from d11_carburante)
    select * 
      from carburante
     where rank = 1
  order by targa,rank;
  
select targa,
       data,
       litri,
       ratio_to_report(litri) over()                   perc_litri_su_totale, 
       ratio_to_report(litri) over(partition by targa) perc_litri_su_targa,  
       km_progr
  from d11_carburante;

select targa,
       data,
       litri,
       round(100*ratio_to_report(litri) over(),2)                   perc_litri_su_totale, 
       round(100*ratio_to_report(litri) over(partition by targa),2) perc_litri_su_targa,  
       km_progr
  from d11_carburante;
  
select count(*) righe_totali
  from d11_carburante

  select targa,count(*)righe_totali
    from d11_carburante
group by targa

select targa,
       count(*) over() righe_totali
    from d11_carburante

select targa,
       count(*) over(partition by targa) righe_totali
    from d11_carburante

select sum(litri) litri_totali
  from d11_carburante

  select targa,sum(litri)litri_totali
    from d11_carburante
group by targa

select targa,
       sum(litri) over() litri_totali
    from d11_carburante

select targa,
       sum(litri) over(partition by targa) litri_totali
    from d11_carburante

select targa,
       data,
       litri,
       sum(litri) over(partition by targa) litri_totali,
       sum(litri) over(partition by targa order by data) litri_totali_progr,
       sum(litri) over(partition by targa order by data,id
                                      rows between unbounded preceding 
                                               and current row) litri_totali_progr2,
       sum(litri) over(partition by targa order by data 
                                     range between unbounded preceding 
                                               and current row) litri_totali_progr3
    from d11_carburante
order by targa,data,id

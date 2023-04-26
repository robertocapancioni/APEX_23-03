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
                                 order by data  ) km_progr_successivi
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
  order by targa,rank

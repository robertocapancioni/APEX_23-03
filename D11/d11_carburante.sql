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

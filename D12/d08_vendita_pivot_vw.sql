create or replace view d08_vendita_pivot_vw as
select tipo_prodotto,
       nord_quantita,
       nord_valore,
       centro_quantita,
       centro_valore,
       sud_quantita,
       sud_valore 
  from (
select zona,
       tipo_prodotto,
       quantita,
       valore
  from D08_VENDITA_VW
       )
pivot (
      sum(quantita) quantita,
      sum(valore) valore
      for zona 
       in ('NORD'   as NORD,
           'CENTRO' as CENTRO,
           'SUD'    as SUD) 
      );



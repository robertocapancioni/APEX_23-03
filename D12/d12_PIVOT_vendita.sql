  SELECT * FROM
(
  SELECT column1, column2
  FROM tables
  WHERE conditions
)
PIVOT [XML]
(
  aggregate_function(column2)
  FOR column2
  IN ( expr1, expr2, ... expr_n) | subquery
)
ORDER BY expression [ ASC | DESC ];

  
  select zona,
         tipo_prodotto,
         quantita,
         valore
    from D08_VENDITA_VW;
  
 
select * 
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
       in ('NORD' ,
           'CENTRO',
           'SUD') 
      );

select * 
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
      sum(valore)   valore
      for zona 
       in ('NORD'   as NORD,
           'CENTRO' as CENTRO,
           'SUD'    as SUD) 
      );

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
      sum(valore)   valore
      for zona 
       in ('NORD'   as NORD,
           'CENTRO' as CENTRO,
           'SUD'    as SUD) 
      )
 order by tipo_prodotto,nord_quantita;

select *
  from (
select zona,
       tipo_prodotto,
       quantita,
       valore
  from D08_VENDITA_VW
       )
pivot XML(
      sum(quantita) quantita,
      sum(valore)   valore
      for zona 
       in (select distinct zona 
             from d08_cliente) 
      )
order by tipo_prodotto;

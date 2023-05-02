SELECT unpivot_colonna1,
       unpivot_colonna2,
       …  
  FROM 
(
  SELECT colonna1, colonna2
    FROM tabelle …
   WHERE condizioni
)

UNPIVOT [INCLUDE | EXCLUDE NULLS]
(
  valori
  FOR colonna1
  IN ( expr1, expr2, ... expr_n)
)
ORDER BY unpivot_colonna1, …;

select * 
  from
(
 select tipo_prodotto,
        nord_quantita,
        centro_quantita,
        sud_quantita 
   from d08_vendita_pivot_vw
)
unpivot(
    quantita
    for zona 
    in (nord_quantita as 'NORD',
        centro_quantita as 'CENTRO',
        sud_quantita as 'SUD')
);

select * from
(
 select tipo_prodotto,
        nord_quantita,
        centro_quantita,
        sud_quantita,
        nord_valore,
        centro_valore,
        sud_valore 
  from d08_vendita_pivot_vw
)
unpivot(
    (quantita,valore)
    for zona 
    in (
        (nord_quantita,nord_valore) as 'NORD',
        (centro_quantita,centro_valore) as 'CENTRO',
        (sud_quantita,sud_valore) as 'SUD'
        )
);

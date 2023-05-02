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



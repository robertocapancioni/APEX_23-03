select 
      a.ID,
      a.DATA_INIZIO,
      a.DATA_FINE,
      a.DESCRIZIONE,
      a.TIPO_APPUNTAMENTO_ID,
     ta.TIPO_APPUNTAMENTO, 
      a.NOME_ID,
      n.NOME
 from D09_APPUNTAMENTO a
 join D09_TIPO_APPUNTAMENTO ta
   on a.TIPO_APPUNTAMENTO_ID = ta.TIPO_APPUNTAMENTO_ID
 join D09_NOME n
   on a.NOME_ID = n.NOME_ID
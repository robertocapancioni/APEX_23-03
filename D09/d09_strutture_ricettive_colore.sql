select ID,
       DENOMINAZIONE,
       INDIRIZZO,
       PRIVATI,
       LINGUE,
       SPORT,
       LATITUDINE,
       LONGITUDINE,
       COMUNE_ID,
       ZONA_ID,
       CLASSIFICAZIONE_ID,
       case PRIVATI
       when 'SI' then '#FFCC00'
                 else '#4CD964' 
       end COLORE
  from D09_STRUTTURE_RICETTIVE
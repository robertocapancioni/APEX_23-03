select x.id_te001,x.timestamp_tx, 'Ore '||to_char(cast(data_ricezione as date),'HH24:MI' )data_ricezioneX, data_ricezione,
sdo_geometry (2002
             ,null
             ,null
             ,sdo_elem_info_array (1,2,1)
             ,sdo_ordinate_array (x.longitudine_prec,x.latitudine_prec,x.longitudine,x.latitudine )
             ) geometr_line      
from (
select id,
id_te001,
data_ricezione,
'Ore '||to_char(cast(data_ricezione as date),'HH24:MI' )data_ricezioneX,
timestamp_tx,
consumo,
stato,
latitudine,
longitudine,
descrizione,
LAG(latitudine,1)  OVER (PARTITION BY t.id_te001 ORDER BY t.timestamp_tx) AS latitudine_prec,
LAG(longitudine,1) OVER (PARTITION BY t.id_te001 ORDER BY t.timestamp_tx) AS longitudine_prec
 from D10_PER T
 where id_te001=5
) X 
where latitudine_prec is not null
order by data_ricezione
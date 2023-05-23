select m.targa,
       a.assicurazione,
       a.data_scadenza,
       lag(a.data_scadenza) over (partition by a.automezzo_id order by a.data_scadenza)data_scadenza_prec
  from d18_assicurazione a
  join d18_automezzo m on a.automezzo_id = m.id

with assicurazione as (
    select m.targa,
       a.assicurazione,
       a.data_scadenza,
       lag(a.data_scadenza) over (partition by a.automezzo_id order by a.data_scadenza)data_scadenza_prec
  from d18_assicurazione a
  join d18_automezzo m on a.automezzo_id = m.id
)
select * 
 from assicurazione  
 where date'2022-01-01' between nvl(data_scadenza_prec,date'1900-01-01') and data_scadenza

select m.targa,
       a.assicurazione,
       a.data_scadenza,
       lag(a.data_scadenza) over (partition by a.automezzo_id order by a.data_scadenza)data_scadenza_prec
  from d18_assicurazione a
  join d18_automezzo m on a.automezzo_id = m.id

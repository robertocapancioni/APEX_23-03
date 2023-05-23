merge into d18_vendita d
         using d17_vendita s
            on (    s.data     = d.data 
                and s.prodotto = d.prodotto
                and s.cliente  = d.cliente
               )
    when matched then
          update set
                 --d.data         = s.data,
                 --d.prodotto     = s.prodotto,
                 --d.cliente      = s.cliente,
                 d.zona_cliente = s.zona_cliente,
                 d.quantita     = s.quantita,
                 d.importo      = s.importo
    when not matched then
          insert (d.data,d.prodotto,d.cliente,d.zona_cliente,d.quantita,d.importo)
          values (s.data,s.prodotto,s.cliente,s.zona_cliente,s.quantita,s.importo);
          
    merge into d18_vendita d
         using d17_vendita s
            on (    s.data     = d.data 
                and s.prodotto = d.prodotto
                and s.cliente  = d.cliente
               )
    when matched then
          update set
                 --d.data         = s.data,
                 --d.prodotto     = s.prodotto,
                 --d.cliente      = s.cliente,
                 d.zona_cliente = s.zona_cliente,
                 d.quantita     = s.quantita,
                 d.importo      = s.importo
                 where d.importo < 100
          delete where d.importo < 100
    when not matched then
          insert (d.data,d.prodotto,d.cliente,d.zona_cliente,d.quantita,d.importo)
          values (s.data,s.prodotto,s.cliente,s.zona_cliente,s.quantita,s.importo)
           where s.importo < 100;

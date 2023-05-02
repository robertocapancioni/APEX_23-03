 
/*
cliente
  codice_cliente vc20 /nn
  ragione_sociale vc50 /nn
  piva vc11 /nn
  indirizzo vc100 /nn
  codice_sdi vc6 

fattura_testata
  anno num /nn
  numero num /nn
  descrizione vc50 /nn
  data d /nn
  cliente_id /nn

fattura_dettaglio
  fattura_testata_id /nn
  riga num /nn
  descrizione vc100 /nn
  quantita num /nn
  importo num /nn
  

# settings = { prefix: "D12", onDelete: "RESTRICT", semantics: "CHAR", drop: true, language: "EN", APEX: true }
*/

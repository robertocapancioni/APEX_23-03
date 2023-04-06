dipendente /insert 5
  dipendente /nn /values francesca, marco, anna, simone, paola /unique
  tariffa num /nn /values 200,150 

cliente /insert 5
  cliente vc50 /nn /values cliente_01,cliente_02,cliente_03,cliente_04,cliente_05 /unique

commessa /insert 5
  commessa vc30 /nn /values COMM01, COMM02, COMM03, COMM04, COMM05 /unique

attivita /insert 200
  dipendente_id /nn
  cliente_id /nn
  commessa_id vc100 /nn
  data d /nn
  ore num /nn

# settings = { prefix: "D06", ondelete: "RESTRICT", api: true, semantics: "CHAR", language: "EN", APEX: true }

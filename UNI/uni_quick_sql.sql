facolta /insert 5
  facolta vc50 /nn /values AGRARIA,ECONOMIA,INGEGNERIA,MEDICINA,SCIENZE

docente
  docente vc50 /nn /unique
  facolta_id /nn
  
tipo_laurea /insert 3
  tipo_laurea vc50 /nn /unique /values LAUREA,LAUREA MAGISTRALE,CICLO UNICO

laurea
  laurea vc50 /nn /unique
  facolta_id /nn
  tipo_laurea_id /nn
  anno_inizio number /nn
 
materia
  materia vc50 /nn /unique
  materia_des vc50 /nn
  laurea_id /nn
  docente_id /nn
  anno int /nn
  periodo int /nn
  crediti int /nn

appello
  appello vc50 /nn /unique
  materia_id /nn
  data d /nn

studente
  studente vc50 /nn /unique
  laurea_id /nn
  foto file
  
stato_esame /insert 3
  stato_esame vc50 /nn /unique /values DA SOSTENERE,PASSATO,NON PASSATO

esame
  esame vc50 /nn
  studente_id /nn
  appello_id /nn
  stato_esame_id /nn
  voto int

# settings = { prefix: "UNI", semantics: "CHAR", auditCols: true, drop: true, language: "EN", APEX: true }

create table d16_dipartimento_json (
    id                             number generated by default on null as identity 
                                   constraint d16_dipartimento_j_id_pk primary key,
    dipartimento                   clob check (dipartimento is json)
)
;
 
/*
dipartimento_json
  dipartimento json 

# settings = { prefix: "D16", semantics: "CHAR", language: "EN", APEX: true }
*/


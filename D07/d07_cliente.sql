-- drop objects
drop table d07_cliente cascade constraints;
drop table d07_audit cascade constraints;

-- create tables
create table d07_cliente (
    id                             number generated by default on null as identity 
                                   constraint d07_cliente_id_pk primary key,
    codice_cliente                 varchar2(20 char)
                                   constraint d07_cliente_codice_cliente_unq unique not null,
    ragione_sociale                varchar2(50 char) not null,
    piva                           varchar2(11 char) not null,
    email                          varchar2(100 char)
)
;

create table d07_audit (
    id                             number generated by default on null as identity 
                                   constraint d07_audit_id_pk primary key,
    tabella                        varchar2(50 char),
    azione                         varchar2(50 char),
    utente                         varchar2(50 char),
    data                           date
)
;

-- load data
 
-- Generated by Quick SQL Martedì Aprile 11, 2023  05:35:38
 
/*
cliente
  codice_cliente vc20 /nn /unique
  ragione_sociale vc50 /nn
  piva vc11 /nn
  email vc100
audit
  tabella vc50
  azione vc50
  utente vc50
  data d
# settings = { prefix: "D07", semantics: "CHAR", drop: true, language: "EN", APEX: true }
*/

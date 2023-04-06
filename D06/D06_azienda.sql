-- create tables
create table d06_azienda (
    id                             number generated by default on null as identity 
                                   constraint d06_azienda_id_pk primary key,
    ragione_sociale                varchar2(50 char) not null,
    nazione                        varchar2(3 char) default 'ITA',
    regione                        varchar2(2 char),
    provincia                      varchar2(2 char),
    comune                         varchar2(6 char),
    citta                          varchar2(50 char),
    cap                            varchar2(5 char),
    indirizzo                      varchar2(50 char),
    telefono                       varchar2(50 char),
    email                          varchar2(50 char),
	settore						   varchar2(100),
    aggiornamento                  date,
    logo                           blob,
    coordinate_json                varchar2(100 char)
)
;

-- load data

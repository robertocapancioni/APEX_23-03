
drop table d16_persona

create table d16_persona (
    id   integer not null primary key,
    persona clob not null check (persona is json)
);


insert into d16_persona 
  values ( 1, '{"id":1,
                                         "nome":"John",
                                         "cognome":"Doe",
                                         "indirizzo": {"via":"Main St",
                                                     "citta":"Redwood",
                                                     "cap":"94607",
                                                     "stato":"CA",
                                                     "telefono":null
                                                    
                                                    }
                                        }' );
insert into d16_persona 
  values ( 2, '{"id":2,
                                         "nome":"Mary",
                                         "cognome":"Doe",
                                         "indirizzo": {"via":"Main St",
                                                     "citta":"San Francisco",
                                                     "cap":"94607",
                                                     "stato":"CA",
                                                     "telefono":null
                                                    
                                                    }
                                        }' );


select * from d16_persona

update d16_persona
set    persona = 
'{
 "id":1,
 "nome":"John",
 "cognome":"Doe",
 "indirizzo": {"via":"Main St",
			 "citta":"Redwood",
			 "cap":"94607",
			 "stato":"CA",
			 "telefono":"+99 333 333"
			
			}
}'
 where  id = 1;

select * from d16_persona


update d16_persona
set    persona = json_mergepatch ( 
         persona,
         '{"cognome":"Dawson",
           "indirizzo" : {"telefono":"+99 444 444"}
          }'
       )
where  id = 2;

select * from d16_persona


update d16_persona
set    persona = json_mergepatch ( 
         persona,
         '{"titolo":"Sig.ra"}'
       )
where  id = 2;

select * from d16_persona


update d16_persona  
set    persona = json_transform (
  persona, 
  replace '$.indirizzo.telefono' = '+99 999 999'
)
where  id = 2;

select * from d16_persona


update d16_persona  
set    persona = json_transform (
  persona, 
  set '$.indirizzo.nazione' = 'US'
)
where  id = 2;

select * from d16_persona


select p.persona.nome,
       p.persona.cognome
from d16_persona p;

select p.persona.titolo,
       p.persona.nome,
       p.persona.cognome,
       p.persona.indirizzo.via via,
       p.persona.indirizzo.citta citta,
       p.persona.indirizzo.cap cap,
       p.persona.indirizzo.stato stato,
       p.persona.indirizzo.telefono telefono,
       p.persona.indirizzo.nazione nazione
from d16_persona p;

select json_value (persona,'$.titolo' returning varchar2) titolo,
       json_value (persona,'$.nome' returning varchar2) nome,
       json_value (persona,'$.cognome' returning varchar2) cognome,
       json_value (persona,'$.indirizzo.via' returning varchar2) via,
       json_value (persona,'$.indirizzo.citta' returning varchar2) citta
from   d16_persona p

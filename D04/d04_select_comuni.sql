select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d04_comune c
  join d04_provincia p
    on c.provincia_cod = p.provincia_cod
    
delete 
  from d04_comune 
 where provincia_cod in ('BG','BS','CO')

delete 
  from d04_provincia 
 where provincia_cod in ('MN','PV','SO','VA')

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d04_comune c
  left
  join d04_provincia p
    on c.provincia_cod = p.provincia_cod

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d04_comune c
  left
  join d04_provincia p
    on c.provincia_cod = p.provincia_cod

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d04_comune c
 right
  join d04_provincia p
    on c.provincia_cod = p.provincia_cod

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d04_comune c
  full
  join d04_provincia p
    on c.provincia_cod = p.provincia_cod

insert 
  into d04_comune 
       (comune,provincia_cod)
values ('Arese','MI')

insert 
  into d04_provincia
       (provincia_cod,provincia)
values ('MI','Milano (doppio)')

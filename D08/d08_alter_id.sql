alter table d08_tipo_prodotto
modify id generated by default on null as identity restart start with 1000;

alter table d08_prodotto
modify id generated by default on null as identity restart start with 1000;

alter table d08_cliente
modify id generated by default on null as identity restart start with 1000;

alter table d08_fornitore
modify id generated by default on null as identity restart start with 1000;

alter table d08_acquisto
modify id generated by default on null as identity restart start with 1000;

alter table d08_vendita
modify id generated by default on null as identity restart start with 1000;

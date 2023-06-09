ALTER TABLE  "D08_VENDITA" DROP CONSTRAINT "D08_VENDITA_PRODOTTO_ID_FK";
ALTER TABLE  "D08_VENDITA" ADD CONSTRAINT "D08_VENDITA_PRODOTTO_ID_FK" FOREIGN KEY ("PRODOTTO_ID") REFERENCES  "D08_PRODOTTO" ("ID");

ALTER TABLE  "D08_PRODOTTO" DROP CONSTRAINT "D08_PRODOTTO_TIPO_PRODOTTO_FK";
ALTER TABLE  "D08_PRODOTTO" ADD CONSTRAINT "D08_PRODOTTO_TIPO_PRODOTTO_FK" FOREIGN KEY ("TIPO_PRODOTTO_ID") REFERENCES  "D08_TIPO_PRODOTTO" ("ID");

ALTER TABLE  "D08_ACQUISTO" DROP CONSTRAINT "D08_ACQUISTO_PRODOTTO_ID_FK";
ALTER TABLE  "D08_ACQUISTO" ADD CONSTRAINT "D08_ACQUISTO_PRODOTTO_ID_FK" FOREIGN KEY ("PRODOTTO_ID") REFERENCES  "D08_PRODOTTO" ("ID");

----------------------------------------------------------------------

--Processo Vendita con esegui codice
begin
apex_debug.message(:APEX$ROW_STATUS);
if :APEX$ROW_STATUS = 'U' then
  update D08_VENDITA set CLIENTE_ID=:CLIENTE_ID,
       PRODOTTO_ID=:PRODOTTO_ID,
       DATA=:DATA,
       QUANTITA=:QUANTITA
        where id = :ID;
elsif :APEX$ROW_STATUS = 'D' then
  delete from  D08_VENDITA where id = :ID;
elsif :APEX$ROW_STATUS = 'C' then
  insert into  D08_VENDITA (CLIENTE_ID, PRODOTTO_ID, DATA, QUANTITA) 
                values (:CLIENTE_ID,:PRODOTTO_ID,:DATA,:QUANTITA)
        returning id into :ID;
end if;
end;

----------------------------------------------------------------------

--Processo Tipo PRODOTTO_ID
declare
cnt   number;
begin
  
case :APEX$ROW_STATUS 
  when 'U' then
  update D08_TIPO_PRODOTTO set 
       TIPO_PRODOTTO = :TIPO_PRODOTTO,
       GRUPPO = :GRUPPO
       where ID = :ID;
  when 'D' then
     select count(*)
       into cnt
       from D08_PRODOTTO
       where tipo_prodotto_id = :ID;

        if cnt>0 then
          raise_application_error(-20001,'Il tipo prodotto '||:ID||' ha delle righe figlie');
        end if;


  when 'C' then
      insert into D08_TIPO_PRODOTTO (TIPO_PRODOTTO, GRUPPO) values (:TIPO_PRODOTTO,:GRUPPO)
      return id into :ID;
  end case;

end;

----------------------------------------------------------------------

Convalida
declare
  cnt  number;
begin
apex_debug.message(:APEX$ROW_STATUS);
  if :APEX$ROW_STATUS = 'D' then
    select count(*) into cnt from d08_prodotto where tipo_prodotto_id = :ID;
    if cnt>0 then
      return false;
    end if;
  end if;
  return true;

end;




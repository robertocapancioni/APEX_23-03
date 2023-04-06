BEGIN 
    DBMS_OUTPUT.put_line ('Hello World!'); 
END;
/

DECLARE 
   l_message VARCHAR2( 255 ) := 'Hello World!'; 
BEGIN 
   DBMS_OUTPUT.PUT_LINE( l_message ); 
END;
/

DECLARE
      V_RESULT NUMBER;
BEGIN
   V_RESULT := 1 / 0;
   EXCEPTION
     WHEN ZERO_DIVIDE THEN
         DBMS_OUTPUT.PUT_LINE('Non puoi dividere per zero');
     WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE( SQLERRM );
END;
/

DECLARE 
  l_venduto NUMBER := 100000; 
BEGIN 
   IF l_venduto > 100000 THEN 
      DBMS_OUTPUT.PUT_LINE( 'Venduto > 100k ' ); 
   ELSIF l_venduto > 50000 THEN 
      DBMS_OUTPUT.PUT_LINE( 'Venduto > 50k ' ); 
   ELSE
      DBMS_OUTPUT.PUT_LINE( 'Venduto <= 50k ' ); 
   END IF; 
END;
/

DECLARE
  l_voto CHAR( 1 );
  l_giudizio  VARCHAR2( 20 );
BEGIN
  l_voto := 'B';
  CASE l_voto
  WHEN 'A' THEN
    l_giudizio := 'Eccellente' ;
  WHEN 'B' THEN
    l_giudizio := 'Ottimo' ;
  WHEN 'C' THEN
    l_giudizio := 'Buono' ;
  WHEN 'D' THEN
    l_giudizio := 'Sufficiente' ;
  WHEN 'F' THEN
    l_giudizio := 'Insufficiente' ;
  ELSE
    l_giudizio := 'Scarso' ;
  END CASE;
  DBMS_OUTPUT.PUT_LINE( l_giudizio );
END;
/

DECLARE
  l_venduto      NUMBER;
  l_commissione NUMBER;
BEGIN
  l_venduto := 150000;
  CASE
  WHEN l_venduto    > 200000 THEN
    l_commissione := 0.2;
  WHEN l_venduto   >= 100000 AND l_venduto < 200000 THEN
    l_commissione := 0.15;
  WHEN l_venduto   >= 50000 AND l_venduto < 100000 THEN
    l_commissione := 0.1;
  WHEN l_venduto    > 30000 THEN
    l_commissione := 0.05;
  ELSE
    l_commissione := 0;
  END CASE;

  DBMS_OUTPUT.PUT_LINE( 'Commissioni:  ' || l_commissione * 100 || '%'
  );
END;
/

BEGIN
  for c in (select level numero from dual connect by level <=10)
  loop
     DBMS_OUTPUT.PUT_LINE( 'Numero-->  ' || c.numero  );
  end loop;
END;
/

CREATE OR REPLACE PROCEDURE D06_VENDUTO (
                                         p_venduto IN number default 0
                                        )
IS
BEGIN
   IF p_venduto > 100000 THEN 
      DBMS_OUTPUT.PUT_LINE( 'Venduto > 100k ' ); 
   ELSIF p_venduto > 50000 THEN 
      DBMS_OUTPUT.PUT_LINE( 'Venduto > 50k ' ); 
   ELSE
      DBMS_OUTPUT.PUT_LINE( 'Venduto <= 50k ' ); 
   END IF; 
END;
/

BEGIN
  D06_VENDUTO(p_venduto => 100000);
END;
/

CREATE OR REPLACE FUNCTION D06_GET_VENDUTO (
                                         p_venduto IN number default 0
                                        )
                                        RETURN VARCHAR2
IS
l_return VARCHAR2(100);
BEGIN
   IF p_venduto > 100000 THEN 
      l_return := 'Venduto > 100k '; 
   ELSIF p_venduto > 50000 THEN 
      l_return := 'Venduto > 50k '; 
   ELSE
      l_return := 'Venduto <= 50k '; 
   END IF; 
   RETURN l_return;
END;
/

DECLARE
l_venduto VARCHAR2(100) := null;
BEGIN
  l_venduto := D06_GET_VENDUTO(p_venduto => 100000); 
  DBMS_OUTPUT.PUT_LINE( l_venduto );
END;
/

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


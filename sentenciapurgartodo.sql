BEGIN
  -- 1. Borrar Tablas (usando PURGE para que no vayan a la papelera)
  FOR t IN (SELECT table_name FROM user_tables) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE "' || t.table_name || '" CASCADE CONSTRAINTS PURGE';
  END LOOP;

  -- 2. Borrar Secuencias
  FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE "' || s.sequence_name || '"';
  END LOOP;

  -- 3. Borrar Vistas
  FOR v IN (SELECT view_name FROM user_views) LOOP
    EXECUTE IMMEDIATE 'DROP VIEW "' || v.view_name || '"';
  END LOOP;

  -- 4. Borrar Procedimientos, Funciones y Paquetes
  FOR p IN (SELECT object_name, object_type FROM user_objects 
            WHERE object_type IN ('PROCEDURE', 'FUNCTION', 'PACKAGE')) LOOP
    EXECUTE IMMEDIATE 'DROP ' || p.object_type || ' "' || p.object_name || '"';
  END LOOP;

  -- 5. Borrar Sinónimos
  FOR s IN (SELECT synonym_name FROM user_synonyms) LOOP
    EXECUTE IMMEDIATE 'DROP SYNONYM "' || s.synonym_name || '"';
  END LOOP;
  
  COMMIT;
END;
/

-- COMANDO FINAL: Vaciar cualquier cosa que quedara de antes en la papelera
PURGE RECYCLEBIN;

-- Confirmación visual
PROMPT Sistema limpio y papelera vaciada.
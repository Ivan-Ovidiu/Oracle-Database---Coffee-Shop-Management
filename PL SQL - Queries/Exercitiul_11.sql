CREATE OR REPLACE TRIGGER plati_clienti_comanda
AFTER UPDATE OR DELETE ON Comenzi
FOR EACH ROW
DECLARE
    v_suma_veche NUMBER(10, 2);
    v_suma_noua NUMBER(10, 2);
    v_comenzi_count INT;
BEGIN
    -- In cazul unui UPDATE
    IF UPDATING AND (:OLD.ID_Client != :NEW.ID_Client OR :OLD.ID_Comanda != :NEW.ID_Comanda) THEN       
        DBMS_OUTPUT.PUT_LINE('UPDATE detectat: Comanda ' || :OLD.ID_Comanda || ' a fost modificata.');

        -- Suma comenzii vechi
        SELECT SUM(b.pret)
        INTO v_suma_veche
        FROM Comenzi_contin_bauturi cb
        JOIN Bauturi b ON cb.ID_Bautura = b.ID_Bautura
        WHERE cb.ID_Comanda = :OLD.ID_Comanda;

        -- Suma comenzii noi
        SELECT SUM(b.pret)
        INTO v_suma_noua
        FROM Comenzi_contin_bauturi cb
        JOIN Bauturi b ON cb.ID_Bautura = b.ID_Bautura
        WHERE cb.ID_Comanda = :NEW.ID_Comanda;

        -- Actualizeaza suma clientului vechi
        UPDATE Clienti  
        SET suma_totala = suma_totala - NVL(v_suma_veche, 0) 
        WHERE ID_Clienti = :OLD.ID_Client;

        DBMS_OUTPUT.PUT_LINE('Clientul vechi cu id-ul ' || :OLD.ID_Client || ' a fost actualizat: suma scazuta cu ' || NVL(v_suma_veche, 0) || ' RON.');

        -- Actualizeaza suma clientului nou
        UPDATE Clienti  
        SET suma_totala = suma_totala - NVL(v_suma_veche, 0) + NVL(v_suma_noua, 0)
        WHERE ID_Clienti = :NEW.ID_Client;

        DBMS_OUTPUT.PUT_LINE('Clientul nou cu id-ul ' || :NEW.ID_Client || ' a fost actualizat: suma adaugata cu ' || NVL(v_suma_noua, 0) || ' RON.');
    END IF;

    -- In cazul unui DELETE
    IF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('DELETE detectat: Comanda ' || :OLD.ID_Comanda || ' a fost stearsa.');

        -- Suma comenzii vechi
        SELECT SUM(b.pret)
        INTO v_suma_veche
        FROM Comenzi_contin_bauturi cb
        JOIN Bauturi b ON cb.ID_Bautura = b.ID_Bautura
        WHERE cb.ID_Comanda = :OLD.ID_Comanda;

        -- Actualizeaza suma clientului
        UPDATE Clienti  
        SET suma_totala = suma_totala - NVL(v_suma_veche, 0) 
        WHERE ID_Clienti = :OLD.ID_Client;

        DBMS_OUTPUT.PUT_LINE('Clientul cu id-ul ' || :OLD.ID_Client || ' a fost actualizat: suma scazuta cu ' || NVL(v_suma_veche, 0) || ' RON.');

        -- Verifica daca mai exista comenzi pentru client
        SELECT COUNT(*) INTO v_comenzi_count
        FROM Comenzi
        WHERE ID_Client = :OLD.ID_Client;

        IF v_comenzi_count = 0 THEN
            DELETE FROM Clienti
            WHERE ID_Clienti = :OLD.ID_Client;

            DBMS_OUTPUT.PUT_LINE('Clientul cu id-ul ' || :OLD.ID_Client || ' a fost sters deoarece nu mai are comenzi.');
        END IF;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: Nicio comanda gasita pentru client.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Alta eroare: ' || SQLERRM);
END;
/

UPDATE COMENZI
SET id_client = 1
WHERE ID_Comanda = 3 ;

select * from plati_clienti_comanda;
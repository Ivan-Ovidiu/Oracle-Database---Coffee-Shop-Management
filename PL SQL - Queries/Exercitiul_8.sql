CREATE OR REPLACE FUNCTION Situatie_client
(p_ID_Client IN Clienti.ID_Clienti%TYPE) RETURN VARCHAR2

IS
--Variabile
    v_total_suma Plati.suma%TYPE := 0;
    v_cel_mai_recent_angajat VARCHAR2(255);
    v_rezultat VARCHAR2(1000);
BEGIN
    --Aici selectez suma totala si angajatul care a procesat comanda( cel mai recent)
    SELECT SUM(p.suma), a.nume || ' ' || a.prenume
    INTO v_total_suma, v_cel_mai_recent_angajat
    FROM Plati p
    JOIN Comenzi c ON p.ID_Client = c.ID_Client
    JOIN Angajati a ON c.ID_Angajat = a.ID_Angajat
    WHERE p.ID_Client = p_ID_Client
    GROUP BY a.nume, a.prenume
    ORDER BY MAX(c.data_comanda) DESC;

    v_rezultat := 'Suma totala platita: ' || v_total_suma || ' RON. Angajatul cel mai recent implicat: ' || v_cel_mai_recent_angajat;

    RETURN v_rezultat;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        RETURN 'EROARE: Nu exista inregistrari pentru clientul cu ID-ul ' || p_ID_Client || '.';
    WHEN TOO_MANY_ROWS THEN
        RETURN 'EROARE: Interogarea a returnat prea multe randuri pentru clientul cu ID-ul ' || p_ID_Client || '.';
    WHEN OTHERS THEN
        RETURN 'ALTA EROARE: ' || SQLERRM;
END;
/

DECLARE
    v_result VARCHAR2(1000);
BEGIN
    -- Caz bun
    v_result := Situatie_client(2);
    DBMS_OUTPUT.PUT_LINE(v_result);

    -- Caz NO_DATA_FOUND
    v_result := Situatie_client(999);
    DBMS_OUTPUT.PUT_LINE(v_result);

    -- Caz TOO_MANY_ROWS 
    v_result := Situatie_client(1);
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/

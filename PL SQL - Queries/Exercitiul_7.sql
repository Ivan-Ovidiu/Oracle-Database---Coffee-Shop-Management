
CREATE OR REPLACE PROCEDURE raport_clienti
AS
    
    CURSOR cli IS
    SELECT id_clienti,nume,prenume
    FROM CLIENTI;

 CURSOR date_clienti IS -- Acest cursor il folosesc pentru a determina date despre fiecare client conform cerintei
    SELECT
        C.nume AS Nume_client,
        C.prenume AS Prenume_client,
        C.id_clienti AS id_client,
        SUM(P.suma) AS Suma_platita,
        P.metoda AS Metoda_plata
        
    FROM clienti C
    LEFT JOIN 
        Plati P ON P.ID_client = C.ID_Clienti
    GROUP BY C.nume, C.prenume, C.id_clienti, P.metoda;
    
    
    CURSOR date_bauturi(p_client INT)  IS  --Acest cursor il folosesc pentru a determina bauturile si numarul acestora comandate de fiecare client
    SELECT 
        B.nume AS Nume_bautura,
        COUNT(*) AS Numar_bauturi
    FROM comenzi C
    LEFT JOIN 
        comenzi_contin_bauturi CC ON CC.ID_Comanda = C.ID_Comanda
    LEFT JOIN
        bauturi B ON B.ID_Bautura = CC.ID_Bautura
    WHERE ID_Client = p_client
    GROUP BY nume;
    
--Variabile
  
  ok NUMBER(2);
  METODA VARCHAR(50);
  
TYPE ang IS RECORD(  
         Nume_client clienti.nume%TYPE,
        Prenume_client clienti.prenume%TYPE,
        id_client clienti.id_clienti%TYPE,
        Total_suma_platita NUMBER(10, 2),
        Metoda_plata plati.metoda%TYPE
);

 TYPE tabel_clienti IS TABLE OF ang;

    tabel_date_clienti tabel_clienti;

BEGIN


    OPEN date_clienti;  --Introduc in tabel toate informatiile angajatilor din cursorul date_clienti pe cate o pozitie 
    FETCH date_clienti BULK COLLECT INTO  tabel_date_clienti;
    CLOSE date_clienti;
    
    FOR j in cli LOOP
        ok := 0;
        FOR i IN tabel_date_clienti.FIRST .. tabel_date_clienti.LAST LOOP
      
            metoda := tabel_date_clienti(i).Metoda_plata;
            IF j.id_clienti = tabel_date_clienti(i).id_client AND  tabel_date_clienti(i).Metoda_plata IS NOT NULL THEN --Identific clientul si daca acesta are macar o plata facut , in caz afirmativ afisez
            IF ok = 0 THEN
             DBMS_OUTPUT.PUT_LINE('Client: ' || tabel_date_clienti(i).Nume_client || ' ' || tabel_date_clienti(i).Prenume_client);
             FOR d IN date_bauturi(tabel_date_clienti(i).id_client) LOOP
                DBMS_OUTPUT.PUT_LINE('A comandat bautura ' || d.Nume_bautura || ' de ' || d.Numar_bauturi || ' ori');
             END LOOP;
             ok := 1;
            END IF;
            
                DBMS_OUTPUT.PUT_LINE('Metoda: ' || tabel_date_clienti(i).Metoda_plata);
                DBMS_OUTPUT.PUT_LINE('  Total suma plătită: ' || tabel_date_clienti(i).Total_suma_platita || ' lei');    
            END IF;
        END LOOP;
         DBMS_OUTPUT.PUT_LINE('---------------------------------------');
         
         IF metoda IS  NULL THEN
         DBMS_OUTPUT.PUT_LINE('Client: ' || j.nume || ' ' || j.prenume || ' NU ARE PLATI INREGISTRATE');
         END IF;
  END LOOP;

END;
/

BEGIN
    raport_clienti;
END;
/
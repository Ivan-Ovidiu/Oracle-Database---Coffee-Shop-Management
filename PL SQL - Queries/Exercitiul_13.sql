
CREATE OR REPLACE PACKAGE gestionare_bonusuri_comenzi AS

    -- Tipuri de date complexe
    TYPE bon_date IS RECORD(
    client_nume VARCHAR2(255),
    client_prenume VARCHAR2(255),
    angajat_nume VARCHAR2(255),
    angajat_prenume VARCHAR2(255),
    bauturi VARCHAR2(4000),
    suma_plata   NUMBER(10, 2),
    data_comanda DATE
    );

    CURSOR nume_bauturi IS
        SELECT
            C.id_comanda,
            C.data_comanda,
            B.nume
        FROM COMENZI C
        JOIN COMENZI_CONTIN_BAUTURI ccb ON ccb.ID_COMANDA = C.ID_COMANDA
        JOIN BAUTURI B ON ccb.ID_BAUTURA = B.ID_BAUTURA
        GROUP BY B.nume,C.id_comanda,C.data_comanda;


    TYPE IduriComanda IS TABLE OF INT;
    TYPE tabel_bon IS TABLE OF bon_date;

    --Functii
 FUNCTION CalculeazaPretComanda(idul_comenzii IN INT) RETURN NUMBER;
FUNCTION ComparaBonuri(data_start IN DATE, data_final IN DATE) RETURN BON_DATE;

    --Proceduri
    PROCEDURE GenereazaBonFiscal(idul_comenzii IN INT);
    PROCEDURE AfisareBonuri (iduri IN IduriComanda);

END gestionare_bonusuri_comenzi;
/

CREATE OR REPLACE PACKAGE BODY gestionare_bonusuri_comenzi AS

    FUNCTION ComparaBonuri(data_start IN DATE, data_final IN DATE) RETURN BON_DATE IS
        bonuri tabel_bon := tabel_bon(); 
        bon_cel_mai_scump bon_date;    
        bon_client_frecvent bon_date;   
        max_suma NUMBER(10, 2) := 0;
        client_max_bonuri VARCHAR2(255);
        ok NUMBER(2) := 0;
        bautura VARCHAR(400);
    BEGIN
        FOR bon_rec IN ( --aici selectez toate datele care se afla pe un bon si le pun in nested table de tipul bon_date in ordine descrescatoare dupa pretul comenzii
            SELECT cl.nume AS client_nume,
                   cl.prenume AS client_prenume,
                   ag.nume AS angajat_nume,
                   ag.prenume AS angajat_prenume,
                   SUM(b.pret) AS suma_plata,
                   c.data_comanda
            FROM Comenzi c
                     JOIN Clienti cl ON c.ID_Client = cl.ID_Clienti
                     JOIN Angajati ag ON c.ID_Angajat = ag.ID_Angajat
                     JOIN Comenzi_contin_bauturi ccb ON c.ID_Comanda = ccb.ID_Comanda
                     JOIN Bauturi b ON ccb.ID_Bautura = b.ID_Bautura
            GROUP BY cl.nume, cl.prenume, ag.nume, ag.prenume, c.data_comanda
            ORDER BY SUM(b.pret) DESC
            ) LOOP
            IF ( bon_rec.DATA_COMANDA >= data_start AND bon_rec.DATA_COMANDA <= data_final ) THEN -- Daca
                bonuri.EXTEND(1);
                bonuri(bonuri.COUNT) := bon_date(
                        client_nume => bon_rec.client_nume,
                        client_prenume => bon_rec.client_prenume,
                        angajat_nume => bon_rec.angajat_nume,
                        angajat_prenume => bon_rec.angajat_prenume,
                        suma_plata => bon_rec.suma_plata,
                        data_comanda => bon_rec.data_comanda);
                        
                FOR baut IN nume_bauturi LOOP  -- aici mai adaug si separat bauturile
                IF baut.data_comanda = bon_rec.data_comanda THEN
                    OK := 1;
                bautura := bautura || baut.nume || ', ';
                
            END IF;
        END LOOP;
        IF OK = 0 THEN  -- daca nu exista nicio bautura se va pune un mesaj coresp
            bautura := 'Nicio bautura';
        end if;
        bonuri(bonuri.COUNT).bauturi := bautura;
            
             END IF;
     END LOOP;
            
        
        IF bonuri.COUNT > 0 THEN -- Daca exista cel putin un bon altfel eroare
            RETURN bonuri(1);
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Niciun bon');
            
        END IF;

    END ComparaBonuri;

--##############################################################################--

FUNCTION CalculeazaPretComanda(idul_comenzii IN INT) RETURN NUMBER IS
    pret_total NUMBER(10, 2) := 0;
BEGIN
    SELECT SUM(b.pret)  --Aiici pretul bauturii
    INTO pret_total
    FROM Comenzi_contin_bauturi ccb
             JOIN Bauturi b ON ccb.ID_Bautura = b.ID_Bautura
    WHERE ccb.ID_Comanda = idul_comenzii;

    IF pret_total IS NULL THEN
        pret_total := 0;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Pretul total pentru comanda ' || idul_comenzii || ' este: ' || pret_total);
    RETURN pret_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RAISE;
END CalculeazaPretComanda;

--##############################################################################--

PROCEDURE GenereazaBonFiscal(idul_comenzii IN INT) IS
        id_bon INT;
        descriere bonuri.descriere%TYPE;
        bon_descriere bon_date;
        OK NUMBER(2) := 0;
        LINE_SEPARATOR VARCHAR2(100) := '----------------------------------------';
        LINE_SEPARATOR2 VARCHAR2(100) := '#######################################';


BEGIN

        id_bon := BONURI_SEQ.NEXTVAL;

    SELECT cl.nume AS client_nume,  --aici extrag toate datele pentru bon 
           cl.prenume AS client_prenume,
           ag.nume AS angajat_nume,
           ag.prenume AS angajat_prenume,
            c.data_comanda
    INTO bon_descriere.client_nume,
            bon_descriere.client_prenume,
           bon_descriere.angajat_nume,
           bon_descriere.angajat_prenume,
           bon_descriere.data_comanda
    FROM Comenzi c
        JOIN Clienti cl ON c.ID_Client = cl.ID_Clienti
        JOIN Angajati ag ON c.ID_Angajat = ag.ID_Angajat
        LEFT JOIN Comenzi_contin_bauturi ccb ON c.ID_Comanda = ccb.ID_Comanda
        LEFT JOIN Bauturi b ON ccb.ID_Bautura = b.ID_Bautura
    WHERE c.ID_Comanda = idul_comenzii
    GROUP BY cl.nume, cl.prenume, ag.nume, ag.prenume, c.data_comanda;

        FOR baut IN nume_bauturi LOOP  --Iar aici pun bauturile
            IF baut.id_comanda = idul_comenzii THEN
                OK := 1;
            bon_descriere.bauturi := bon_descriere.bauturi || baut.nume || ', ';
            END IF;
        END LOOP;
        IF OK = 0 THEN
            bon_descriere.bauturi := 'Nicio bautura';
        end if;

        bon_descriere.suma_plata := CalculeazaPretComanda(idul_comenzii);


        descriere := CHR(10) || LINE_SEPARATOR2 || CHR(10) ||   -- aici formez bonul
                     '             BON FISCAL (Comanda '|| idul_comenzii || ')'   || CHR(10) ||
                     LINE_SEPARATOR || CHR(10) ||
                     'Client: ' || bon_descriere.client_nume || ' ' || bon_descriere.client_prenume || CHR(10) ||
                     'Angajat: ' || bon_descriere.angajat_nume || ' ' || bon_descriere.angajat_prenume || CHR(10) ||
                     'Data:    ' || TO_CHAR(bon_descriere.data_comanda, 'DD-MM-YYYY') || CHR(10) ||
                     LINE_SEPARATOR || CHR(10) ||
                     'Bauturi:' || CHR(10) ||
                     bon_descriere.bauturi || CHR(10) ||
                     LINE_SEPARATOR || CHR(10) ||
                     'TOTAL:   ' || TO_CHAR(bon_descriere.suma_plata, '999,990.00') || ' RON' || CHR(10) ||
                     LINE_SEPARATOR2;



        INSERT INTO Bonuri (ID_Bon, Data_Bon, ID_Comanda,DESCRIERE)VALUES (id_bon, bon_descriere.data_comanda, idul_comenzii, descriere);

    -- Se poate adauga si logica pentru actualizarea stocurilor, daca e cazul.
    END GenereazaBonFiscal;


--#########################################################---------

PROCEDURE AfisareBonuri (iduri IN IduriComanda) IS
        descriere_afis bonuri.descriere%TYPE;
    BEGIN

        FOR i IN iduri.FIRST..iduri.LAST LOOP
         BEGIN
                SELECT descriere
                INTO descriere_afis
                FROM BONURI
                WHERE iduri(i) = ID_Comanda;
        DBMS_OUTPUT.PUT_LINE(descriere_afis);
        
         EXCEPTION
            WHEN NO_DATA_FOUND THEN --eroare ca nu gaseste comanda dupa id
                
                RAISE_APPLICATION_ERROR( -20001,'Comanda cu ID-UL ' || iduri(i) || ' nu a fost gasita.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20002,'Eroare la afisarea comenzii ' || iduri(i) || ': ' || SQLERRM
                );
                END;
        END LOOP;
        
    END AfisareBonuri;

END gestionare_bonusuri_comenzi;
/



--ZONA DE EXECUTARE--


DECLARE
    iduri_comenzi gestionare_bonusuri_comenzi.IduriComanda;
     bon  gestionare_bonusuri_comenzi.bon_date;

    v_client_id INT;
    v_angajat_id INT;
    v_bautura_id INT;
    v_comanda_id INT;
     v_data_comanda DATE := SYSDATE;

 exceptie_unicitate EXCEPTION;
 PRAGMA EXCEPTION_INIT(exceptie_unicitate, -1);
BEGIN
    v_client_id := &ID_CLIENT;
    v_angajat_id := &ID_ANGAJAT;
    v_comanda_id := &ID_COMANDA;
    v_bautura_id := &ID_BAUTURA;
  
    
    BEGIN  --inserez datele mai intai in comenzi si dupa in comenzi contin bauturi
        INSERT INTO Comenzi (ID_Comanda, ID_Client, ID_Angajat, Data_Comanda)VALUES (v_comanda_id, v_client_id, v_angajat_id, v_data_comanda);
    END;
    BEGIN
        INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura)VALUES (v_comanda_id, v_bautura_id);
    END;

    --Aici generez bonul fiscal
     gestionare_bonusuri_comenzi.GenereazaBonFiscal(v_comanda_id);
    DBMS_OUTPUT.PUT_LINE('Bonul fiscal pentru comanda ' || v_comanda_id || ' a fost generat.');
    
    --Aici il afisez    
     iduri_comenzi := gestionare_bonusuri_comenzi.IduriComanda(v_comanda_id);
    gestionare_bonusuri_comenzi.AFISAREBONURI(iduri_comenzi);
    
    
    --Aici obtin comanda cu cel mai mare pret dintre doua date specificate
    bon := gestionare_bonusuri_comenzi.ComparaBonuri(TO_DATE('15-01-2024','DD-MM-YYYY'),SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Bonul cu cea mai mare suma:' ||  CHR(10) ||'Client:' || bon.client_nume ||  CHR(10) ||'Angajat: ' || bon.client_prenume || ' ' 
    || bon.angajat_nume || CHR(10)|| 'Bauturi: ' || bon.bauturi ||  CHR(10) || 'In valoare de ' 
    || bon.suma_plata || CHR(10)|| 'In data de ' || bon.data_comanda);
        
EXCEPTION --exceptie cand comanda exista deja
    WHEN exceptie_unicitate THEN
        DBMS_OUTPUT.PUT_LINE('COMANDA CU ID-UL ' || v_comanda_id || ' EXISTA DEJA!!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Alta eroare' || SQLERRM);
END;
/






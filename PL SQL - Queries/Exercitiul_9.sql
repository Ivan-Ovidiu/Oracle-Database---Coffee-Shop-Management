

CREATE OR REPLACE PROCEDURE alocare_bonus_angajati(
    data_start IN DATE,
    data_final IN DATE,
    valoare_prag IN NUMBER
)AS

niciun_angajat EXCEPTION;
prag_nedepasit_de_nimeni EXCEPTION;

TYPE ang IS RECORD
(
    valoare_totala NUMBER(10,2),
    nume_angajat VARCHAR(50),
    id_angajat NUMBER
);

TYPE bon IS RECORD
(
    id_angajat INT,
    tip_bonus VARCHAR(50),
    procent NUMBER(10,2)

);
--Nested tables pentru stocarea datelor din crusoare si gestionarea acestora
TYPE t_date_angajati IS TABLE OF ang;
TYPE t_angajati_bonusuri IS TABLE OF bon;

date_angajati t_date_angajati;
angajati_bonusuri t_angajati_bonusuri;

CURSOR verif_angajati IS -- Acest cursor l am folosit pur si simlu pentru verificarea exceptiei
    SELECT
        A.id_angajat
     FROM ANGAJATI A
    LEFT JOIN COMENZI C ON C.ID_angajat = A.id_angajat
     WHERE C.data_comanda BETWEEN data_start AND data_final;

CURSOR conditie_ang IS -- Cursor pentru a obtine datele relevante depsre angajati ex: suma totala cu care a contribuit fiecare in perioada specificata
    SELECT
    SUM(B.pret) AS valoare_totala,
    A.nume || ' ' || A.prenume AS Nume_angajat,
    A.id_angajat 
    FROM ANGAJATI A
    LEFT JOIN COMENZI C ON C.ID_angajat = A.id_angajat
    LEFT JOIN COMENZI_CONTIN_BAUTURI CC ON CC.ID_comanda = C.ID_comanda
    LEFT JOIN BAUTURI B ON B.ID_bautura = CC.ID_bautura
    JOIN BONUSURI_ANGAJATI BA ON BA.ID_ANGAJAT = A.ID_ANGAJAT
    WHERE C.data_comanda BETWEEN data_start AND data_final
    GROUP BY A.ID_angajat, A.nume, A.prenume
    HAVING SUM(B.pret) > valoare_prag;
    
CURSOR bonus IS --Cursor pentru a vedea ce bonusuri au fiecare angajat
    SELECT 
        A.id_angajat,
        tip_bonus,
        procent
    FROM BONUSURI B
     JOIN  BONUSURI_ANGAJATI BA ON BA.id_bonus = B.id_bonus
     JOIN ANGAJATI A ON A.id_angajat = BA.id_angajat;
    
--Variabile
v_conditie_ang conditie_ang%ROWTYPE;
v_verif_ang verif_angajati%ROWTYPE;

BEGIN
    OPEN verif_angajati;        --Aici inserez o linie din cursor ca sa vad daca exista macar un angajat
    FETCH verif_angajati INTO v_verif_ang;
    
    IF verif_angajati%NOTFOUND THEN
        RAISE niciun_angajat;
    END IF;
    
    CLOSE verif_angajati; -- Aici inserez o linie din cursor dsa vad daca macar cineva a depasit pragul minim dintre angajati existenti in perioada specificata
    
    OPEN conditie_ang;
    FETCH conditie_ang INTO v_conditie_ang;
    
    IF conditie_ang%NOTFOUND THEN
    RAISE prag_nedepasit_de_nimeni;
    END IF;
    
    CLOSE conditie_ang;
    
    OPEN conditie_ang;  --Introduc in tabel toate informatiile angajatilor din cursorul date_clienti pe cate o pozitie 
    FETCH conditie_ang BULK COLLECT INTO  date_angajati;
    CLOSE conditie_ang; 
    
    OPEN bonus;
    FETCH bonus BULK COLLECT INTO angajati_bonusuri;
    CLOSE bonus;
    
FOR i IN 1 .. date_angajati.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Angajatul ' || date_angajati(i).nume_angajat || ' cu vanzari in valoare de ' || date_angajati(i).valoare_totala || 'RON, in perioada ' || TO_CHAR(data_start, 'DD-MM-YYYY') || 
                         ' - ' || TO_CHAR(data_final, 'DD-MM-YYYY') );
    
    FOR j IN 1 .. angajati_bonusuri.COUNT LOOP--aici parcurg nested table-ul angajati_bonusri care este de tip bon
        IF angajati_bonusuri(j).id_angajat = date_angajati(i).id_angajat THEN --Daca angajatul are un anumit bonus si indeplineste conditiile impuse acesta va primi masura cuvenita
            IF angajati_bonusuri(j).tip_bonus = 'Performance Bonus' THEN
                UPDATE ANGAJATI
                SET salariu = salariu + salariu * angajati_bonusuri(j).procent/100
                WHERE id_angajat = angajati_bonusuri(j).id_angajat;
                DBMS_OUTPUT.PUT_LINE(' - A primit o marire de ' || angajati_bonusuri(j).procent || '% pentru bonusul Performance Bonus.');

            ELSIF angajati_bonusuri(j).tip_bonus = 'Customer Satisfaction' THEN
                UPDATE ANGAJATI
                SET salariu = salariu + salariu * angajati_bonusuri(j).procent/100
                WHERE id_angajat = angajati_bonusuri(j).id_angajat;
                DBMS_OUTPUT.PUT_LINE(' - A primit o marire de ' || angajati_bonusuri(j).procent || '% pentru bonusul Customer Satisfaction.');

            ELSIF angajati_bonusuri(j).tip_bonus = 'Sales Bonus' THEN
                UPDATE ANGAJATI
                SET salariu = salariu + salariu * angajati_bonusuri(j).procent/100
                WHERE id_angajat = angajati_bonusuri(j).id_angajat;
                DBMS_OUTPUT.PUT_LINE(' - A primit o marire de ' || angajati_bonusuri(j).procent || '% pentru bonusul Sales Bonus.');

            ELSIF angajati_bonusuri(j).tip_bonus = 'Team Achievement' THEN
                UPDATE ANGAJATI
                SET salariu = salariu + salariu * angajati_bonusuri(j).procent/100
                WHERE id_angajat = angajati_bonusuri(j).id_angajat;
                DBMS_OUTPUT.PUT_LINE(' - A primit o marire de ' || angajati_bonusuri(j).procent || '% pentru bonusul Team Achievement.');

            END IF;
        END IF;
    END LOOP;
END LOOP;


EXCEPTION


WHEN niciun_angajat THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: Nu exista angajati in perioada specificata.');
 WHEN prag_nedepasit_de_nimeni THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: Nu exista angajati care au depasit pragul minim in perioada specificata.');


END;
/
--Caz bun
EXEC   alocare_bonus_angajati(TO_DATE('2024-01-15', 'YYYY-MM-DD'),TO_DATE('2024-02-20', 'YYYY-MM-DD'),23);

--Caz niciun angajat gasit
EXEC   alocare_bonus_angajati(TO_DATE('2022-01-15', 'YYYY-MM-DD'),TO_DATE('2022-02-20', 'YYYY-MM-DD'),23);


--Caz angajati gasiti dar nimeni nu a depasit pragul minim
EXEC   alocare_bonus_angajati(TO_DATE('2024-01-15', 'YYYY-MM-DD'),TO_DATE('2024-02-20', 'YYYY-MM-DD'),23000);

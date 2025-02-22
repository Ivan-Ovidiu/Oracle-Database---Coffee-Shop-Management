/*
CREATE OR REPLACE TYPE zile_vector AS VARRAY(8) OF VARCHAR2(20);
/
CREATE OR REPLACE TYPE frecventa AS VARRAY(8) OF NUMBER(2);
/
CREATE OR REPLACE TYPE lista_bauturi IS TABLE OF VARCHAR2(50);  --Aici am folosit nested table
/

*/
CREATE OR REPLACE PROCEDURE contributie
   
AS
 
 --De acesti 2 VARRAYS ma folosesc pentru a creea un vector de frecventa pentru zilele sptamanii   
    zile zile_vector := zile_vector('Luni', 'Marti', 'Miercuri', 'Joi', 'Vineri', 'Sambata', 'Duminica');
    zile_frecventa frecventa := frecventa(0,0,0,0,0,0,0);                                   
                            
    
    TYPE ang IS RECORD
    (
     nume angajati.nume%TYPE,
     prenume angajati.prenume%TYPE,
     venit_generat bauturi.pret%TYPE,
     l_bauturi lista_bauturi ,
     data_comanda comenzi.data_comanda%TYPE
    );
                                  
 --De acest INDEX TABLE ma folosesc pentru a stoca date despre fiecare angajat comform cerintei
   TYPE t_clasament_angajati IS TABLE OF ang INDEX BY PLS_INTEGER ; --Aici am folosit tabel indexat 
   clasament_angajati t_clasament_angajati := t_clasament_angajati();
    
   
   CURSOR nume_prenume IS
   SELECT nume,prenume
   FROM angajati;
   
   --Acest cursor selecteaza date din 4 tabele pentru a parcurge mai usor datele necesare angajatilor pe care le introduc 
   --ulterior in clasament_angajati care are ca tip de date RECORD-ul ang
   CURSOR date_bauturi_angajat IS
        SELECT 
            A.nume AS Nume_Angajat,
            A.prenume AS Prenume_Angajat,
            B.nume AS Nume_Bautura,
            B.pret AS Pret_Bautura,
            C.data_comanda AS Data_comanda
        FROM 
            Comenzi C
        INNER JOIN 
            Comenzi_contin_bauturi CB ON C.ID_Comanda = CB.ID_Comanda
        INNER JOIN 
            Bauturi B ON CB.ID_Bautura = B.ID_Bautura
        INNER JOIN 
            Angajati A ON C.ID_Angajat = A.ID_Angajat;
            
    CURSOR data_ziua IS
    SELECT
        A.nume AS Nume_Angajat,
        C.data_comanda AS Data_comanda
    FROM angajati A
    INNER JOIN
        comenzi C ON C.ID_Angajat = A.ID_Angajat;
    
    CURSOR angaj IS
    SELECT nume,prenume
    FROM angajati;
    
--Variabile
    idx INT :=0; --Il folosesc pentru initializarea tabelului indexat clasament_angajati
    ziua VARCHAR(50);
    cnt NUMBER(2);
    
    idx1 INT; --Il folosesc pentru vectorul de frecventa
    valoare_max NUMBER := 0;
    index_max NUMBER := 0;

BEGIN
--Initializez feicare angajat
    FOR n IN  nume_prenume LOOP
        idx := idx +1;
        clasament_angajati(idx).nume := n.nume;
        clasament_angajati(idx).prenume := n.prenume;
        clasament_angajati(idx).venit_generat := 0;
         clasament_angajati(idx).l_bauturi := lista_bauturi();
    END LOOP;

--Calculez pentru fiecare venitul generat din bauturile vandute
--Introduc in NESTED TABLE-ul l_bauturi , numele tuturor bauturilor vandute pentru a le afisa mai incolo
    FOR i IN 1..clasament_angajati.COUNT LOOP
        FOR d IN  date_bauturi_angajat LOOP
                IF d.Nume_Angajat = clasament_angajati(i).nume THEN
                   clasament_angajati(i).venit_generat :=  clasament_angajati(i).venit_generat + d.Pret_Bautura;
                   clasament_angajati(i).l_bauturi.EXTEND;
                   clasament_angajati(I).l_bauturi(clasament_angajati(i).l_bauturi.COUNT) := d.Nume_Bautura;
                END IF;
        END LOOP;
    END LOOP;
    
--In acest loop calculez vectorul de frecventa pentru zille saptamanii
     FOR a IN angaj LOOP
        zile_frecventa := frecventa(0,0,0,0,0,0,0); -- initializez de fiecare data cu 0 toate pozitiile
        valoare_max  := 0;
        index_max  := 0;
        FOR d IN data_ziua LOOP
            IF d.Nume_Angajat = a.nume THEN
              ziua := trim(to_char(d.Data_comanda, 'DAY')); -- am folosit trim pentru a ma asigura ca nu au spatii zilele saptamanii
              
               idx1 := CASE             --Acest case il folosesc pentru a determina ce pozitie a vectorului "zile frecventa" sa incrementez
                WHEN ziua = 'MONDAY' THEN 1
                WHEN ziua = 'TUESDAY' THEN 2
                WHEN ziua = 'WEDNESDAY' THEN 3
                WHEN ziua = 'THURSDAY' THEN 4
                WHEN ziua = 'FRIDAY' THEN 5
                WHEN ziua= 'SATURDAY' THEN 6
                WHEN ziua = 'SUNDAY' THEN 7
                ELSE NULL
                END;
                zile_frecventa(idx1) := zile_frecventa(idx1) +1;
            END IF;
        END LOOP;
        FOR i IN 1..zile_frecventa.COUNT LOOP
        IF zile_frecventa(i) > valoare_max THEN
            valoare_max := zile_frecventa(i);
            index_max := i;
        END IF;
    END LOOP;
    IF index_max > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Ziua din saptamana cu cele mai multe comenzi pentru ' || a.nume || ' ' || a.prenume || ' : ' || zile(index_max));
    ELSE
    DBMS_OUTPUT.PUT_LINE( a.nume || ' ' || a.prenume || ' NU ARE COMENZI');
    
    END IF;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE('---------------#########---------------');
         DBMS_OUTPUT.PUT_LINE(' ');

--Aici afisez pe rand toate datele obtinute despre angajati din index table ul clasament angajati        
    FOR i IN 1..clasament_angajati.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Angajat: ' || clasament_angajati(i).nume || ' ' || clasament_angajati(i).prenume);
        DBMS_OUTPUT.PUT_LINE('Venit Generat: ' || clasament_angajati(i).venit_generat || ' RON');
        IF clasament_angajati(i).l_bauturi.COUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Bauturi Vandute:');
            FOR j IN 1..clasament_angajati(i).l_bauturi.COUNT LOOP
                DBMS_OUTPUT.PUT_LINE('- ' || clasament_angajati(i).l_bauturi(j));
            END LOOP;
        ELSE
            DBMS_OUTPUT.PUT_LINE(' Nu a vandut nicio bautura');
        END IF;
        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
    END LOOP;


END;
/

EXEC contributie;
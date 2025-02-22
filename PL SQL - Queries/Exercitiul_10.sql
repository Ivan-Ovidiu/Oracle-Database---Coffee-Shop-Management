CREATE TABLE Statistici_Bauturi (
    id_statistici INT PRIMARY KEY,
    numar_total_bauturi INT,
    pret_mediu DECIMAL(10, 2)
);


CREATE OR REPLACE TRIGGER date_bauturi
AFTER INSERT ON Bauturi
DECLARE
   CURSOR c_bauturi IS 
        SELECT pret 
        FROM Bauturi;
 
    total_pret Number(10, 2) := 0;
    numar INT := 0;
    medie_pret Number(10, 2);
    pret_bautura Number(10, 2);

BEGIN
    
    OPEN c_bauturi;
    
    LOOP
    FETCH c_bauturi INTO pret_bautura;
        EXIT WHEN c_bauturi%NOTFOUND;
        
        total_pret := total_pret + pret_bautura;
        numar := numar + 1;
    END LOOP;
    CLOSE c_bauturi;
    
    -- Restrictie pret total
    IF total_pret > 1000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Pretul total al bauturilor depaseste limita de 1000');
    END IF;

    IF numar > 0 THEN
        medie_pret := total_pret / numar;
    END IF;

    UPDATE Statistici_Bauturi
    SET numar_total_bauturi = numar,
        pret_mediu = medie_pret
    WHERE id_statistici = 1;


END;
/



INSERT INTO Bauturi (ID_Bautura, nume, tip, pret) VALUES (21, 'Suc mangoo', 'Fresh', 18);
  
select * from statistici_bauturi;

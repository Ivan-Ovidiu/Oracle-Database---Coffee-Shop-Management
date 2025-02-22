CREATE TABLE Bonusuri
(
    ID_Bonus INT PRIMARY KEY,
    tip_bonus VARCHAR(255),
    procent NUMBER(10,2),
    suma NUMBER(4)
);


CREATE TABLE Bauturi (
    ID_Bautura INT PRIMARY KEY,
    nume VARCHAR(255) UNIQUE,
    tip VARCHAR(255) NOT NULL,
    pret DECIMAL(10, 2) NOT NULL
);
CREATE TABLE Clienti (
   ID_Clienti INT PRIMARY KEY,
   nume VARCHAR(255) UNIQUE,
   prenume VARCHAR(255) UNIQUE,
   email VARCHAR(255) UNIQUE 

);
CREATE TABLE Plati (
    ID_Plata INT PRIMARY KEY,
    data DATE NOT NULL,
    metoda VARCHAR(255) NOT NULL,
    suma DECIMAL(10, 2) NOT NULL,
    ID_Client INT NOT NULL,
   FOREIGN KEY (ID_Client) REFERENCES Clienti(ID_Clienti)
);

CREATE TABLE Angajati (
    ID_Angajat INT PRIMARY KEY,
    rol VARCHAR(255) NOT NULL,
    nume VARCHAR(255) UNIQUE,
    prenume VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE ,
    telefon VARCHAR(255) UNIQUE,
    salariu NUMBER(4)
);

CREATE TABLE Zile_lucrate (
    ID_Zile_lucrate INT PRIMARY KEY,
    ziua_data DATE NOT NULL,
    zi_inceput timestamp NOT NULL ,
    zi_final timestamp NOT NULL ,
    ID_Angajat INT,
    FOREIGN KEY(ID_Angajat) REFERENCES Angajati(ID_Angajat)
);

CREATE TABLE Produse (
    ID_Produs INT PRIMARY KEY,
    nume VARCHAR(255)UNIQUE ,
    pret DECIMAL(10, 2)NOT NULL,
    cantitate INT NOT NULL
);
CREATE TABLE Comenzi (
      ID_Comanda INT PRIMARY KEY,
      ID_Angajat INT,
      ID_Client INT,
      data_comanda DATE,
      FOREIGN KEY (ID_Angajat) REFERENCES Angajati(ID_Angajat),
      FOREIGN KEY (ID_Client) REFERENCES Clienti(ID_Clienti)
);

CREATE TABLE Bauturi_Produse (
    numar_produse INT,
    ID_Bautura INT,
    ID_Produs INT,
    PRIMARY KEY (ID_Bautura, ID_Produs),
    FOREIGN KEY (ID_Bautura) REFERENCES Bauturi(ID_Bautura),
    FOREIGN KEY (ID_Produs) REFERENCES Produse(ID_Produs)
);

CREATE TABLE Bonusuri_Angajati (
    data_bonus DATE NOT NULL,
    ID_Bonus INT,
    ID_Angajat INT,
    PRIMARY KEY (ID_Bonus,ID_Angajat),
    FOREIGN KEY (ID_Bonus) REFERENCES Bonusuri(ID_Bonus),
    FOREIGN KEY (ID_Angajat) REFERENCES Angajati(ID_Angajat)
);

CREATE TABLE Comenzi_contin_bauturi
(
ID_Comanda,
ID_Bautura,
PRIMARY KEY(ID_Comanda,ID_Bautura),
FOREIGN KEY (ID_Comanda) REFERENCES Comenzi(ID_Comanda),
FOREIGN KEY (ID_Bautura) REFERENCES Bauturi(ID_Bautura)
);
CREATE TABLE Bonuri (
    ID_Bon INT PRIMARY KEY,
    Data_Bon DATE NOT NULL,
    descriere VARCHAR(4000),
    ID_Comanda INT UNIQUE NOT NULL,
    FOREIGN KEY(ID_Comanda) REFERENCES Comenzi(ID_Comanda)
);


--Script pentru stergerea tuturor tabelelor

SELECT 'DROP TABLE ' || table_name || ' CASCADE CONSTRAINTS;' AS drop_statement
FROM user_tables;
BEGIN
   FOR rec IN (SELECT table_name FROM user_tables) LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || rec.table_name || ' CASCADE CONSTRAINTS';
   END LOOP;
END;
/


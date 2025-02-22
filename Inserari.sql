INSERT INTO Bonusuri (ID_Bonus, tip_bonus, procent, suma) VALUES (1, 'Performance Bonus', 10.50, 500);
INSERT INTO Bonusuri (ID_Bonus, tip_bonus, procent, suma) VALUES (2, 'Loyalty Bonus', 5.25, 250);
INSERT INTO Bonusuri (ID_Bonus, tip_bonus, procent, suma) VALUES (3, 'Sales Bonus', 15.75, 750);
INSERT INTO Bonusuri (ID_Bonus, tip_bonus, procent, suma) VALUES (4, 'Team Achievement', 12.30, 600);
INSERT INTO Bonusuri (ID_Bonus, tip_bonus, procent, suma) VALUES (5, 'Customer Satisfaction', 8.20, 400);

INSERT INTO Angajati (ID_Angajat, rol, nume, prenume, email, telefon, salariu) VALUES (1, 'Manager', 'Popescu', 'Ion', 'ion.popescu@coffeeshop.ro', '0712345678', 5000);
INSERT INTO Angajati (ID_Angajat, rol, prenume, nume, email, telefon, salariu) VALUES (2, 'Barista', 'Maria', 'Ionescu', 'maria.ionescu@coffeeshop.ro', '0723456789', 3500);
INSERT INTO Angajati (ID_Angajat, rol, prenume, nume, email, telefon, salariu) VALUES (3, 'Waiter', 'Dan', 'Cristea', 'dan.cristea@coffeeshop.ro', '0734567890', 3200);
INSERT INTO Angajati (ID_Angajat, rol, prenume, nume, email, telefon, salariu) VALUES (4, 'Cashier', 'Elena', 'Stancu', 'elena.stancu@coffeeshop.ro', '0745678901', 3300);
INSERT INTO Angajati (ID_Angajat, rol, prenume, nume, email, telefon, salariu) VALUES (5, 'Chef', 'Andreea', 'Moldovan', 'andreea.moldovan@coffeeshop.ro', '0756789012', 4000);
INSERT INTO Angajati (ID_Angajat, rol, prenume, nume, email, telefon, salariu) VALUES (6, 'Barista', 'Alex', 'Dragomir', 'alex.dragomir@coffeeshop.ro', '0767890123', 3600);
INSERT INTO Angajati (ID_Angajat, rol, prenume, nume, email, telefon, salariu) VALUES (7, 'Waiter', 'Mihai', 'Popa', 'mihai.popa@coffeeshop.ro', '0778901234', 3250);
INSERT INTO Angajati (ID_Angajat, rol, prenume, nume, email, telefon, salariu) VALUES (8, 'Waiter', 'Matei', 'Ivan', 'matei.ivan@coffeeshop.ro', '0778261234', 3700);

INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (1, 'Radu', 'Cristina', 'cristina.radu@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (2, 'Marin', 'George', 'george.marin@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (3, 'Florea', 'Ana', 'ana.florea@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (4, 'Stoica', 'Mihai', 'mihai.stoica@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (5, 'Tanase', 'Elena', 'elena.tanase@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (6, 'Nistor', 'Adrian', 'adrian.nistor@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (7, 'Dobre', 'Iulia', 'iulia.dobre@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (8, 'Petre', 'Razvan', 'razvan.petre@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (9, 'Ionescu', 'Maria', 'maria.ionescu@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (10, 'Popa', 'Andrei', 'andrei.popa@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (11, 'Dumitru', 'Ana-maria', 'ana.dumitru@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (12, 'Stoica', 'Ioana', 'ioana.stoica@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (13, 'Vasilescu', 'Iosif', 'mihai.vasilescu@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (14, 'Marinescu', 'Mgadalena', 'elena.marinescu@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (15, 'Tudor', 'Alexandru', 'alexandru.tudor@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (16, 'Georgescu', 'Cristi', 'cristina.georgescu@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (17, 'Iliescu', 'Radu', 'radu.iliescu@email.com');
INSERT INTO Clienti (ID_Clienti, nume, PRENUME, email) VALUES (18, 'Preda', 'Adriana', 'adriana.preda@email.com');


INSERT INTO Bauturi (ID_Bautura, nume, tip, pret) VALUES (1, 'Espresso', 'Cafea', 7.50);
INSERT INTO Bauturi (ID_Bautura, nume, tip, pret) VALUES (2, 'Cappuccino', 'Cafea', 9.75);
INSERT INTO Bauturi (ID_Bautura, nume, tip, pret) VALUES (3, 'Latte', 'Cafea', 10.25);
INSERT INTO Bauturi (ID_Bautura, nume, tip, pret) VALUES (4, 'Ceai Verde', 'Ceai', 6.50);
INSERT INTO Bauturi (ID_Bautura, nume, tip, pret) VALUES (5, 'Smoothie Fructe', 'Bautura Racoritoare', 12.00);
INSERT INTO Bauturi (ID_Bautura, nume, tip, pret) VALUES (6, 'Americano', 'Cafea', 8.25);
INSERT INTO Bauturi (ID_Bautura, nume, tip, pret) VALUES (7, 'Ceai Negru', 'Ceai', 6.75);


INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (1, 'Cafea', 10.00, 50);
INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (2, 'Zahar', 12.50, 40);
INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (3, 'Ceai Negru', 13.75, 35);
INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (4, 'Ciocolata ', 14.00, 30);
INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (5, 'Ceai Verde', 9.00, 60);
INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (6, 'Scortisoara', 8.25, 30);
INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (7, 'Sirop vanilie', 12.75, 25);
INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (8, 'Sirop caramel', 22.00, 15);
INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (9, 'Lapte', 10.50, 40);
INSERT INTO Produse (ID_Produs, nume, pret, cantitate) VALUES (10, 'Lapte de cocos', 14.25, 18);

INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (1, 2, 1, TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (2, 6, 2, TO_DATE('2024-01-16', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (3, 3, 3, TO_DATE('2024-01-17', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (4, 4, 4, TO_DATE('2024-01-18', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (5, 2, 5, TO_DATE('2024-01-19', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (6, 6, 6, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (7, 3, 7, TO_DATE('2024-01-21', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (8, 4, 8, TO_DATE('2024-01-22', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (9, 2, 5, TO_DATE('2024-01-25', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (10, 3, 7, TO_DATE('2024-01-28', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (11, 4, 8, TO_DATE('2024-02-05', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (12, 1, 6, TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (13, 5, 9, TO_DATE('2024-02-15', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (14, 2, 10, TO_DATE('2024-02-20', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (15, 4, 11, TO_DATE('2024-02-25', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (16, 3, 12, TO_DATE('2024-03-02', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (17, 1, 7, TO_DATE('2024-03-07', 'YYYY-MM-DD'));
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (18, 5, 8, TO_DATE('2024-03-12', 'YYYY-MM-DD'));
--pt too many rows
INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (101, 1, 1,TO_DATE('2024-03-07', 'YYYY-MM-DD'));
    INSERT INTO Comenzi (ID_Comanda, ID_Angajat, ID_Client, data_comanda) VALUES (102, 1, 1, TO_DATE('2024-01-20', 'YYYY-MM-DD'));




INSERT INTO Bonuri (ID_Bon, Data_Bon, ID_Comanda) VALUES (1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO Bonuri (ID_Bon, Data_Bon, ID_Comanda) VALUES (2, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 2);
INSERT INTO Bonuri (ID_Bon, Data_Bon, ID_Comanda) VALUES (3, TO_DATE('2024-01-17', 'YYYY-MM-DD'), 3);
INSERT INTO Bonuri (ID_Bon, Data_Bon, ID_Comanda) VALUES (4, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 4);
INSERT INTO Bonuri (ID_Bon, Data_Bon, ID_Comanda) VALUES (5, TO_DATE('2024-01-19', 'YYYY-MM-DD'), 5);
INSERT INTO Bonuri (ID_Bon, Data_Bon, ID_Comanda) VALUES (6, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 6);
INSERT INTO Bonuri (ID_Bon, Data_Bon, ID_Comanda) VALUES (7, TO_DATE('2024-01-21', 'YYYY-MM-DD'), 7);
INSERT INTO Bonuri (ID_Bon, Data_Bon, ID_Comanda) VALUES (8, TO_DATE('2024-01-22', 'YYYY-MM-DD'), 8);


INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (2, 1, 2);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (1, 2, 1);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (3, 3, 3);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (2, 4, 5);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (1, 5, 3);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (2, 6, 4);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (3, 7, 6);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (1, 1, 5);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (2, 2, 6);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (3, 3, 2);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (1, 4, 4);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (2, 5, 1);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (3, 6, 3);
INSERT INTO Bauturi_Produse (numar_produse, ID_Bautura, ID_Produs) VALUES (1, 7, 5);

INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-15', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-16', 'YYYY-MM-DD'), 2, 2);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-17', 'YYYY-MM-DD'), 3, 3);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-18', 'YYYY-MM-DD'), 4, 4);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-19', 'YYYY-MM-DD'), 5, 5);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-20', 'YYYY-MM-DD'), 1, 6);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-21', 'YYYY-MM-DD'), 2, 7);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-22', 'YYYY-MM-DD'), 3, 1);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-23', 'YYYY-MM-DD'), 4, 2);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-24', 'YYYY-MM-DD'), 5, 3);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-25', 'YYYY-MM-DD'), 1, 4);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-26', 'YYYY-MM-DD'), 2, 5);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-27', 'YYYY-MM-DD'), 3, 6);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-28', 'YYYY-MM-DD'), 4, 7);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-29', 'YYYY-MM-DD'), 5, 1);
INSERT INTO Bonusuri_Angajati (data_bonus, ID_Bonus, ID_Angajat) VALUES (TO_DATE('2024-01-30', 'YYYY-MM-DD'), 1, 2);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) VALUES 
(1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 
    TO_TIMESTAMP('2024-01-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-01-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) VALUES 
(2, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 
    TO_TIMESTAMP('2024-01-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-01-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) VALUES 
(3, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 
    TO_TIMESTAMP('2024-01-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-01-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) VALUES 
(4, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 
    TO_TIMESTAMP('2024-01-16 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-01-16 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) VALUES 
(5, TO_DATE('2024-01-17', 'YYYY-MM-DD'), 
    TO_TIMESTAMP('2024-01-17 07:45:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-01-17 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) VALUES 
(6, TO_DATE('2024-01-17', 'YYYY-MM-DD'), 
    TO_TIMESTAMP('2024-01-17 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-01-17 17:15:00', 'YYYY-MM-DD HH24:MI:SS'), 6);
INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) VALUES 
(7, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 
    TO_TIMESTAMP('2024-01-18 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-01-18 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 7);
    
INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (8, TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-19 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-19 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 4);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (9, TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-19 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-19 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (10, TO_DATE('2024-01-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-20 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-20 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (11, TO_DATE('2024-01-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-21 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-21 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (12, TO_DATE('2024-01-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-22 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (13, TO_DATE('2024-01-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-23 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-23 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (14, TO_DATE('2024-01-24', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-24 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-24 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (15, TO_DATE('2024-01-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-25 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-25 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 7);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (16, TO_DATE('2024-01-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-26 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-26 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (17, TO_DATE('2024-01-27', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-27 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-27 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (18, TO_DATE('2024-01-28', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-28 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-28 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (19, TO_DATE('2024-01-29', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-29 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-29 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (20, TO_DATE('2024-01-30', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-30 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-30 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (21, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-02-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-02-01 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 6);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (22, TO_DATE('2024-02-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-02-02 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-02-02 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 4);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (23, TO_DATE('2024-02-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-02-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-02-03 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (24, TO_DATE('2024-02-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-02-04 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-02-04 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (25, TO_DATE('2024-02-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-02-05 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-02-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);

INSERT INTO Zile_lucrate (ID_Zile_lucrate, ziua_data, zi_inceput, zi_final, ID_Angajat) 
VALUES (26, TO_DATE('2024-02-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-02-06 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-02-06 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4);

    
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Card', 45.50, 1);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (2, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 'Numerar', 35.25, 2);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (3, TO_DATE('2024-01-17', 'YYYY-MM-DD'), 'Card', 62.75, 3);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (4, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 'Numerar', 28.50, 4);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (5, TO_DATE('2024-01-19', 'YYYY-MM-DD'), 'Card', 55.00, 5);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (6, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'Numerar', 42.75, 6);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (7, TO_DATE('2024-01-21', 'YYYY-MM-DD'), 'Card', 38.25, 7);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (8, TO_DATE('2024-01-22', 'YYYY-MM-DD'), 'Numerar', 52.50, 8);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (9, TO_DATE('2024-01-23', 'YYYY-MM-DD'), 'Card', 120.00, 8);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (10, TO_DATE('2024-01-24', 'YYYY-MM-DD'), 'Numerar', 75.25, 6);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (11, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 'Card', 95.00, 6);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (12, TO_DATE('2024-01-26', 'YYYY-MM-DD'), 'Numerar', 45.90, 6);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (13, TO_DATE('2024-01-27', 'YYYY-MM-DD'), 'Card', 60.75, 4);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (14, TO_DATE('2024-01-28', 'YYYY-MM-DD'), 'Transfer Bancar', 150.30, 3);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (15, TO_DATE('2024-01-29', 'YYYY-MM-DD'), 'Card', 210.50, 2);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (16, TO_DATE('2024-01-30', 'YYYY-MM-DD'), 'Numerar', 35.75, 1);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (17, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'Card', 87.90, 8);
INSERT INTO Plati (ID_Plata, data, metoda, suma, ID_Client) VALUES (18, TO_DATE('2024-02-02', 'YYYY-MM-DD'), 'Transfer Bancar', 100.00, 6);



INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (1, 1);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (1, 2);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (1, 3);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (2, 1);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (2, 4);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (2, 5);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (3, 2);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (3, 6);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (3, 7);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (4, 1);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (4, 3);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (4, 5);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (5, 2);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (5, 4);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (5, 6);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (6, 1);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (6, 7);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (7, 3);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (7, 5);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (8, 6);
INSERT INTO Comenzi_contin_bauturi (ID_Comanda, ID_Bautura) VALUES (12, 1);



USE hw14;

SELECT auto.Corporation, showrooms.Guarantie, showrooms.Discount, characteristics.HP
FROM auto
         JOIN characteristics ON characteristics.Auto_ID = auto.id
         JOIN showrooms ON showrooms.Characteristics_ID = characteristics.ID
Where (Corporation = 'Toyota' AND Guarantie = 'y' AND Discount >= 5) AND HP = (SELECT MIN(HP) FROM characteristics);



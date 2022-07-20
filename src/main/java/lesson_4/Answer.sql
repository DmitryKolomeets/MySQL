USE hw14;

SELECT COUNT(Corporation)
FROM auto
JOIN characteristics ON characteristics.Auto_ID = auto.id
JOIN showrooms ON showrooms.Characteristics_ID = characteristics.ID
Where Corporation = 'Volkswagen' AND Color = 'Black' AND Presence = 'y';



USE hw14;

SELECT showrooms.Assurance_Amount
FROM  showrooms
JOIN characteristics ON characteristics.ID = showrooms.Characteristics_ID
WHERE Speed = (SELECT MAX(Speed) FROM characteristics);
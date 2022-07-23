USE hw14;

SELECT auto.Mark, auto.Model, characteristics.Color, characteristics.Speed, showrooms.Price
FROM auto
         JOIN characteristics ON characteristics.Auto_ID = auto.id
         JOIN showrooms ON showrooms.Characteristics_ID = characteristics.ID
Where  NOT EngineType = 'Diesel';
CREATE TABLE IF NOT exists Showrooms (
                                         Price INT,
                                         Assurance_Amount INT,
                                         Presence VARCHAR (10),
    Guarantie VARCHAR (10),
    Discount INT,
    Characteristics_ID INT,
    FOREIGN KEY (Characteristics_ID)  REFERENCES characteristics (ID)
    );
USE hw14;

CREATE TABLE IF NOT exists characteristics (
                                               ID INT PRIMARY KEY,
                                               Color VARCHAR (30),
    Speed INT,
    EngineType VARCHAR (30),
    Cabin VARCHAR (30),
    HP INT,
    Auto_ID INT,
    FOREIGN KEY (Auto_ID)  REFERENCES auto (id)
    );
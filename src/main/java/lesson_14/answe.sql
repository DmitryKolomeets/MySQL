CREATE TABLE Products (
                          Product_id   	INT(10) auto_increment,
                          Group_id_ref 	INT(10),
                          Product_name 	CHAR (128),
                          Product_desc 	TEXT,
                          Product_articul 	CHAR(32),
                          Product_price 	DECIMAL(14,2),
                          PRIMARY KEY (product_id),
                          INDEX (Group_id_ref)
);

CREATE TABLE Product_groups (
                                Group_id 	INT(10) auto_increment,
                                Group_name 	CHAR(128),
                                Group_desc 	TEXT,
                                PRIMARY KEY (Group_id)
);

CREATE TABLE Colors (
                        Color_id 	INT(10) auto_increment,
                        Color_name 	CHAR(64),
                        Color_desc 	TEXT,
                        PRIMARY KEY (Color_id)
);

CREATE TABLE Sizes (
                       Size_id 		INT(10) auto_increment,
                       Size_name 		CHAR(64),
                       Size_desc 		TEXT,
                       PRIMARY KEY (Size_id)
);

CREATE TABLE Product_values (
                                Record_id 		INT(10) auto_increment,
                                Product_id_ref 	INT(10),
                                Value_id_ref 	INT(10),
                                Value_type INT(2), /*  Тип реквизита (1–цвет, 2–размер) */
                                PRIMARY KEY (Record_id),
                                INDEX(product_id_ref)
);

CREATE TABLE Product_photos (
                                photo_id       INT(10) auto_increment,
                                product_id_ref INT(10),
                                photo_path     CHAR(128),      /* Имя файла фото           */
                                is_main       INT(1),          /* Основное — 1, иначе - 0  */
                                PRIMARY KEY (photo_id),
                                INDEX(product_id_ref)
);

/* Группы товаров */
INSERT INTO Product_groups VALUES ('', 'Мужские костюмы', 'Костюмы, тройки, Смокинги');
/* Расцветки */
INSERT INTO Colors VALUES ('', 'Черный', 'Узор в елочку');
INSERT INTO Colors VALUES ('', 'Белый', 'Белоснежный');
/* Размеры */
INSERT INTO Sizes VALUES ('', '48', '48 - российский');
INSERT INTO Sizes VALUES ('', '50', '50 - российский');
/* Товары */
INSERT INTO Products
VALUES ('',
        1,
        'Костюм «DS221»',
        'Элегантный костюм, подходит как для работы, так и для вечернего убранства',
        'Артикул_1',
        12000);
/* Реквизиты товаров */
INSERT INTO Product_values VALUES ('', 1, 1, 1);
INSERT INTO Product_values VALUES ('', 1, 1, 2);
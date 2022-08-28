CREATE TABLE tbl AS
SELECT
    generate_series(1, 100000) pk  -- 100K "фактов"
     , CASE
           WHEN random() < 1::real/16 THEN NULL -- с вероятностью 1:16 запись "ничья"
    ELSE (random() * 100)::integer -- 100 разных внешних ключей
END fk_own;

CREATE INDEX ON tbl(fk_own, pk); -- индекс с "вроде как подходящей" сортировкой

SELECT
    *
FROM
    tbl
WHERE
        fk_own = 1 OR -- свои
    fk_own IS NULL -- ... или "ничьи"
ORDER BY
    pk
       , (fk_own = 1) DESC -- сначала "свои"
    LIMIT 20;
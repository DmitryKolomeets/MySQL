USE AdventureWorks2016;
GO

/* SELECT statement built using a subquery. */
SELECT [Name]
FROM Production.Product
WHERE ListPrice =
    (SELECT ListPrice
    FROM Production.Product
    WHERE [Name] = 'Chainring Bolts' );
GO

/* SELECT statement built using a join that returns
   the same result set. */
SELECT Prd1.[Name]
FROM Production.Product AS Prd1
         JOIN Production.Product AS Prd2
              ON (Prd1.ListPrice = Prd2.ListPrice)
WHERE Prd2.[Name] = 'Chainring Bolts';
GO
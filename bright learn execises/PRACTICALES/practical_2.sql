--SELECT*
  
--FROM
  --"FOOD_DATA1"."PUBLIC"."ORDERS",
  --"FOOD_DATA1"."PUBLIC"."PRODUCT",
  --"FOOD_DATA1"."PUBLIC"."CUSTOMERS",
  
--LIMIT
  --10;
SELECT 
    'ORDERS' AS table_name,
    COUNT(*) AS row_count
FROM "FOOD_DATA1"."PUBLIC"."ORDERS"

UNION ALL

SELECT 
    'PRODUCT' AS table_name,
    COUNT(*) AS row_count
FROM "FOOD_DATA1"."PUBLIC"."PRODUCT"

UNION ALL

SELECT 
    'CUSTOMERS' AS table_name,
    COUNT(*) AS row_count
FROM "FOOD_DATA1"."PUBLIC"."CUSTOMERS";
------------------------------------------------------------------------------------------------------------
SELECT
    ORDERS.ORDERID AS OrderID,
    ORDERS.ORDERDATE AS OrderDate,
    CUSTOMERS.CUSTOMERNAME AS CustomerName,
    PRODUCT.PRODUCTNAME AS ProductName,
    ORDERS.QUANTITY AS Quantity
FROM"FOOD_DATA1"."PUBLIC"."ORDERS"
INNER JOIN"FOOD_DATA1"."PUBLIC"."CUSTOMERS"
    ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID
INNER JOIN"FOOD_DATA1"."PUBLIC"."PRODUCT"
    ON ORDERS.PRODUCTID = PRODUCT.PRODUCTID;
 

-------------------------------------------------------------------------------------------------------------
--QUESTION 2

SELECT
    CUSTOMERS.CUSTOMERID AS CustomerID,
    CUSTOMERS.CUSTOMERNAME AS CustomerName,
    CUSTOMERS.COUNTRY AS Country,
    ORDERS.ORDERID AS OrderID,
    ORDERS.ORDERDATE AS OrderDate
FROM"FOOD_DATA1"."PUBLIC"."CUSTOMERS"
INNER JOIN"FOOD_DATA1"."PUBLIC"."ORDERS"
    ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID;
  

 --------------------------------------------------------------------------------------------------------
 --QUESTION 3
 
 SELECT
    CUSTOMERS.CUSTOMERID AS CustomerID,
    CUSTOMERS.CUSTOMERNAME AS CustomerName,
    CUSTOMERS.COUNTRY AS Country,
    ORDERS.ORDERID AS OrderID,
    ORDERS.ORDERDATE AS OrderDate,
    ORDERS.PRODUCTID AS ProductID,
    ORDERS.QUANTITY AS Quantity
FROM "FOOD_DATA1"."PUBLIC"."CUSTOMERS"
LEFT JOIN "FOOD_DATA1"."PUBLIC"."ORDERS"
    ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID;
----------------------------------------------------------------------------------------------------------------------------
--QUESTION 4

SELECT
   PRODUCT.PRODUCTID AS PRODUCTID,
   PRODUCT.PRODUCTNAME AS PRODUCTNAME,
   COUNT(ORDERS.ORDERID) AS TOTALORDERS
   FROM"FOOD_DATA1"."PUBLIC"."PRODUCT"
   LEFT JOIN"FOOD_DATA1"."PUBLIC"."ORDERS"
   ON PRODUCT.PRODUCTID = ORDERS.PRODUCTID
   GROUP BY 
   PRODUCT.PRODUCTID,
   PRODUCT.PRODUCTNAME;

------------------------------------------------------------------------------------------------------------------------------------
--QUESTION 5

SELECT
   ORDERS.ORDERID AS ORDERID,
   ORDERS.ORDERDATE AS ORDERDATE,
   PRODUCT.PRODUCTID AS PRODUCTID,
   PRODUCT.PRODUCTNAME AS PRODUCTNAME,
   PRODUCT.PRICE AS PRICE,
   ORDERS.QUANTITY AS QUANTITY
   FROM"FOOD_DATA1"."PUBLIC"."ORDERS"
   RIGHT JOIN"FOOD_DATA1"."PUBLIC"."PRODUCT"
   ON ORDERS.PRODUCTID = PRODUCT.PRODUCTID;
----------------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 6

SELECT
  CUSTOMERS.CUSTOMERID AS CUSTOMERID,
  CUSTOMERS.CUSTOMERNAME AS CUSTOMERNAME,
  CUSTOMERS.COUNTRY AS COUNTRY,
  ORDERS.ORDERID AS ORDERID,
  ORDERS.ORDERDATE AS ORDERDATE,
  ORDERS.PRODUCTID AS PRODUCTID,
  ORDERS.QUANTITY AS QUANTITY,
  FROM"FOOD_DATA1"."PUBLIC"."ORDERS"
  RIGHT JOIN "FOOD_DATA1"."PUBLIC"."CUSTOMERS"
  ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID;
---------------------------------------------------------------------------------------------------------------------------------------
 --QUESTION 7

 SELECT
   CUSTOMERS.CUSTOMERID AS CUSTOMERID,
   CUSTOMERS.CUSTOMERNAME AS CUSTOMERNAME,
   CUSTOMERS.COUNTRY AS COUNTRY,
   ORDERS.ORDERID AS ORDERID,
   ORDERS.ORDERDATE AS ORDERDATE,
   ORDERS.PRODUCTID AS PRODUCTID,
   ORDERS.QUANTITY AS QUANTITY,
   FROM"FOOD_DATA1"."PUBLIC"."ORDERS"
   FULL OUTER JOIN "FOOD_DATA1"."PUBLIC"."CUSTOMERS"
  ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID;
---------------------------------------------------------------------------------------------------------------------------------------------
--QUESTION 8
SELECT
    product.productid AS productid,
    product.productname AS productname,
    product.price AS price,
    orders.orderid AS orderid,
    orders.orderdate AS orderdate,
    orders.customerid AS customerid,
    orders.quantity AS quantity
FROM "FOOD_DATA1"."PUBLIC"."PRODUCT" AS product
FULL OUTER JOIN "FOOD_DATA1"."PUBLIC"."ORDERS" AS orders
    ON product.productid = orders.productid;
  
  
  
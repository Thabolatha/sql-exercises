--SELECT
  --*
--FROM
  --"SHOPPING"."PUBLIC"."FUNCTIONS"
--LIMIT
  --10;
--------------------------------------------------------------------------------------------------------------------------------------------------------

  --select customer_id, gender
 -- from "SHOPPING"."PUBLIC"."FUNCTIONS";
 -------------------------------------------------------------------------------------------------------------------------------------------------------
 --QUESTION 1
 
 SELECT
    customer_id,
    size,
    purchase_amount,
    item_purchased
FROM"SHOPPING"."PUBLIC"."FUNCTIONS" 
WHERE size IS NULL
  AND purchase_amount > 50;
---------------------------------------------------------------------------------------------------------------------------------------------------
--QUESTION 2
SELECT
    COALESCE(season, 'Unknown Season') AS season,
    COUNT(*) AS total_purchases
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
GROUP BY COALESCE(season, 'Unknown Season');
----------------------------------------------------------------------------------------------------------------------------------------------------
--QUESTION 3
SELECT
   COALESCE(PAYMENT_METHOD,'NOT PROVIDED') AS PAYMENT_METHOD,
   COUNT(DISTINCT CUSTOMER_ID) AS CUSTOMER_COUNT,
   FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
   GROUP BY COALESCE(PAYMENT_METHOD,'NOT PROVIDED');
--------------------------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 4
SELECT
    CUSTOMER_ID,
    PROMO_CODE_USED,
    REVIEW_RATING,
    ITEM_PURCHASED
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
WHERE PROMO_CODE_USED IS NULL
  AND REVIEW_RATING < 3.0;
-------------------------------------------------------------------------------------------------------------------------------------------------------

-- QUESTION 5 
SELECT
    SHIPPING_TYPE,
    AVG(COALESCE(PURCHASE_AMOUNT, 0)) AS AVERAGE_PURCHASE_AMOUNT
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
GROUP BY SHIPPING_TYPE;
----------------------------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 6

SELECT
    LOCATION,
    COUNT(*) AS TOTAL_PURCHASES
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
WHERE PAYMENT_METHOD IS NOT NULL
GROUP BY LOCATION
HAVING COUNT(*) > 5;
------------------------------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 7 
SELECT 
  CUSTOMER_ID,
  COALESCE(PURCHASE_AMOUNT ,0) AS PURCHASE_AMOUNT,
  CASE
  WHEN COALESCE(PURCHASE_AMOUNT,0) > 80 THEN 'HIGH'
  WHEN COALESCE(PURCHASE_AMOUNT,0) BETWEEN 50 AND 80 THEN 'MEDIUM'
  ELSE 'LOW'
  END AS SPENDER_CATEGORY
  FROM "SHOPPING"."PUBLIC"."FUNCTIONS";
--------------------------------------------------------------------------------------------------------------------------------------------------------
--QUESTION 8
 
SELECT
    CUSTOMER_ID,
    COLOR,
    PREVIOUS_PURCHASES
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
WHERE PREVIOUS_PURCHASES IS NULL
  AND COLOR IS NOT NULL;
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 9

SELECT
    COALESCE(FREQUENCY_OF_PURCHASES, 'Unknown') AS FREQUENCY_OF_PURCHASES,
    SUM(COALESCE(PURCHASE_AMOUNT, 0)) AS TOTAL_PURCHASE_AMOUNT
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
GROUP BY COALESCE(FREQUENCY_OF_PURCHASES, 'Unknown');
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--QUESTION 10
SELECT
  CATEGORY,
  COUNT(*)AS TOTAL_PURCHASE
  FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
  WHERE CATEGORY IS NOT NULL
  GROUP BY CATEGORY;
  ----------------------------------------------------------------------------------------------------------------------------------------------------------
  --QUESTION 11

 SELECT
    Location,
    SUM(COALESCE(PURCHASE_AMOUNT,0)) AS TOTAL_PURCHASE_AMOUNT
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
GROUP BY
    Location
ORDER BY
    TOTAL_PURCHASE_AMOUNT DESC
LIMIT 5;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--question 12

SELECT 
  GENDER,
  SIZE,
  COUNT(*) AS "NULL COLOR COLOR"
  FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
  WHERE COLOR IS NULL
  GROUP BY
   GENDER,
   SIZE;
--------------------------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 13
SELECT
    ITEM_PURCHASED,
    COUNT(*) AS "NULL Shipping Type Count"
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
WHERE SHIPPING_TYPE IS NULL
GROUP BY
    ITEM_PURCHASED
HAVING
    COUNT(*) > 3;

--------------------------------------------------------------------------------------------------------------------------------------------------
--QUESTION 14
SELECT
    PAYMENT_METHOD,
    COUNT(*) AS "Missing Review Rating Count"
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
WHERE REVIEW_RATING IS NULL
GROUP BY
    PAYMENT_METHOD;
----------------------------------------------------------------------------------------------------------------------------------------------
--QUESTION 15

    SELECT
    Category,
    AVG(Review_Rating) AS "Average Review Rating"
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
GROUP BY Category
HAVING AVG(Review_Rating) > 3.5;
------------------------------------------------------------------------------------------------------------------------------
--QUESTION 16

SELECT
  COLOR,
  AVG(AGE) AS "AVERAGE AGE"
  FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
  WHERE COLOR IS NULL
  GROUP BY COLOR
  HAVING COUNT(*) >= 2;
  ----------------------------------------------------------------------------------------------------------------------------
  -- QUESTION 17

 SELECT
    CASE
        WHEN Shipping_Type IN ('Next Day Air', 'Express') THEN 'Fast'
        WHEN Shipping_Type = 'Standard' THEN 'Slow'
        ELSE 'Other'
    END AS Delivery_Speed,
    COUNT(Customer_ID) AS "Customer Count"
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
GROUP BY
    CASE
        WHEN Shipping_Type IN ('Next Day Air', 'Express') THEN 'Fast'
        WHEN Shipping_Type = 'Standard' THEN 'Slow'
        ELSE 'Other'
    END;

        
 ----------------------------------------------------------------------------------------------------------------------------------
 --QUESTION 18
SELECT
  CUSTOMER_ID,
  PURCHASE_AMOUNT,
  PROMO_CODE_USED
  FROM"SHOPPING"."PUBLIC"."FUNCTIONS"
  WHERE PURCHASE_AMOUNT IS NULL
  AND PROMO_CODE_USED = 'YES';
----------------------------------------------------------------------------------------------------------------------------------
--QUESTION 19
SELECT
    Location,
    MAX(COALESCE(Previous_Purchases, 0)) AS "Max Previous Purchases",
    AVG(Review_Rating) AS "Average Review Rating"
FROM "SHOPPING"."PUBLIC"."FUNCTIONS"
GROUP BY Location;
---------------------------------------------------------------------------------------------------------------------------------
--QUESTION 20

 SELECT
   CUSTOMER_ID,
   SHIPPING_TYPE,
   PURCHASE_AMOUNT,
   ITEM_PURCHASED
   FROM"SHOPPING"."PUBLIC"."FUNCTIONS"
   WHERE SHIPPING_TYPE IS NULL
   AND PURCHASE_AMOUNT BETWEEN 30 and 70;
-----------------------------------------------------------------------------------------------------------------------------   
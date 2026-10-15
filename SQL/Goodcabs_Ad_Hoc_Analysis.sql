-- Ad Hoc Requests
-- Business Request 1 : City-Level Fare and Trip Summary Report
SELECT
  city_id,
  city_name,
  COUNT(trip_id) AS TOTAL_TRIPS,
  ROUND(SUM(fare_amount) / SUM(distance_travelled_km), 2) AS AVG_FARE_PER_KM,
  ROUND(SUM(fare_amount) / COUNT(trip_id), 2) AS AVG_FARE_PER_TRIP,
  ROUND(
    COUNT(trip_id)
      / (SELECT COUNT(trip_id) FROM `goodcabs_analysis.fact_trips`)
      * 100,
    2) AS PCT_CONTRIBUTION_TO_TOTAL_TRIPS
FROM `goodcabs_analysis.fact_trips`
JOIN `goodcabs_analysis.dim_city`
  USING (CITY_ID)
GROUP BY city_id, city_name;

-- Business Request 2 : Monthly City-Level Trips Target Performance Report
SELECT
  month,
  city_name,
  total_trips AS Actual_Trips,
  total_target_trips AS Target_Trips,
  trips_var_pct AS PCT_Difference,
  CASE
    WHEN total_trips > total_target_trips THEN 'Above Target'
    ELSE 'Below Target'
    END AS Performance_Status
FROM `goodcabs_analysis.master_table`
JOIN `goodcabs_analysis.dim_city`
  USING (CITY_ID)
ORDER BY PCT_Difference DESC;

-- Business Request 3: City-Level Repeat Passenger Trip Frequency Report
SELECT
  city_id,
  ROUND(
    SUM(
      CASE
        WHEN trip_count = '2-Trips' THEN repeat_passenger_count
        END)
      / SUM(REPEAT_PASSENGER_COUNT)
      * 100,
    2) AS TWO_TRIPS_pct,
  ROUND(
    SUM(
      CASE
        WHEN trip_count = '3-Trips' THEN repeat_passenger_count
        END)
      / SUM(REPEAT_PASSENGER_COUNT)
      * 100,
    2) AS THREE_TRIPS_pct,
  ROUND(
    SUM(
      CASE
        WHEN trip_count = '4-Trips' THEN repeat_passenger_count
        END)
      / SUM(REPEAT_PASSENGER_COUNT)
      * 100,
    2) AS FOUR_TRIPS_pct,
  ROUND(
    SUM(
      CASE
        WHEN trip_count = '5-Trips' THEN repeat_passenger_count
        END)
      / SUM(REPEAT_PASSENGER_COUNT)
      * 100,
    2) AS FIVE_TRIPS_pct,
  ROUND(
    SUM(
      CASE
        WHEN trip_count = '6-Trips' THEN repeat_passenger_count
        END)
      / SUM(REPEAT_PASSENGER_COUNT)
      * 100,
    2) AS SIX_TRIPS_pct,
  ROUND(
    SUM(
      CASE
        WHEN trip_count = '7-Trips' THEN repeat_passenger_count
        END)
      / SUM(REPEAT_PASSENGER_COUNT)
      * 100,
    2) AS SEVEN_TRIPS_pct,
  ROUND(
    SUM(
      CASE
        WHEN trip_count = '8-Trips' THEN repeat_passenger_count
        END)
      / SUM(REPEAT_PASSENGER_COUNT)
      * 100,
    2) AS EIGHT_TRIPS_pct,
  ROUND(
    SUM(
      CASE
        WHEN trip_count = '9-Trips' THEN repeat_passenger_count
        END)
      / SUM(REPEAT_PASSENGER_COUNT)
      * 100,
    2) AS NINE_TRIPS_pct,
  ROUND(
    SUM(
      CASE
        WHEN trip_count = '10-Trips' THEN repeat_passenger_count
        END)
      / SUM(REPEAT_PASSENGER_COUNT)
      * 100,
    2) AS TEN_TRIPS_pct
FROM `goodcabs_analysis.dim_repeat_trip_distribution`
GROUP BY city_id;

-- Business Request 4: Identify Cities with Highest and Lowest Total New Passengers
WITH
  RNK_CITIES AS (
    SELECT
      city_id,
      city_name,
      SUM(new_passengers) AS TOTAL_NEW_PASSENGERS,
      ROW_NUMBER() OVER (ORDER BY SUM(new_passengers) DESC) AS RNK
    FROM `goodcabs_analysis.master_table`
    JOIN `goodcabs_analysis.dim_city`
      USING (CITY_ID)
    GROUP BY city_id, city_name
  ),
  CATEGORY AS (
    SELECT
      *,
      CASE
        WHEN RNK IN (1, 2, 3) THEN "TOP 3"
        WHEN RNK IN (8, 9, 10) THEN "BOTTOM 3"
        END AS CITY_CATEGORY
    FROM RNK_CITIES
  )
SELECT *
FROM CATEGORY
WHERE CITY_CATEGORY IS NOT NULL;

-- Business Request 5: Identify Month with Highest Revenue for Each City
WITH
  HIGHEST_MONTH_REVENUE AS (
    SELECT *
    FROM
      (
        SELECT
          city_id,
          city_name,
          EXTRACT(MONTH FROM MONTH) AS HIGHEST_REVENUE_MONTH,
          total_fare AS REVENUE_MONTH_AMOUNT,
          ROW_NUMBER()
            OVER (PARTITION BY city_id ORDER BY total_fare DESC) AS RNK
        FROM `goodcabs_analysis.master_table`
        JOIN `goodcabs_analysis.dim_city`
          USING (CITY_ID)
      )
    WHERE RNK = 1
  ),
  CONTRIBUTION AS (
    SELECT
      city_id,
      CITY_NAME,
      MAX(HIGHEST_REVENUE_MONTH) AS HIGHEST_REVENUE_MONTH,
      MAX(REVENUE_MONTH_AMOUNT) AS REVENUE_MONTH_AMOUNT,
      SUM(total_fare) AS TOTAL_FARE_CITY,
      ROUND(MAX(REVENUE_MONTH_AMOUNT) / SUM(total_fare) * 100, 2)
        AS PCT_CONTRIBUTIONS
    FROM `goodcabs_analysis.master_table`
    JOIN HIGHEST_MONTH_REVENUE
      USING (CITY_ID)
    GROUP BY city_id, CITY_NAME
  )
SELECT *
FROM CONTRIBUTION;

-- Business Request 6: Repeat Passenger Rate Analysis
-- MONTHLY_REPEAT_PASSENGER_RATE
SELECT
  month,
  city_id,
  city_name,
  total_passengers,
  repeat_passengers,
  repeat_passenger_pct AS MONTHLY_REPEAT_PASSENGER_RATE
FROM `goodcabs_analysis.master_table`
JOIN `goodcabs_analysis.dim_city`
  USING (CITY_ID);

-- city_repeat_passenger_rate
SELECT
  city_id,
  city_name,
  round(
    SUM(repeat_passengers)
      / (SELECT SUM(total_passengers) FROM `goodcabs_analysis.master_table`)
      * 100,
    2) AS city_repeat_passenger_rate
FROM `goodcabs_analysis.master_table`
JOIN `goodcabs_analysis.dim_city`
  USING (CITY_ID)
GROUP BY city_id, city_name;

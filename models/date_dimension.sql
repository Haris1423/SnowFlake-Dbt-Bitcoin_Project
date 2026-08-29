WITH CTE AS (
    SELECT 
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    {{get_day_type('STARTED_AT')}} DAY_TYPE,

     {{get_season('STARTED_AT')}} AS STATION_OF_YEAR
     
         FROM 
    {{ source('demo', 'bike') }}
)
SELECT * FROM CTE
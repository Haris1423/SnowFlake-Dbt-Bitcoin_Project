WITH CTE AS (
    SELECT DISTINCT
    START_STATIO_ID AS STATION_ID, 
    START_STATION_NAME,
    START_LAT AS STATION_LAT,
    START_LNG AS STATION_LNG
    
     FROM 

    {{ source('demo', 'bike') }}
    where RIDE_ID!='ride_id'
)
select * from cte
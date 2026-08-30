{{ config(materialized='table') }}
WITH TRIPS AS (
    SELECT 
    RIDE_ID, 
    --RIDEABLE_TYPE, 
    DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
    START_STATIO_ID AS START_STATION_ID,
    END_STATION_ID,
    MEMBER_CSUAL, 
    TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(ENDED_AT) ,TO_TIMESTAMP(STARTED_AT)) AS TRIP_DUARTION_SECONDS


     FROM 

    {{ ref('stage_bike') }}
       where RIDE_ID != 'bike_id' AND RIDE_ID != '"bikdeid"'
)
select * from TRIPS
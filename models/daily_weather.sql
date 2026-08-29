WITH CTE AS (
    SELECT 
        DATE(TIME) AS daily_weather,
        weather,
        temp,
        pressure,
        humidity,
        clouds
    FROM {{ source('demo', 'weather') }}

),
daily_weather_agg AS (
    SELECT 
    daily_weather,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(clouds),2) as avg_clouds
    FROM CTE
group by 
    daily_weather,
        weather
qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) = 1
)
select * from daily_weather_agg

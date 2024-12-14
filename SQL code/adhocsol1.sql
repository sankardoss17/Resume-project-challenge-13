with cte as (SELECT c.city_name,count(trip_id) as total_trip,sum(fare_amount) as fare_amt,sum(distance_travelled_km) as total_dist FROM trips_db.fact_trips f
join dim_city c on f.city_id=c.city_id
group by c.city_name)

select city_name,total_trip,round(fare_amt/total_dist,2) as avg_fare_per_km,
round(fare_amt/total_trip) as  avg_fare_per_trip,round((total_trip/(select sum(total_trip) from cte)),2)*100 as percentage_contibution_to_total_trips
from cte
group by city_name
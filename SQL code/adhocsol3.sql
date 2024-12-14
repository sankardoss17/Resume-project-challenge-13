SELECT c.city_name,
round(sum(case when trip_count="2-Trips" then repeat_passenger_count end)/sum(repeat_passenger_count),2) as 2_trips,
round(sum(case when trip_count="3-Trips" then repeat_passenger_count end)/sum(repeat_passenger_count),2) as 3_trips,
round(sum(case when trip_count="4-Trips" then repeat_passenger_count end)/sum(repeat_passenger_count),2) as 4_trips,
round(sum(case when trip_count="5-Trips" then repeat_passenger_count end)/sum(repeat_passenger_count),2) as 5_trips,
round(sum(case when trip_count="6-Trips" then repeat_passenger_count end)/sum(repeat_passenger_count),2) as 6_trips,
round(sum(case when trip_count="7-Trips" then repeat_passenger_count end)/sum(repeat_passenger_count),2) as 7_trips,
round(sum(case when trip_count="8-Trips" then repeat_passenger_count end)/sum(repeat_passenger_count),2) as 8_trips,
round(sum(case when trip_count="9-Trips" then repeat_passenger_count end)/sum(repeat_passenger_count),2) as 9_trips,
round(sum(case when trip_count="10-Trips" then repeat_passenger_count end)/sum(repeat_passenger_count),2) as 10_trips,sum(repeat_passenger_count) as total_repeat_passenger
 FROM trips_db.dim_repeat_trip_distribution r
join trips_db.dim_city c on r.city_id=c.city_id
group by c.city_name
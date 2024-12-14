with actual as (select t.city_id,c.city_name,monthname(t.date) as months,count(trip_id) as actual_trip from trips_db.fact_trips t
join trips_db.dim_city c on t.city_id=c.city_id
group by city_id,months)

select a.city_name,a.months,a.actual_trip,m.total_target_trips,
case when a.actual_trip>m.total_target_trips then "Above Target" else "Below Target" 
end as performance_status,round(((a.actual_trip-m.total_target_trips)/m.total_target_trips) *100,2) AS percentage_difference from actual a
join targets_db.monthly_target_trips m
on a.city_id=m.city_id and a.months=monthname(m.month)
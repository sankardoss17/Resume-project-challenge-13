(SELECT c.city_name,sum(new_passengers) as new_passenger,
(case when new_passengers>0 then "Top3" else 0 end) as city_category
 FROM trips_db.fact_passenger_summary p
join trips_db.dim_city c  on c.city_id=p.city_id
group by c.city_name,city_category
order by new_passenger desc
limit 3)
union
(SELECT c.city_name,sum(new_passengers) as new_passenger,
(case when new_passengers>0 then "Bottom 3" else 0 end) as city_category
 FROM trips_db.fact_passenger_summary p
join trips_db.dim_city c  on c.city_id=p.city_id
group by c.city_name,city_category
order by new_passenger asc
limit 3)
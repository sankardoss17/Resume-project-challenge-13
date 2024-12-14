with t1 as (SELECT city_name,month_name,sum(total_passengers) as  total_passenger,
sum(repeat_passengers) as repeat_passenger, 
round(sum(repeat_passengers)/sum(total_passengers)*100,2) as monthly_repeat_passenger_rate_percent
FROM trips_db.fact_passenger_summary p
join trips_db.dim_city c on c.city_id=p.city_id
join trips_db.dim_date d on d.date=p.month
group by city_name,month_name)
select *,  round(repeat_passenger/sum(repeat_passenger) over(partition by city_name) *100,2) as city_repeat_passenger_rate_percent from t1
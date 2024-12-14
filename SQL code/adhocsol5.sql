with rev as (SELECT city_name,month_name,
sum(fare_amount) as revenue FROM trips_db.fact_trips f 
join trips_db.dim_city c on c.city_id=f.city_id
join trips_db.dim_date d on d.date=f.date
group by city_name,month_name),

city_rev as (select city_name,month_name,revenue,
rank() over(partition by city_name order by revenue desc) as rnk,
sum(revenue) over(partition by city_name) as total_city_revenue from rev)

select city_name,month_name,revenue,round((revenue/total_city_revenue*100),2) as percentage_contribution from city_rev
where rnk=1
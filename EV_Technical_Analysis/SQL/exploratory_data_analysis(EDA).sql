                                                            -- EXPLORATORY DATA ANALYSIS(EDA) -- 
                                                           -- ================================ --  
														
-- PURPOSE :- Finding answers for the  business questions that client asked and finding things that are prefered by customer and can boost clients overall sales
-- ==============================================================================================================================================================

-- List of Questions :=
-- Question 1 : Which manufacturers are dominating the global market in 2024?
-- Question 2 : Which manufacturer offers the best "Range per Dollar"?
-- Question 3 : Which countries are the "hubs" for EV manufacturing and how is their sales performance?
-- Question 4 : Which battery technology provides the longest average range?
-- Question 5: Do cars with higher "Autonomous Levels" also have higher "Safety Ratings"?      


-- 1 
select 
	manufacturer,
    sum(units_sold_2024) as Total_Units_Sold,
    round(avg(price_usd), 2) as Avg_Price            
from electric_vehicles
group by manufacturer
order by Total_Units_Sold desc
limit 10;
-- ---------------------------------------------- 


-- 2
select
	manufacturer,
    model,
    price_usd,
    range_km,
    round(price_usd/range_km,2) as Cost_Per_Km_Range
from electric_vehicles
where range_km > 0                                # applied this condition to avoid division by zero 
order by Cost_Per_Km_Range asc                    # making sure that, its not in descending order otherwise we will get reverse what we want... 
limit 10;
-- ---------------------------------------------- 

-- 3
select
	country_of_manufacture,
    count(vehicle_id) as Overall_Produced_Models,
    sum(units_sold_2024) as Total_Regional_sales
from electric_vehicles
group by country_of_manufacture
order by Total_Regional_sales desc
limit 10;
-- ---------------------------------------------- 


-- 4
select
	battery_type,
    count(*) as Model_count,
    round(avg(range_km),2) as Average_Range,
    round(avg(charge_time_hr),2) as Average_Charge_Time
from electric_vehicles
group by battery_type
order by Average_Range desc;
-- ---------------------------------------------- 

-- 5
select
    Autonomous_Level,                                # range for autonomous_lever (0-5)
    round(avg(Safety_Rating), 2) as Avg_Safety_Rating,
    count(*) as Number_of_Models
from electric_vehicles
group by Autonomous_Level
order by Autonomous_Level DESC;              # after analyzing the output we found out that autonomous level doesn't effect safety rating ...
-- ---------------------------------------------- 




	
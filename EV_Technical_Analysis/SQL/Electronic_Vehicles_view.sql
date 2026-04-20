                                                              -- ELECTRIC_VEHICLES_VIEW--
                                                            -- ========================== --    

-- ==========
-- PURPOSE := To create virtual table that stays updated but only contains clean, structured data that we need for our dashboard...
-- =================================================================================================================================

create view electric_vehicles_view as 

select
	Vehicle_ID,
    Manufacturer,
    Model,
    Year,
    Battery_Type,
    Battery_Capacity_kWh,
    Range_km,
    Charging_Type,
    Charge_Time_hr,
    Price_USD,
    Color,
    Country_of_Manufacture,
    Safety_Rating,
    Units_Sold_2024,
    Warranty_Years,
    -- Adding calculated columns for insights
    round(Price_USD/ Range_km, 2) as Cost_Per_Km,
    (Units_Sold_2024 * Price_USD) as Estimated_Revenue
from electric_vehicles
where Price_USD > 0; -- Ensuring we can only see active market data 
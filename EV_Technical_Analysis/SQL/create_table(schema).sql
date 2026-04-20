                                                                   -- TABLE CREATION --
                                                                 -- =================== --  

-- =================                                                                  
-- PURPOSE:= To define schema for Technical analysis database project
-- ==================================================================== 



-- set data type as 'TEXT', because of some issue in importing table -----
-- ----------------------------------------------------------------------- 

DROP TABLE IF EXISTS electric_vehicles;

CREATE TABLE electric_vehicles (
    Vehicle_ID TEXT, -- Changed to TEXT to avoid rejection
    Manufacturer TEXT,
    Model TEXT,
    Year TEXT,
    Battery_Type TEXT,
    Battery_Capacity_kWh TEXT,
    Range_km TEXT,
    Charging_Type TEXT,
    Charge_Time_hr TEXT,
    Price_USD TEXT,
    Color TEXT,
    Country_of_Manufacture TEXT,
    Autonomous_Level TEXT,
    CO2_Emissions_g_per_km TEXT,
    Safety_Rating TEXT,
    Units_Sold_2024 TEXT,
    Warranty_Years TEXT
);
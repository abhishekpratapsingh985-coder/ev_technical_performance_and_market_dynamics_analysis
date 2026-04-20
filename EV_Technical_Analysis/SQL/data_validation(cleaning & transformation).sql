                                                  -- EXTRACTION LOADING AND TRANSFORMING DATA.....
												-- ============================================= --

-- =========
-- PURPOSE :- making sure data is cleaned and ready to perform multiple busines queries...
-- =======================================================================================  

-- Checking Null and empty values in dta..  
-- --------------------------------------- 
select 
	count(*) as total_rows,
    sum(case when Safety_Rating = '' or Safety_Rating is null then  1 else 0 end) as missing_safety,
    sum(case when CO2_Emissions_g_per_km = '' or CO2_Emissions_g_per_km is null  then 1 else 0 end) as missing_co2,
    sum(case when Autonomous_Level = '' or Autonomous_Level is null then 1 else 0 end) as missing_autonomy
from electric_vehicles;

--  Why these three column? cause client clearly mention these three in data description that have missing and null values----------
-- ----------------------------------------------------------------------------------------------------------------------------------------

-- -------------------
-- Data sanitaization 
-- -------------------

UPDATE electric_vehicles 
SET 
    Vehicle_ID = NULLIF(Vehicle_ID, ''),
    Year = NULLIF(Year, ''),
    Battery_Capacity_kWh = CASE WHEN Battery_Capacity_kWh = '' THEN '0' ELSE Battery_Capacity_kWh END,
    Range_km = CASE WHEN Range_km = '' THEN '0' ELSE Range_km END,
    Charge_Time_hr = CASE WHEN Charge_Time_hr = '' THEN '0' ELSE Charge_Time_hr END,
    Price_USD = CASE WHEN Price_USD = '' THEN '0' ELSE Price_USD END,
    Autonomous_Level = CASE WHEN Autonomous_Level = '' THEN '0' ELSE Autonomous_Level END,
    CO2_Emissions_g_per_km = CASE WHEN CO2_Emissions_g_per_km = '' THEN '0' ELSE CO2_Emissions_g_per_km END,
    Safety_Rating = CASE WHEN Safety_Rating = '' THEN '0' ELSE Safety_Rating END,
    Units_Sold_2024 = CASE WHEN Units_Sold_2024 = '' THEN '0' ELSE Units_Sold_2024 END,
    Warranty_Years = CASE WHEN Warranty_Years = '' THEN '0' ELSE Warranty_Years END;
    
-- Before sanitize data was showing 337 missing safety, 592 missing CO2 and missing autonomy was 442 but after we make sure their count is 0------
-- why we only change it to 0 not average?, - cause  some of them was mention in data prescription and about other we assumed and make sure that
-- doesn't effect our data integrity like 'safety rating' , we assume their safety check didn't happend....
-- --------------------------------------------------------------------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------------------------------------
-- DATA ALTERING , cause the data type when we import data was TEXT(for smooth import from csv) now we are changing
-- data to its original prescribed form...

ALTER TABLE electric_vehicles 
    MODIFY COLUMN Vehicle_ID INT NOT NULL,
    ADD PRIMARY KEY (Vehicle_ID),
    MODIFY COLUMN Manufacturer VARCHAR(255),
    MODIFY COLUMN Model VARCHAR(255),
    MODIFY COLUMN Year INT,                             # year define 'model year' not sales year......
    MODIFY COLUMN Battery_Type VARCHAR(255),
    MODIFY COLUMN Battery_Capacity_kWh DECIMAL(10, 2),
    MODIFY COLUMN Range_km INT,
    MODIFY COLUMN Charging_Type VARCHAR(255),
    MODIFY COLUMN Charge_Time_hr DECIMAL(10, 2),
    MODIFY COLUMN Price_USD DECIMAL(15, 2),
    MODIFY COLUMN Color VARCHAR(255),
    MODIFY COLUMN Country_of_Manufacture VARCHAR(255),
    MODIFY COLUMN Autonomous_Level DECIMAL(3, 1),
    MODIFY COLUMN CO2_Emissions_g_per_km DECIMAL(10, 2),
    MODIFY COLUMN Safety_Rating DECIMAL(3, 1),
    MODIFY COLUMN Units_Sold_2024 INT,
    MODIFY COLUMN Warranty_Years INT;
    
describe electric_vehicles;   # making sure that data matches provider info by checking twice...


select * from electric_vehicles;   # rechecking before moving forward...


🚗 EV Performance & Technical Market Analysis
📌 Project Overview
An end-to-end data exploration of the Electric Vehicle market (2015-2025). This project covers the full analytical pipeline: from SQL database architecture and data cleaning to complex Exploratory Data Analysis (EDA).

📊 Dataset Context
The analysis is based on a technical EV dataset containing 3,022 records with the following primary attributes:

Technical Specs: Battery Type, Capacity (kWh), Range (km), and Charging Types.

Market Data: Price (USD), Units Sold (2024), and Manufacturer details.

Original Data Source: Kaggle - 🔗 https://www.kaggle.com/datasets/pratyushpuri/ev-electrical-vehicles-dataset-3k-records-2025

🛠️ Implementation Phases
Database Migration: Structured raw data into a MySQL environment using optimized schemas.

Data Cleaning: Handled missing values in technical fields using statistical imputation (Mean/Mode).

Feature Engineering: Developed custom business metrics:

Cost_Per_Km: Measuring consumer value-for-money.

Estimated_Revenue: Calculating market footprint per model.

⚠️ Data Integrity & Dashboard Blockers
A critical phase of this project was the Data Validation step. Upon performing EDA, several "aggressive" anomalies were identified that prevented a transition to a final Power BI dashboard:

Valuation Scaling: The calculated total revenue exceeds $2.7 Trillion USD, which significantly diverges from actual global market benchmarks.

Price Inconsistency: Entry-level models are priced at "Luxury" levels (e.g., Nissan Leaf at $145k), which would lead to misleading "Value for Money" visualizations.

Volume Anomalies: Unit sales for specific models are scaled at a frequency that does not align with real-world adoption rates.

Decision: To maintain analytical integrity, this project concludes at the EDA and Insight phase. Moving to a dashboard with these values would provide a "false sense of accuracy" to stakeholders.

🔍 Key EDA Insights
The Efficiency Gap: Mid-tier battery technologies (60-90 kWh) consistently demonstrate better cost-efficiency than ultra-high capacity batteries.

Revenue vs. Tech: Manufacturers focusing on Lithium-ion and Solid-state variants dominate the revenue share, regardless of total unit volume.

Safety Influence: High safety ratings act as a critical market "floor"; models below a 3.0 rating show significantly stunted adoption. 

NOTE :-📌 because this data based on technical analysis rather than sales performance we only conclude insight that support technical part and avoid overall revenue, manufactrur base sales or country revenue etc.

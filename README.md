# Goodcabs BI Analysis | Power BI, SQL & Python

## Project Overview

Goodcabs is a cab service company operating across multiple cities in India. This project analyzes its operational, passenger, and revenue performance to help the Chief Operating Officer (COO) evaluate business performance, identify gaps against targets, and make data-driven decisions.

Using data transformation, SQL analysis, and Power BI, the project examines trip performance, passenger acquisition and retention, revenue generation, and passenger satisfaction.

**Objective:** Translate business data into actionable insights and recommendations to improve operational performance, revenue, passenger experience, and target achievement.

## Live Dashboard

**[View the Interactive Power BI Report](https://www.tinyurl.com/goodcabs-bi-analysis-report)**

## Tools & Technologies

- **Power BI:** Interactive dashboards, KPI tracking, data modeling, DAX measures, and visual analysis.
- **SQL / Google BigQuery:** Data querying, analytical calculations, aggregations, and business-performance analysis.
- **Python:** Data cleaning, transformation, and preparation.
- **Excel / CSV:** Structured data handling and intermediate data storage.
- **GitHub:** Project documentation, version control, and portfolio presentation.

## Analytical Workflow

1. **Data Preparation:** Cleaned and transformed the source data using Python.
2. **Data Analysis:** Used SQL to investigate business performance, compare actual results with targets, and identify trends across cities and months.
3. **Data Modeling:** Prepared analytical data for reporting and established the required relationships and measures.
4. **Dashboard Development:** Built an interactive Power BI report to explore performance across operational, passenger, and revenue dimensions.
5. **Business Recommendations:** Interpreted the findings and identified opportunities for improvement.

## Dashboard Pages

### 1. Executive

Provides a high-level overview of Goodcabs' business performance through key performance indicators, including trips, revenue, fare, passenger satisfaction, and repeat passenger rate.

**Key findings**
- Recorded **425,900 trips** against a target of 429,000.
- Generated approximately **₹108.19 million in revenue**.
- Achieved an average fare of approximately **₹254.02 per trip**.
- Recorded an average passenger rating of **7.54**, below the target of 7.98.
- Acquired approximately 177,000 new passengers against a target of 185,100.
- Recorded a repeat passenger rate of approximately 25.73%.

**Recommended focus:** Improve passenger satisfaction and new passenger acquisition while addressing the gap between actual and targeted trip volumes.

### 2. Trip Analysis

Evaluates trip volumes, target achievement, trip distance, and fare patterns across cities and months.

**Key findings**
- Overall trip volume fell slightly short of the target.
- Goodcabs achieved its monthly trip target in four of the six months, missing it in January and June.
- Vadodara missed its trip target in every month.
- Lucknow recorded 64,299 trips, with an average trip distance of 12.51 km and an average fare of ₹147.18.
- Jaipur recorded an average trip distance of 30.02 km and an average fare of ₹483.92.

**Recommended focus:** Investigate the recurring target shortfall in Vadodara, understand the monthly dips in January and June, and assess city-level differences in trip distance and fare.

### 3. Passenger Analysis

Examines passenger acquisition, repeat passenger behavior, and differences in customer engagement across cities.

**Key findings**
- New passengers accounted for the majority of passengers in the analysis.
- Repeat passenger trip frequency peaked at two trips.
- Passenger acquisition and repeat behavior varied across cities.
- Jaipur, Mysore, Kochi, and Chandigarh present opportunities for further investigation and targeted passenger engagement.

**Recommended focus:** Strengthen passenger retention through targeted loyalty and re-engagement initiatives, while evaluating city-specific strategies to convert newly acquired passengers into repeat customers.

### 4. Revenue Analysis

Evaluates revenue generation and differences in revenue performance across cities, alongside trip volumes and distance-related metrics.

**Key findings**
- Jaipur generated approximately ₹37.21 million in revenue, the highest among the cities analyzed.
- Lucknow recorded 64,299 trips but generated approximately ₹9.46 million in revenue.
- Mysore showed relatively low trip volume and revenue despite strong trip-target achievement and passenger ratings.
- Total recorded trip distance was approximately 8.15 million km.

**Recommended focus:** Investigate differences in revenue contribution across cities, evaluate fare and trip characteristics, and identify opportunities to increase revenue in cities with relatively low revenue generation.

## Business Value

This project demonstrates how business intelligence can support operational decision-making by:

- Monitoring actual performance against business targets.
- Identifying cities and months that require operational attention.
- Evaluating passenger acquisition and repeat behavior.
- Comparing city-level revenue contribution and trip characteristics.
- Translating analytical findings into practical, business-focused recommendations.

## Repository Structure

```text
goodcabs-bi-analysis/
├── Datasets/
│   └── csv_files_clean/
├── Exports/
├── Insights & Recommendations/
├── Notebook/
├── PBIX/
├── SQL/
├── metadata.txt
└── README.md
```

The repository contains the cleaned datasets, analytical notebooks, SQL files, Power BI report, exports, project metadata, and supporting insights and recommendations.

## Conclusion

The Goodcabs BI Analysis project brings together data preparation, SQL-based analysis, and interactive Power BI reporting to evaluate business performance across trips, passengers, and revenue.

Beyond tracking KPIs, the project focuses on identifying performance gaps, understanding differences across cities, and recommending actions that can help management make better-informed decisions.

**Explore the dashboard:** [Goodcabs BI Analysis — Power BI](https://www.tinyurl.com/goodcabs-bi-analysis-report)

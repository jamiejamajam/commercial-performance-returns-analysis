# Commercial Performance & Returns Analysis

## Project Results Log

This document records the key findings generated throughout the project. It provides a running summary of the SQL analysis completed during the investigation.

---

# Phase 1: Business Understanding

Business understanding, project objectives and stakeholder requirements are documented separately within the `PROJECT_CHARTER.md` file.

The analytical findings presented in this document begin from Phase 2 onwards.

---
---

# Phase 2: Data Preparation

## Dataset Overview

The project uses the Global Superstore dataset consisting of three related tables.

| Table | Description |
|--------|-------------|
| Orders | Customer orders, products, sales, profit, discounts and shipping information |
| Returns | Returned customer orders |
| People | Regional sales representatives |

### Data Preparation Completed

- Imported the Excel workbook into Python using Pandas.
- Loaded the Orders, Returns and People worksheets.
- Verified the successful import of each worksheet.
- Checked the structure and data types of each table.
- Identified missing values.
- Exported each worksheet as CSV files.
- Imported all CSV files into SQLite for analysis.

### Data Quality Summary

| Table | Rows | Missing Values |
|--------|-----:|---------------|
| Orders | 51,290 | Postal Code: 41,296 |
| Returns | 2,033 | None |
| People | 24 | None |

### Initial Observation

The only significant missing values occur within the Postal Code column. Since postcode analysis is outside the scope of this project, these missing values are not expected to materially affect the commercial analysis.

---

# Phase 3: Database Validation

## Import Validation

### Results

| Validation Check | Result |
|------------------|-------:|
| Orders Table | 51,290 rows |
| Returns Table | 2,033 rows |
| People Table | 24 rows |

### Business Insight

All three source tables were successfully imported into SQLite. The row counts matched the source data, confirming that no records were lost during the import process.

---

## Database Structure Validation

### Results

| Metric | Result |
|---------|-------:|
| Unique Orders | 25,728 |
| Unique Customers | 17,415 |
| Unique Products | 3,788 |
| Countries | 165 |
| Regions | 23 |
| Markets | 5 |
| Categories | 3 |
| Sub-Categories | 17 |

### Business Insights

- The business processed **25,728 unique customer orders**.
- Those orders contain **51,290 individual order lines**, indicating that many orders contain multiple products.
- The company serves **17,415 unique customers** across a broad international customer base.
- The business sells **3,788 unique products**.
- Products are organised into **17 sub-categories** across **3 major categories**.
- Operations span **165 countries**, **23 regions** and **5 global markets**, demonstrating the scale of the business.

---

# Phase 4: Exploratory Analysis

## Executive KPI Summary

### Results

| KPI | Value |
|------|------:|
| Total Sales | 12,642,501.91 |
| Total Profit | 1,467,457.29 |
| Total Quantity Sold | 178,312 |
| Total Customer Orders | 25,728 |
| Average Order Value | 491.39 |
| Average Profit per Order | 57.04 |
| Average Discount | 14% |
| Average Shipping Cost | 26.48 |

### Business Insights

- The business generated **12.64 million** in total sales.
- Total profit generated during the period was **1.47 million**.
- Customers purchased **178,312 products** across **25,728 unique orders**.
- The **average order value was 491.39**, providing a benchmark for future customer purchasing analysis.
- The business generated an **average profit of 57.04 per customer order**.
- The company applied an **average discount of 14%** across all sales.
- The **average shipping cost was 26.48 per order**, providing an initial benchmark for fulfilment costs.

---

# Project Progress

## Completed

- Business Understanding
- Data Preparation
- Database Creation
- Database Validation
- Executive KPI Analysis

## SQL Files Completed

- 01_database_validation.sql
- 02_exploratory_analysis.sql (Section 1: Executive KPI Summary)

---

## Section 2: Sales Performance Analysis

### Sales by Category

| Category | Total Sales |
|----------|------------:|
| Technology | 4,744,557.50 |
| Furniture | 4,110,451.90 |
| Office Supplies | 3,787,492.51 |

### Business Insights

- Technology generated the highest sales revenue, contributing approximately **37.5%** of total sales.
- Furniture was the second-largest revenue-generating category despite generating considerably lower profit than Technology.
- Office Supplies generated the lowest revenue among the three categories.

### Commercial Interpretation

Technology is the company's strongest revenue-generating category. While Furniture also produces significant sales, further investigation is required to understand why this revenue does not translate into comparable profitability.

---

### Profit by Category

| Category | Total Profit |
|----------|-------------:|
| Technology | 663,778.73 |
| Office Supplies | 518,595.83 |
| Furniture | 285,082.73 |

### Business Insights

- Technology generated the highest overall profit.
- Office Supplies generated substantially higher profit than Furniture despite producing lower sales.
- Furniture generated over **4.1 million** in sales but only **285 thousand** in profit.

### Commercial Interpretation

Furniture appears to underperform from a profitability perspective. This suggests higher operating costs, greater discounting, pricing challenges or other commercial factors that require further investigation.

---

### Average Discount by Category

| Category | Average Discount |
|----------|-----------------:|
| Furniture | 17% |
| Technology | 14% |
| Office Supplies | 14% |

### Business Insights

- Furniture receives the highest average discount across all categories.
- Technology and Office Supplies are discounted at similar levels.

### Commercial Interpretation

Higher discounting may be contributing to Furniture's weaker profitability. Later in the project, this relationship will be explored alongside return rates to determine whether discounting is associated with increased product returns.

---

### Average Shipping Cost by Category

| Category | Average Shipping Cost |
|----------|----------------------:|
| Technology | 50.01 |
| Furniture | 44.68 |
| Office Supplies | 13.11 |

### Business Insights

- Technology products incur the highest average shipping costs.
- Furniture also has relatively high fulfilment costs.
- Office Supplies have significantly lower shipping costs.

### Commercial Interpretation

Technology remains highly profitable despite higher shipping costs, indicating that strong margins offset fulfilment expenses. Shipping costs may become more significant when analysing the financial impact of returned products.

---

### Sales by Sub-Category

| Rank | Sub-Category | Total Sales |
|----:|--------------|------------:|
| 1 | Phones | 1,706,824.14 |
| 2 | Copiers | 1,509,436.27 |
| 3 | Chairs | 1,501,681.76 |
| 4 | Bookcases | 1,466,572.24 |
| 5 | Storage | 1,126,812.97 |

### Business Insights

- Phones generated the highest sales revenue.
- Copiers, Chairs and Bookcases also represent major revenue-generating product groups.
- These sub-categories account for a significant proportion of overall business revenue.

### Commercial Interpretation

These high-performing sub-categories will become key focus areas during the returns analysis, as high return rates within these products could have a substantial financial impact.

---

### Profit by Sub-Category

| Rank | Sub-Category | Total Profit |
|----:|--------------|-------------:|
| 1 | Copiers | 258,567.55 |
| 2 | Phones | 216,717.01 |
| 3 | Bookcases | 161,924.42 |
| 4 | Appliances | 141,562.59 |
| 5 | Chairs | 140,396.27 |

### Key Finding

The **Tables** sub-category generated an overall loss of **64,083.39** despite producing **757,041.92** in sales.

### Commercial Interpretation

Tables represent the first significant commercial issue identified within the analysis. Despite generating substantial revenue, the category is unprofitable. This will be investigated further during the profitability and returns analysis to determine whether discounting, operational costs or return behaviour are contributing factors.

---

### Top Products by Sales

| Rank | Product |
|----:|---------|
| 1 | Apple Smart Phone, Full Size |
| 2 | Cisco Smart Phone, Full Size |
| 3 | Motorola Smart Phone, Full Size |
| 4 | Nokia Smart Phone, Full Size |
| 5 | Canon imageCLASS 2200 Advanced Copier |

### Business Insights

The highest revenue-generating products are primarily premium smartphones, office technology and executive office furniture.

---

### Top Products by Profit

| Rank | Product |
|----:|---------|
| 1 | Canon imageCLASS 2200 Advanced Copier |
| 2 | Cisco Smart Phone, Full Size |
| 3 | Motorola Smart Phone, Full Size |
| 4 | Hoover Stove, Red |
| 5 | Sauder Classic Bookcase, Traditional |

### Business Insights

The highest-profit products are concentrated within the Technology category, reinforcing Technology's position as the strongest commercial performer.

---

## Section 2 Summary

The sales performance analysis identifies Technology as the company's strongest-performing category, generating both the highest sales revenue and the highest profit. Although Furniture also contributes significantly to revenue, its comparatively low profitability and higher average discount rate indicate potential commercial inefficiencies.

At the product level, smartphones and copiers dominate both revenue and profitability. In contrast, the Tables sub-category generated an overall loss despite producing substantial sales, making it a priority area for further investigation. These findings establish the commercial context required before analysing product return behaviour and its impact on business profitability.

---

# Profitability Analysis

## Category Profitability

### Results

| Category | Sales | Profit | Profit Margin |
|----------|-------:|--------:|--------------:|
| Technology | 4,744,557.50 | 663,778.73 | 13.99% |
| Office Supplies | 3,787,492.51 | 518,595.83 | 13.69% |
| Furniture | 4,110,451.90 | 285,082.73 | 6.94% |

### Business Insights

- Technology generated both the **highest revenue** and **highest total profit**, making it the strongest-performing product category.
- Office Supplies produced a profit margin almost equal to Technology despite substantially lower sales.
- Furniture generated over **£4.1 million** in sales but achieved a profit margin of only **6.94%**, indicating significantly weaker profitability.

---

## Sub-Category Profitability

### Key Findings

| Best Performing | Profit Margin |
|----------------|--------------:|
| Paper | 24.03% |
| Labels | 20.43% |
| Accessories | 17.30% |
| Copiers | 17.13% |
| Envelopes | 17.05% |

| Worst Performing | Profit Margin |
|-----------------|--------------:|
| Tables | -8.46% |
| Machines | 7.56% |
| Supplies | 9.29% |
| Chairs | 9.35% |
| Storage | 9.62% |

### Business Insights

- Paper generated the highest profit margin at **24.03%**, demonstrating excellent profitability despite relatively modest sales.
- Copiers combined both **high sales** and **high margins**, making them one of the company's strongest commercial products.
- Tables recorded a **negative profit margin (-8.46%)**, meaning the company lost money overall despite generating more than **£757k** in revenue.
- Tables will become a key focus during the Returns Analysis to determine whether return behaviour contributes to these losses.

---

## Country Profitability

### Highest Profit Countries

1. United States (£286,397)
2. China (£150,683)
3. India (£129,051)
4. United Kingdom (£111,900)
5. France (£109,029)

### Lowest Profit Countries

1. Turkey (-£98,447)
2. Nigeria (-£80,751)
3. Netherlands (-£41,070)
4. Honduras (-£29,482)
5. Pakistan (-£22,447)

### Business Insights

- The United States was the company's largest contributor to total profit.
- Multiple countries generated overall financial losses, with Turkey producing the largest negative profit.
- Geographic performance varies substantially, suggesting opportunities for regional pricing, product mix or operational improvements.

---

## Market Profitability

### Results

| Market | Total Profit |
|---------|-------------:|
| Europe | 449,551.72 |
| Asia Pacific | 403,176.04 |
| USCA | 304,214.41 |
| LATAM | 221,643.49 |
| Africa | 88,871.63 |

### Business Insights

- Europe generated the highest overall profit across all global markets.
- Asia Pacific also delivered strong profitability, closely following Europe.
- Africa remained profitable but contributed significantly less profit than the other major markets.

---

## Regional Profitability

### Key Findings

Top Performing Regions:

- Western Europe
- Eastern Asia
- Southern Asia
- Central America
- Oceania

Lowest Performing Regions:

- Western Asia
- Western Africa
- Central Asia

### Business Insights

- Western Europe generated the highest regional profit across the business.
- Three regions generated overall financial losses, indicating potential operational or commercial challenges.
- Regional profitability varies considerably despite similar overall company performance, highlighting opportunities for targeted commercial strategies.

---

---

# Returns Analysis

## Overall Return Rate

### Results

| Metric | Value |
|--------|------:|
| Returned Orders | 1,970 |
| Total Orders | 25,728 |
| Overall Return Rate | 7.66% |

### Business Insights

- Approximately **1 in every 13 customer orders** is returned.
- The overall return rate of **7.66%** provides the benchmark against which all future return analysis will be compared.

---

## Return Rate by Category

### Results

| Category | Returned Orders | Total Orders | Return Rate |
|----------|----------------:|-------------:|------------:|
| Furniture | 836 | 8,222 | 10.17% |
| Technology | 849 | 8,428 | 10.07% |
| Office Supplies | 1,677 | 19,464 | 8.62% |

### Business Insights

- Furniture recorded the highest return rate.
- Technology experienced a very similar return rate.
- Office Supplies generated the lowest return rate despite representing the largest proportion of customer orders.

### Commercial Interpretation

Furniture continues to emerge as an area requiring further investigation. Earlier analysis showed that Furniture generated relatively low profitability despite strong sales and also received the highest average discount. The higher return rate strengthens the case for investigating this category further.

---

## Return Rate by Sub-Category

### Highest Return Rates

| Rank | Sub-Category | Return Rate |
|----:|--------------|------------:|
| 1 | Fasteners | 12.09% |
| 2 | Supplies | 11.65% |
| 3 | Bookcases | 11.51% |
| 4 | Appliances | 11.46% |
| 5 | Machines | 11.22% |

### Lowest Return Rates

| Rank | Sub-Category | Return Rate |
|----:|--------------|------------:|
| 1 | Labels | 9.80% |
| 2 | Phones | 10.09% |
| 3 | Storage | 10.23% |
| 4 | Tables | 10.42% |
| 5 | Paper | 10.44% |

### Business Insights

- Return rates across most sub-categories fall within a relatively narrow range of approximately **10–12%**.
- Fasteners recorded the highest return rate.
- Labels experienced the lowest return rate.

### Commercial Interpretation

An interesting finding is that **Tables did not exhibit an unusually high return rate**, despite previously recording an overall financial loss. This suggests that the poor profitability of Tables is unlikely to be explained solely by customer returns. Other commercial factors such as pricing, discounting or product costs are likely to be contributing and should be investigated later in the project.

---

## Return Rate by Market

### Results

| Market | Return Rate |
|---------|------------:|
| Africa | 8.04% |
| Asia Pacific | 8.01% |
| USCA | 7.71% |
| Europe | 7.37% |
| LATAM | 7.29% |

### Business Insights

- Africa recorded the highest overall return rate.
- LATAM experienced the lowest return rate.
- Return rates across global markets remain relatively consistent.

### Commercial Interpretation

Although regional differences exist, no single market appears to be driving the company's overall return rate. This suggests that returns are likely influenced more by product characteristics than geography.

---

## Return Rate by Customer Segment

### Results

| Segment | Return Rate |
|----------|------------:|
| Corporate | 7.74% |
| Home Office | 7.62% |
| Consumer | 7.62% |

### Business Insights

- Return behaviour is remarkably consistent across all three customer segments.
- Corporate customers recorded only a marginally higher return rate.

### Commercial Interpretation

Customer segment does not appear to be a major driver of returns. Future investigation should therefore focus on products, pricing and operational factors rather than customer demographics.

---

## Section Summary

The business experiences an overall return rate of **7.66%**. Furniture recorded the highest category-level return rate and continues to emerge as an important area for investigation due to its relatively weak profitability and higher average discounting.

Perhaps the most significant finding from this section is that the **Tables** sub-category does **not** exhibit an unusually high return rate despite generating an overall financial loss. This suggests that returns alone do not explain the poor commercial performance of Tables, highlighting the importance of investigating additional factors such as pricing strategy, discounting and product costs before drawing conclusions.

---
---

# Financial Impact of Returns

## Overall Financial Impact

### Results

| Metric | Value |
|--------|------:|
| Revenue Associated with Returned Orders | 1,454,426.10 |
| Profit Associated with Returned Orders | 143,202.17 |

### Business Insights

- Returned orders account for **1.45 million** in sales revenue.
- Returned orders are associated with **143 thousand** in profit.
- Product returns therefore represent a significant commercial issue requiring ongoing management attention.

### Commercial Interpretation

Although not all returned revenue necessarily becomes a realised financial loss, this analysis highlights the substantial volume of sales and profit associated with returned orders. Understanding where these returns occur provides opportunities to improve profitability through operational and commercial initiatives.

---

## Returned Sales by Category

### Results

| Category | Returned Sales |
|----------|---------------:|
| Technology | 507,012.06 |
| Furniture | 500,608.31 |
| Office Supplies | 446,805.73 |

### Business Insights

- Technology generated the largest value of returned sales.
- Furniture followed closely behind despite lower overall sales than Technology.
- Office Supplies generated the lowest value of returned sales.

### Commercial Interpretation

Technology contributes the greatest value of returned revenue due to its high sales volume. Furniture remains an important focus area as its combination of relatively high returned sales, weaker profitability and higher return rate continues to suggest commercial inefficiencies.

---

## Returned Profit by Category

### Results

| Category | Returned Profit |
|----------|----------------:|
| Office Supplies | 53,940.81 |
| Technology | 46,968.07 |
| Furniture | 42,293.29 |

### Business Insights

- Office Supplies generated the highest level of profit associated with returned orders.
- Technology ranked second.
- Furniture generated the lowest returned profit despite relatively high returned sales.

### Commercial Interpretation

Returned profit differs from returned revenue because product margins vary across categories. This demonstrates why analysing both revenue and profit provides a more complete understanding of return performance.

---

## Returned Sales by Sub-Category

### Highest Returned Sales

| Rank | Sub-Category | Returned Sales |
|----:|--------------|---------------:|
| 1 | Bookcases | 199,320.16 |
| 2 | Chairs | 186,973.92 |
| 3 | Copiers | 171,416.41 |
| 4 | Phones | 162,753.54 |
| 5 | Storage | 129,248.05 |

### Business Insights

- Bookcases generated the largest value of returned sales.
- Chairs and Copiers also contributed substantially to returned revenue.
- The highest returned sales are concentrated within high-value product groups.

---

## Returned Profit by Sub-Category

### Results

| Highest Returned Profit | Value |
|-------------------------|------:|
| Copiers | 26,755.99 |
| Bookcases | 24,071.93 |
| Chairs | 20,742.12 |

### Important Finding

| Lowest Returned Profit | Value |
|------------------------|------:|
| Tables | -9,145.74 |
| Machines | -4,548.01 |

### Commercial Interpretation

This is one of the most significant findings in the project.

Earlier analysis showed that **Tables generated an overall financial loss** despite producing substantial sales. The returns analysis now shows that **returned Table orders are also associated with negative profit**, reinforcing the conclusion that this sub-category is commercially underperforming.

Unlike most other sub-categories, returns involving Tables are associated with additional financial losses rather than positive profit contribution. This makes Tables a high-priority candidate for pricing, sourcing and product strategy reviews.

---

## Section Summary

The financial impact analysis demonstrates that product returns are associated with **1.45 million** in revenue and **143 thousand** in profit. Technology accounts for the highest value of returned sales due to its strong commercial performance, while Furniture continues to emerge as an area requiring management attention because of its combination of high returned revenue, lower profitability and higher return rate.

At the product level, **Tables** remains the most commercially concerning sub-category. Earlier analysis identified it as the only major sub-category operating at an overall loss. The financial impact analysis further shows that returned Table orders are associated with negative profit, strengthening the case for a detailed investigation into pricing strategy, product costs, sourcing decisions and operational performance.

---
---

# Return Drivers Analysis

## Average Discount Comparison

### Results

| Return Status | Average Discount |
|--------------|-----------------:|
| Returned | 16% |
| Not Returned | 14% |

### Business Insights

- Returned orders received an average discount of **16%**.
- Non-returned orders received an average discount of **14%**.

### Commercial Interpretation

Returned orders are associated with higher average discounts. While this does not prove that discounting causes returns, it suggests that heavily discounted products may warrant further investigation.

---

## Average Sales Value Comparison

### Results

| Return Status | Average Sales Value |
|--------------|--------------------:|
| Not Returned | 247.82 |
| Returned | 240.20 |

### Business Insights

- Returned orders had a slightly lower average sales value.
- The difference between returned and non-returned orders is relatively small.

### Commercial Interpretation

The analysis does not provide evidence that higher-value orders are more likely to be returned. Product price alone does not appear to be a strong indicator of return behaviour within this dataset.

---

## Average Profit Comparison

### Results

| Return Status | Average Profit |
|--------------|---------------:|
| Not Returned | 29.23 |
| Returned | 23.65 |

### Business Insights

- Returned orders generated lower average profit than non-returned orders.
- Average profit per returned order was approximately **19% lower**.

### Commercial Interpretation

Returned orders are associated with weaker profitability. This reinforces the commercial importance of reducing returns, as returned orders contribute less profit on average.

---

## Average Shipping Cost Comparison

### Results

| Return Status | Average Shipping Cost |
|--------------|----------------------:|
| Not Returned | 26.55 |
| Returned | 26.32 |

### Business Insights

- Average shipping costs are almost identical for returned and non-returned orders.

### Commercial Interpretation

Shipping cost does not appear to be associated with return behaviour within this dataset. Other commercial factors are likely to have a greater influence.

---

## Return Rate by Shipping Mode

### Results

| Shipping Mode | Return Rate |
|--------------|------------:|
| Same Day | 8.82% |
| First Class | 7.65% |
| Standard Class | 7.59% |
| Second Class | 7.58% |

### Business Insights

- Same Day delivery recorded the highest return rate.
- The remaining shipping methods produced very similar return rates.

### Commercial Interpretation

Same Day delivery may warrant further investigation due to its relatively higher return rate. However, the differences across shipping methods are modest, suggesting shipping speed is unlikely to be the primary driver of returns.

---

## Section Summary

The return driver analysis identified several commercial patterns associated with returned orders. Returned products received slightly higher average discounts and generated lower average profit than non-returned orders, suggesting that pricing strategy may influence commercial performance.

Conversely, average sales value and shipping costs showed little difference between returned and non-returned orders, indicating these factors are unlikely to be major drivers of returns within this dataset.

Overall, discounting emerged as the strongest commercial characteristic associated with returned orders, although further analysis would be required to establish any causal relationship.

---

## Statistical Analysis

### Pearson Correlation Analysis

Pearson correlation coefficients were calculated to examine the linear relationships between the key commercial variables.

#### Key Findings

- Sales and Shipping Cost exhibited a **strong positive correlation (r = 0.77)**, indicating that larger orders generally incur higher shipping costs.
- Sales and Profit demonstrated a **moderate positive correlation (r = 0.48)**.
- Discount and Profit showed a **moderate negative correlation (r = -0.32)**, suggesting that increasing discounts are associated with lower profitability.
- Return status displayed virtually **no linear relationship** with the remaining variables.

#### Business Insight

Correlation analysis indicated that discounting has a measurable negative relationship with profitability, while return status alone provides little explanatory power regarding commercial performance.

---

### Discount vs Profit Analysis

A scatter plot was used to visualise the relationship between discount levels and profitability.

#### Key Findings

- Most transactions were completed without discount.
- Discounts were applied using fixed discount tiers.
- Profit generally declined as discount levels increased.
- High-profit transactions were concentrated among orders with little or no discount.
- Large negative profit values became increasingly common at higher discount levels.

#### Business Insight

The scatter plot visually supported the Pearson correlation results, demonstrating that heavier discounting is associated with reduced profitability.

---

### Profit Distribution by Return Status

A boxplot and descriptive statistics were used to compare profitability between returned and non-returned orders.

#### Key Findings

| Metric | Not Returned | Returned |
|--------|-------------:|----------:|
| Average Profit | £29.23 | £23.65 |
| Median Profit | £9.36 | £8.16 |

The overall profit distributions were broadly similar between both groups.

#### Business Insight

Returned orders generated slightly lower average profit than non-returned orders, although the difference appeared relatively small.

---

### Independent Samples Welch's t-Test

An independent samples Welch's t-test was conducted to determine whether the difference in average profit between returned and non-returned orders was statistically significant.

#### Results

| Statistic | Value |
|-----------|-------:|
| T-statistic | -2.484 |
| P-value | 0.013 |

#### Interpretation

Since the p-value was below the 5% significance level, the null hypothesis was rejected.

There is statistical evidence that average profit differs between returned and non-returned orders.

---

### Effect Size (Cohen's d)

Cohen's d was calculated to determine the practical significance of the observed difference.

#### Results

| Statistic | Value |
|-----------|-------:|
| Cohen's d | -0.032 |

#### Interpretation

Although the t-test identified a statistically significant difference, Cohen's d indicated a negligible practical effect.

#### Business Insight

The difference in average profit between returned and non-returned orders is statistically detectable due to the large sample size but is unlikely to have meaningful commercial significance.

---

### Multiple Linear Regression

A multiple linear regression model was developed to investigate how Sales, Discount, Shipping Cost, Quantity and Return Status collectively explain Profit.

#### Model Performance

| Metric | Value |
|--------|-------:|
| R² | 0.308 |
| Adjusted R² | 0.308 |

The model explained approximately **30.8%** of the variation in profit.

#### Key Findings

- Sales was a significant positive predictor of profit.
- Discount was the strongest negative predictor of profit.
- Shipping Cost had a small negative relationship with profit.
- Quantity showed a significant negative relationship after controlling for the remaining variables.
- Return Status was **not** statistically significant once the other commercial variables were considered.

#### Business Insight

Discounting remained the strongest commercial factor associated with reduced profitability, while return status alone did not significantly influence profit after controlling for sales, shipping costs and quantity.

---

### Multicollinearity Assessment (Variance Inflation Factor)

Variance Inflation Factor (VIF) analysis was performed to evaluate potential multicollinearity among the independent variables.

#### Results

| Variable | VIF |
|----------|----:|
| Sales | 2.51 |
| Shipping Cost | 2.44 |
| Quantity | 1.11 |
| Discount | 1.01 |
| Returned | 1.00 |

#### Interpretation

All VIF values were substantially below the commonly accepted threshold of 5, indicating no evidence of problematic multicollinearity.

Although the regression model reported a condition number of approximately **2,636**, this was most likely attributable to differences in variable scales rather than strong linear relationships between predictors.

#### Business Insight

The regression coefficients can therefore be interpreted with confidence, as multicollinearity was not found to materially affect the model.

---

---

# Overall Conclusions

## Executive Summary of Findings

This project demonstrates how a structured analytical workflow can transform raw transactional retail data into meaningful commercial insight. By integrating SQL, Python, statistical analysis and Power BI, the investigation identified the key drivers of sales performance, profitability and customer returns while producing evidence-based recommendations to support commercial decision-making.

The analysis consistently identified **Technology** as the company's strongest-performing category. Technology generated the highest total sales, highest total profit and one of the strongest profit margins despite incurring the highest average shipping costs. This suggests that healthy product margins more than offset fulfilment expenses, making Technology a key area for continued commercial investment.

In contrast, **Furniture** consistently underperformed across multiple stages of the analysis. Although the category generated over **£4.1 million** in sales, it recorded the weakest profit margin, received the highest average discount and experienced the highest category-level return rate. These findings demonstrate that revenue alone is an insufficient measure of commercial performance and highlight the importance of evaluating profitability alongside sales.

One of the most significant findings identified throughout the project was the **Tables** sub-category. Initial profitability analysis revealed that Tables generated an overall financial loss despite producing substantial revenue. Subsequent returns analysis demonstrated that Tables did not experience an unusually high return rate, challenging the initial assumption that returns were the primary cause of poor financial performance. Further investigation showed that returned Table orders were themselves associated with negative profit, suggesting that pricing strategy, sourcing costs, discounting or operational inefficiencies are more likely contributors to the category's sustained losses.

Returns analysis established an overall return rate of **7.66%**, providing a useful benchmark for future performance monitoring. Although returned orders represented a significant proportion of associated sales revenue, statistical modelling demonstrated that return status alone was not a significant predictor of profitability after controlling for other commercial variables. This illustrates the importance of considering multiple business factors rather than relying on a single performance metric when evaluating commercial outcomes.

Statistical analysis further strengthened the commercial conclusions. Correlation analysis identified a moderate negative relationship between discounting and profitability, while regression modelling confirmed **discount** as the strongest commercial factor associated with reduced profit. Although Welch's Independent Samples t-test identified a statistically significant difference in average profit between returned and non-returned orders, the negligible Cohen's d effect size demonstrated that the practical commercial impact of this difference was minimal. This highlights an important analytical principle: statistical significance should always be interpreted alongside practical business significance before informing management decisions.

---

## Key Commercial Takeaways

The project produced several commercially relevant findings:

- Technology represents the company's strongest commercial performer, combining high sales, strong profitability and healthy profit margins.
- Furniture requires further strategic review due to its combination of high revenue, weak profitability, higher discounting and elevated return rates.
- The Tables sub-category represents the most significant commercial concern identified during the investigation and warrants detailed review of pricing, sourcing and cost structures.
- Discounting consistently emerged as the strongest factor associated with reduced profitability, suggesting promotional strategies should be reviewed to protect margins.
- Customer returns remain commercially important but are unlikely to be the primary driver of poor profitability when considered in isolation.

---

## Analytical Reflection

This project demonstrates the value of combining descriptive analytics, statistical analysis and business intelligence to investigate commercial performance. Rather than relying on individual metrics, the investigation integrated SQL querying, Python-based analysis, hypothesis testing, regression modelling and interactive Power BI reporting to develop a comprehensive understanding of business performance.

Importantly, the project challenged initial assumptions rather than confirming them. While the Tables sub-category initially appeared to be underperforming due to customer returns, subsequent analysis demonstrated that returns alone could not explain its financial losses. This evidence-based approach reinforces the importance of allowing data to guide business conclusions rather than relying on intuition alone.

Overall, the project illustrates how modern analytical techniques can support strategic decision-making by transforming raw transactional data into actionable commercial insights. The findings provide a strong foundation for future investigations into pricing optimisation, inventory management, promotional strategy and profitability improvement.

# Management Recommendations

Based on the findings generated throughout this investigation, the following commercial recommendations are proposed to improve profitability, optimise operational performance and support future strategic decision-making.

| Priority | Recommendation | Business Rationale | Expected Business Impact |
|----------|----------------|--------------------|--------------------------|
| High | Review the Furniture pricing strategy. | Furniture generated strong revenue but consistently underperformed in terms of profitability while receiving the highest average discount and return rate. | Improved category profit margins and stronger overall profitability. |
| High | Conduct a detailed commercial review of the Tables sub-category. | Tables generated an overall financial loss despite substantial sales revenue, and returned Table orders also generated negative profit. | Identification of pricing, sourcing or operational issues contributing to sustained losses. |
| High | Optimise discounting policies across low-margin products. | Statistical analysis consistently identified discounting as the strongest commercial factor associated with reduced profitability. | Reduced margin erosion while maintaining competitive pricing. |
| Medium | Continue investing in Technology products. | Technology consistently delivered the highest sales, highest profit and one of the strongest profit margins despite higher fulfilment costs. | Increased long-term revenue and profitability through investment in high-performing products. |
| Medium | Monitor return behaviour using interactive Power BI dashboards. | Returns account for a significant proportion of sales revenue and should be continuously monitored for emerging trends. | Earlier identification of operational issues and improved commercial reporting. |
| Medium | Investigate regional performance in underperforming markets. | Several countries and regions generated consistently weak profitability despite overall business growth. | Improved regional resource allocation and targeted commercial interventions. |
| Medium | Expand future analysis to include supplier and inventory performance. | The current dataset focuses on sales transactions and returns but does not explain underlying supply chain or procurement costs. | More comprehensive understanding of profitability drivers across the business. |
| Low | Develop predictive models to forecast returns and profitability. | Machine learning techniques could identify high-risk orders before fulfilment and support proactive commercial decision-making. | Improved forecasting accuracy and enhanced strategic planning capabilities. |

---

## Strategic Recommendations

The findings from this investigation suggest that management attention should primarily focus on improving profitability rather than simply increasing sales revenue. While Technology demonstrates that strong sales can translate into healthy commercial performance, the Furniture category highlights that high revenue alone does not guarantee profitability.

The analysis also demonstrates the importance of evaluating multiple performance indicators simultaneously. Categories experiencing higher discounting, weaker margins and elevated return rates should receive greater commercial attention than categories generating strong financial returns despite higher operating costs.

Future commercial strategy should therefore prioritise margin optimisation, targeted pricing reviews and continued monitoring of return behaviour through interactive business intelligence reporting. These initiatives are expected to provide greater long-term value than focusing exclusively on revenue growth.

---

## Future Analytical Opportunities

Several opportunities were identified for extending this analysis in a commercial environment:

- Build predictive models to forecast customer returns.
- Forecast future sales using time series analysis.
- Perform customer lifetime value (CLV) analysis.
- Investigate supplier-level profitability.
- Analyse inventory turnover and stock optimisation.
- Develop customer segmentation models for targeted marketing.
- Build automated Power BI dashboards connected to live business data.
- Incorporate external economic variables to investigate their impact on commercial performance.

Implementing these analyses would provide management with a more comprehensive understanding of business performance while supporting increasingly data-driven commercial decision-making.
# Project 1
## Analyzing Educational Attainment and Household Size with Python
[Project and Dataset](https://github.com/lorenzoracadio/project-portfolio/tree/main/Project%201%20-%20Statistical%20Analysis%20and%20Visualization%20Using%20Python)<br>
Summary: Using correlation and regression analysis, the analysis showed that __educational attainment__ of the household head has a small, signficant impact on the __number of family members__. *(Data Source: Kaggle)*

*Featured Skills (Using Python):*
- Data Cleaning and Aggregation
- Visualization
- Statistical Analysis (Regression, Correlation)
- Report Writing

Background: Fertility rates are declining around the world (Bongaarts and Hodgson, 2022) and while there are multiple factors, this brief study analyzes the relationship of educational attainment of the household head (hereinafter referred to as educational attainment) on family size using data from the Family Income and Expenditure Survey (FIES) conducted by the Philippine Statistics Authority (PSA) in 2017. For convenience, a standard OLS regression, and some preceding tests, was used.<br>

The research determines that<br>
1. There is a statistically significant but very weak negative correlation between educational attainment and family size.
2. Based on the results and visual observation, family size decreases as educational attainment increases

For future studies, one recommendation could be to look at changes in the data over a period of a few years.<br>

### Step 1: Prepare Educational Attainment column.
### Educational Attainment has many categories in the dataset. Similar levels of education are lumped into ordinal categories as follows:
0 - Preschool or Less<br>
1 - Elementary Graduate or Less<br>
2 - High School Graduate or Less<br>
3 - College Graduate or Less<br>
4 - Postgraduate Studies<br>
5 - Vocational/Technical Programs<br>
6 - Others

![image](https://github.com/user-attachments/assets/33f98fee-194b-405a-b544-eafa1bda6208)

### Step 2A: Look for correlations between the variables.
### In simple terms, correlation is a measure of the direction one variable changes based on the changes made in another variable. (e.g. if I eat more food, I notice that my weight increases | positive correlation)

Correlation is measured as a value between -1 (negatively correlated) and 1 (positively correlated) that follows these rules:
> 0.7 to 1.0 (-0.7 to -1.0): Strong correlation<br>
0.4 to 0.7 (-0.4 to -0.7): Moderate correlation<br>
0.1 to 0.4 (-0.1 to -0.4): Weak correlation<br>
0: No correlation<br>

Example interpretation if the correlation between food and weight is 0.78:<br>
There is a strong positive correlation (__r=0.78__) between food intake and weight, suggesting that higher food intake is associated with higher weight.

# Project 2
## Preparing and Visualizing Insurance Client Data Using SQL and Tableau 
[Project and Dataset](https://github.com/lorenzoracadio/project-portfolio/tree/3e9d3bd003f9e442613850fe72bc4aa2a275646a/Project%202%20-%20Exploratory%20Analysis%20of%20Client%20Data%20Using%20SQL%20and%20Tableau)
- The data based on the actual client data from an insurance agent shows __client distribution by demographic__. Data was cleaned using PostgreSQL and visualized on Tableau.

*Featured Skills (Using SQL and Tableau):*
- Data Cleaning
- Exploratory Analysis
- Visualization

*Data Source: Anonymized client information provided by a friend in the insurance industry*

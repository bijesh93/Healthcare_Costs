# Healthcare Cost Analysis & Prediction

In this notebook, we analyze healthcare cost data and build a predictive model to estimate medical charges based on patient characteristics such as age, BMI, smoking status, etc.

# Import Libraries
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, r2_score

# Load & Inspect Data
df = pd.read_csv("data/insurance.csv")
df.head()
df.info()
df.describe()

# Data Cleaning
# Check for nulls
df.isnull().sum()

# Optional: create BMI categories
def bmi_category(bmi):
    if bmi < 18.5:
        return 'Underweight'
    elif bmi < 25:
        return 'Normal weight'
    elif bmi < 30:
        return 'Overweight'
    else:
        return 'Obese'

df['BMI_Category'] = df['bmi'].apply(bmi_category)

# Exploratory Data Analysis (EDA)
Age Distribution
sns.histplot(data=df, x="age", kde=True, bins=10, color="steelblue", alpha=0.6)
plt.title("Age Distribution")
plt.ylabel("Count")
plt.show()

Smoker vs Non-Smoker Charges
sns.boxplot(data=df, x="smoker", y="charges")
plt.title("Medical Charges: Smokers vs Non-Smokers")
plt.show()

Charges by BMI Category
sns.boxplot(data=df, x="BMI_Category", y="charges")
plt.title("Medical Charges by BMI Category")
plt.show()

Correlation Matrix
corr = df[['age', 'bmi', 'children', 'charges']].corr()
sns.heatmap(corr, annot=True, cmap='coolwarm', vmin=0, vmax=1)
plt.title("Correlation Matrix")
plt.show()

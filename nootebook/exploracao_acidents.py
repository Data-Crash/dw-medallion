import pandas as pd

df = pd.read_csv("raw/Accidents0515.csv")
print(df.head())
print(df.info())
print(df.describe())
print(df.isnull().sum())
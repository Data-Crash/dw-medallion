import pandas as pd

df = pd.read_parquet("bronze/accidents.parquet")

print("Formato:", df.shape)
print("Colunas:", df.columns.tolist())
print(df.head())

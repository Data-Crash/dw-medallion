import logging
from etl.extract import extract_accidents
from etl.transform import transform_accidents
from etl.load import save_silver
from utils import load_codes

logging.basicConfig(filename="logs/etl.log", level=logging.INFO)

if __name__ == "__main__":
    raw_file = "data/raw/Accidents0515.csv"
    bronze_file = "data/bronze/accidents.parquet"
    silver_file = "data/silver/accidents.parquet"

    df_raw = extract_accidents(raw_file)
    df_raw.to_parquet(bronze_file, index=False)

    codes = load_codes("dd_codes.md")
    df_silver = transform_accidents(df_raw, codes)
    save_silver(df_silver, silver_file)

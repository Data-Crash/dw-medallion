import logging
from pathlib import Path
import pandas as pd

from etl.extract import extract_accidents
from etl.transform import transform_accidents
from etl.utils import load_codes

logging.basicConfig(level=logging.INFO)

if __name__ == "__main__":
    raw_file = Path("../raw//Accidents0515.csv")
    bronze_file = Path("../raw/accidents.parquet")
    silver_file = Path("./accidents.parquet")

    # Garante pastas
    bronze_file.parent.mkdir(parents=True, exist_ok=True)
    silver_file.parent.mkdir(parents=True, exist_ok=True)

    # Raw → Bronze
    logging.info("Carregando dados Raw...")
    df_raw = extract_accidents(raw_file)
    df_raw.to_parquet(bronze_file, index=False)
    logging.info(f"Bronze salvo em {bronze_file}")

    # Bronze → Silver
    logging.info("Gerando Silver...")
    df_bronze = pd.read_parquet(bronze_file)
    #df_bronze = df_bronze.sample(100_000, random_state=42)
    codes = load_codes("../raw/dd_codes.md")
    df_silver = transform_accidents(df_bronze, codes)
    df_silver.to_parquet(silver_file, index=False)
    logging.info(f"Silver salvo em {silver_file}")

# etl/extract.py
import pandas as pd
import logging

def extract_accidents(raw_path: str) -> pd.DataFrame:
    try:
        df = pd.read_csv(raw_path)
        logging.info(f"Arquivo {raw_path} lido com {df.shape[0]} linhas")
        return df
    except Exception as e:
        logging.error(f"Erro ao ler {raw_path}: {e}")
        raise

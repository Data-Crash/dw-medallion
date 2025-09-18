# etl/load.py
import pandas as pd
import logging

def save_silver(df: pd.DataFrame, path: str):
    try:
        df.to_parquet(path, index=False)
        logging.info(f"Silver salvo em {path} ({df.shape[0]} linhas)")
    except Exception as e:
        logging.error(f"Erro ao salvar {path}: {e}")
        raise

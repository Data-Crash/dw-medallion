import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.dialects.postgresql import insert
import logging

logging.basicConfig(level=logging.INFO)

db_url = "postgresql://postgres:postgres@localhost:5432/gis"
silver_file_path = "./accidents.parquet"
table_name = "accident"

try:
    engine = create_engine(db_url)
    logging.info(f"Conectado ao banco de dados em {db_url}")

    df_silver = pd.read_parquet(silver_file_path)
    logging.info(f"Lido o arquivo {silver_file_path} com {df_silver.shape[0]} linhas")

    # Define a função de UPSERT para o método to_sql
    def upsert_on_conflict_accident(table, conn, keys, data_iter):
        data = [dict(zip(keys, row)) for row in data_iter]
        insert_stmt = insert(table.table).values(data)
        
        # Cria a instrução de conflito para a chave primária
        upsert_stmt = insert_stmt.on_conflict_do_update(
            index_elements=["accident_index"],
            set_=insert_stmt.excluded
        )
        conn.execute(upsert_stmt)
        conn.commit()

    # Executa a operação de UPSERT
    df_silver.to_sql(
        table_name,
        con=engine,
        if_exists="append",
        index=False,
        method=upsert_on_conflict_accident
    )
    logging.info(f"Tabela '{table_name}' populada/atualizada com sucesso!")

    silver_file_path = "./vehicles.parquet"
    table_name = "vehicle"

    df_silver = pd.read_parquet(silver_file_path)
    logging.info(f"Lido o arquivo {silver_file_path} com {df_silver.shape[0]} linhas")

    # Define a função de UPSERT para o método to_sql
    def upsert_on_conflict_vehicle(table, conn, keys, data_iter):
        data = [dict(zip(keys, row)) for row in data_iter]
        insert_stmt = insert(table.table).values(data)
        
        # Cria a instrução de conflito para a chave primária
        upsert_stmt = insert_stmt.on_conflict_do_update(
            index_elements=["accident_index","vehicle_reference"],
            set_=insert_stmt.excluded
        )
        conn.execute(upsert_stmt)
        conn.commit()

    # Executa a operação de UPSERT
    df_silver.to_sql(
        table_name,
        con=engine,
        if_exists="append",
        index=False,
        method=upsert_on_conflict_vehicle
    )
    logging.info(f"Tabela '{table_name}' populada/atualizada com sucesso!")

    silver_file_path = "./casualties.parquet"
    table_name = "casualty"

    df_silver = pd.read_parquet(silver_file_path)
    logging.info(f"Lido o arquivo {silver_file_path} com {df_silver.shape[0]} linhas")

    # Define a função de UPSERT para o método to_sql
    def upsert_on_conflict(table, conn, keys, data_iter):
        data = [dict(zip(keys, row)) for row in data_iter]
        insert_stmt = insert(table.table).values(data)
        
        # Cria a instrução de conflito para a chave primária
        upsert_stmt = insert_stmt.on_conflict_do_update(
            index_elements=["accident_index","vehicle_reference", "casualty_reference"],
            set_=insert_stmt.excluded
        )
        conn.execute(upsert_stmt)
        conn.commit()

    # Executa a operação de UPSERT
    df_silver.to_sql(
        table_name,
        con=engine,
        if_exists="append",
        index=False,
        method=upsert_on_conflict
    )
    logging.info(f"Tabela '{table_name}' populada/atualizada com sucesso!")

except Exception as e:
    logging.error(f"Erro ao carregar dados para o banco de dados: {e}")
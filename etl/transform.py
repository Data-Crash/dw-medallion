import pandas as pd

def transform_accidents(df: pd.DataFrame, codes: dict) -> pd.DataFrame:
    # Garantir colunas obrigatórias
    required_cols = ["Accident_Index", "Date", "Longitude", "Latitude"]
    for col in required_cols:
        if col not in df.columns:
            raise ValueError(f"Coluna obrigatória ausente: {col}")

    # Ajuste de tipos
    df["Date"] = pd.to_datetime(df["Date"], errors="coerce")
    df["Time"] = pd.to_datetime(df["Time"], format="%H:%M", errors="coerce").dt.time

    # Tradução de colunas categóricas
    coded_columns = [
        "Accident_Severity", "Day_of_Week", "Road_Type", "Speed_limit",
        "Junction_Detail", "Junction_Control",
        "Pedestrian_Crossing-Physical_Facilities",
        "Light_Conditions", "Weather_Conditions",
        "Road_Surface_Conditions", "Special_Conditions_at_Site",
        "Urban_or_Rural_Area", "Carriageway_Hazards"
    ]
    for col in coded_columns:
        if col in df.columns and col in codes:
            df[col] = df[col].map(codes[col]).fillna("Unknown")

    # Tratar valores nulos e outliers básicos
    df = df.dropna(subset=["Date", "Longitude", "Latitude"])
    df = df[df["Longitude"].between(-10, 5)]   
    df = df[df["Latitude"].between(49, 61)]

    if "Speed_limit" in df.columns:
        df = df[df["Speed_limit"].between(10, 130)]

    # Garantir inteiros válidos
    if "Number_of_Vehicles" in df.columns:
        df = df[df["Number_of_Vehicles"] >= 1]
    if "Number_of_Casualties" in df.columns:
        df = df[df["Number_of_Casualties"] >= 0]

    # Remover duplicatas
    df = df.drop_duplicates(subset=["Accident_Index"])

    # Padronizar nomes
    df.columns = [col.lower().replace(" ", "_").replace("-", "_") for col in df.columns]

    return df

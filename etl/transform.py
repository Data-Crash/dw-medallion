# etl/transform.py
import pandas as pd
from utils import load_lookup_table

def transform_accidents(df: pd.DataFrame, codes: dict) -> pd.DataFrame:
    df["Date"] = pd.to_datetime(df["Date"], errors="coerce")
    df["Accident_Index"] = df["Accident_Index"].map(codes["Accident_Index"])
    df["Longitude"] = df["Longitude"].map(codes["Longitude"])
    df["Latitude"] = df["Latitude"].map(codes["Latitude"])
    df["Accident_Severity"] = df["Accident_Severity"].map(codes["Accident_Severity"])
    df["Number_of_Vehicles"] = df["Number_of_Vehicles"].map(codes["Number_of_Vehicles"])
    df["Number_of_Casualties"] = df["Number_of_Casualties"].map(codes["Number_of_Casualties"])
    df["Date"] = df["Date"].map(codes["Date"])
    df["Day_of_Week"] = df["Day_of_Week"].map(codes["Day_of_Week"])
    df["Time"] = df["Time"].map(codes["Time"])
    df["Road_Type"] = df["Road_Type"].map(codes["Road_Type"])
    df["Speed_limit"] = df["Speed_limit"].map(codes["Speed_limit"])
    df["Junction_Detail"] = df["Junction_Detail"].map(codes["Junction_Detail"])
    df["Junction_Control"] = df["Junction_Control"].map(codes["Junction_Control"])
    df["Pedestrian_Crossing-Physical_Facilities"] = df["Pedestrian_Crossing-Physical_Facilities"].map(codes["Pedestrian_Crossing-Physical_Facilities"])
    df["Light_Conditions"] = df["Light_Conditions"].map(codes["Light_Conditions"])
    df["Weather_Conditions"] = df["Weather_Conditions"].map(codes["Weather_Conditions"])
    df["Road_Surface_Conditions"] = df["Road_Surface_Conditions"].map(codes["Road_Surface_Conditions"])
    df["Special_Conditions_at_Site"] = df["Special_Conditions_at_Site"].map(codes["Special_Conditions_at_Site"])
    df["Urban_or_Rural_Area"] = df["Urban_or_Rural_Area"].map(codes["Urban_or_Rural_Area"])
    df.columns = [col.lower().replace(" ", "_") for col in df.columns]
    return df

from pathlib import Path
import pandas as pd

# Locate the project folder and dataset
PROJECT_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = PROJECT_DIR / "data"

csv_files = list(DATA_DIR.glob("*.csv"))

if not csv_files:
    raise FileNotFoundError(
        "No CSV file found. Place the Kaggle CSV inside the data folder."
    )

file_path = csv_files[0]
df = pd.read_csv(file_path)

print("\n--- DATASET LOADED SUCCESSFULLY ---")
print(f"File: {file_path.name}")
print(f"Rows: {df.shape[0]}")
print(f"Columns: {df.shape[1]}")

print("\n--- FIRST 5 ROWS ---")
print(df.head())

print("\n--- COLUMN NAMES ---")
print(df.columns.tolist())

print("\n--- DATA TYPES AND NON-NULL COUNTS ---")
df.info()

print("\n--- MISSING VALUES ---")
print(df.isnull().sum())

print("\n--- DUPLICATE ROWS ---")
print(df.duplicated().sum())
Get-ChildItem "$HOME\Downloads" -Filter "*.csv" -Recurse -ErrorAction SilentlyContinue | Select-Object FullName
PROJECT_DIR = Path(__file__).resolve().parent.parent
csv_files = list(DATA_DIR.glob("*.csv"))

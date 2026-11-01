from pathlib import Path
import pandas as pd

PROJECT_DIR = Path(__file__).resolve().parent.parent
DATA_FILE = PROJECT_DIR / "data" / "telco_customer_churn_cleaned.csv"
OUTPUT_DIR = PROJECT_DIR / "data"

df = pd.read_csv(DATA_FILE)


# 1. Financial comparison by churn status
financial_analysis = (
    df.groupby("Churn")
    .agg(
        Customers=("customerID", "count"),
        Average_Monthly_Charges=("MonthlyCharges", "mean"),
        Average_Total_Charges=("TotalCharges", "mean"),
        Average_Tenure=("tenure", "mean")
    )
    .round(2)
    .reset_index()
)

print("\nFINANCIAL ANALYSIS BY CHURN")
print(financial_analysis)

financial_analysis.to_csv(
    OUTPUT_DIR / "financial_analysis_by_churn.csv",
    index=False
)


# 2. Service analysis
services = [
    "OnlineSecurity",
    "TechSupport",
    "OnlineBackup",
    "DeviceProtection"
]

for column in services:

    result = (
        df.groupby(column, observed=True)
        .agg(
            Total_Customers=("customerID", "count"),
            Churned_Customers=(
                "Churn",
                lambda x: (x == "Yes").sum()
            )
        )
        .reset_index()
    )

    result["Churn_Rate"] = (
        result["Churned_Customers"]
        / result["Total_Customers"] * 100
    ).round(2)

    print(f"\nCHURN BY {column.upper()}")
    print(result)

    filename = f"churn_by_{column.lower()}.csv"

    result.to_csv(
        OUTPUT_DIR / filename,
        index=False
    )


print("\nFINANCIAL AND SERVICE ANALYSIS COMPLETED!")
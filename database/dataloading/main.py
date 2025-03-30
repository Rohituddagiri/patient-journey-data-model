from postgresLoader import PostgresLoader
from sourceDataMapping import tableToCSVFile
from dotenv import load_dotenv
import os

load_dotenv()

DB_NAME = os.environ.get("DB_NAME")
DB_USER = os.environ.get("DB_USER")
DB_PASSWORD = os.environ.get("DB_PASSWORD")

loader = PostgresLoader(db_name=DB_NAME, db_user=DB_USER, db_password=DB_PASSWORD)
loader.make_connection()
for t_name, f_name in tableToCSVFile.items():
    loader.copy_csv_to_table(csv_file=f_name,table_name=t_name)
loader.close_connection()
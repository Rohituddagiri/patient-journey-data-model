import psycopg2

class PostgresLoader:
    def __init__(self, db_name, db_user, db_password, db_host="localhost",db_port="5433"):
        """_summary_ Initialize database connections. 
        Args:
            db_name (_type_): _description_
            db_user (_type_): _description_
            db_password (_type_): _description_
            db_host (str, optional): _description_. Defaults to "localhost".
            db_port (str, optional): _description_. Defaults to "5433".
        """
        self.db_name = db_name
        self.db_user = db_user
        self.db_password = db_password
        self.db_host = db_host
        self.db_port = db_port
        
    def make_connection(self):
        """_summary_ Establish connection to PostgreSQL
        """
        try:
            self.conn = psycopg2.connect(
                dbname=self.db_name, 
                user=self.db_user,
                password=self.db_password,
                host=self.db_host,
                port=self.db_port
            )
            
            self.cur = self.conn.cursor()
            print("DB connection Established.")
        except Exception as e:
            print("DB Connection Error: ", e)
            
    def close_connection(self):
        """ Close database connection
        """
        if self.cur:
            self.cur.close()
        if self.conn:
            self.conn.close()
        print("DB Connection Closed.")
    
        
    def copy_csv_to_table(self, csv_file, table_name):
        """_summary_ Load CSV file into SQL table.

        Args:
            csv_file (_type_): _description_
            table_name (_type_): _description_
        """
        try:
            schema_name = 'STAGE_SCHEMA'
            print(f"\n Processing {csv_file} --> {table_name}...")    
            copy_query = f"""COPY "{schema_name}".{table_name} FROM STDIN DELIMITER AS ','""" 
            with open(csv_file, "r") as f:
                next(f)
                self.cur.copy_expert(copy_query, f)    
            self.conn.commit()
            print(f"Successfully loaded rows into {table_name}")
            
        except Exception as e:
            print(f"Error processing {csv_file}: {e}")
from importlib import resources
from importlib.metadata import metadata
import resource
import psycopg2
import os
import sqlalchemy as db

DBUSER= os.getenv('DBUSER','postgres')
DBPASSWORD = os.getenv('DBPASSWORD','postgres')
DBHOST = os.getenv('DBHOST','rust')
DBPORT = os.getenv('DBPORT','5432')
DBNAME = os.getenv('DBNAME','postgres')


engine = db.create_engine(
    f"postgresql+psycopg2://{DBUSER}:{DBPASSWORD}@{DBHOST}:{DBPORT}/{DBNAME}", client_encoding='utf8')

conn = engine.connect()
metadata = db.MetaData()
print(metadata.tables.keys())
# resources = db.Table('resources', metadata, autoload=True, autoload_with=engine)

# print(resources.columns.keys())

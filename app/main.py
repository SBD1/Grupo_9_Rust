from turtle import position
import psycopg2
import os
import sqlalchemy as db
from sqlalchemy.orm import sessionmaker

DBUSER= os.getenv('DBUSER','postgres')
DBPASSWORD = os.getenv('DBPASSWORD','postgres')
DBHOST = os.getenv('DBHOST','rust')
DBPORT = os.getenv('DBPORT','5432')
DBNAME = os.getenv('DBNAME','postgres')


engine = db.create_engine(
    f"postgresql+psycopg2://{DBUSER}:{DBPASSWORD}@{DBHOST}:{DBPORT}/{DBNAME}", client_encoding='utf8')

conn = engine.connect()
metadata = db.MetaData()
metadata.reflect(bind=engine)



print("Welcome to Rust")
print("""((((((((((((((((((((((((((((((
((((((((((((((((((((((((((((((
(((((((((((((&&&&&&(((((((((((
((((((((((((((&&&&&(((((((((((
((((((((((((((((((((((((((((((
((((%(((((((((&&&&((((((((((((
((((&&&&&&(&&%(&&(((((((((((((
((((&&&&&&(&&%((((&&&(((((((((
(((((((((((((((((#&(&&&&((((((
((((((((((((((((((((&&&&&&&(((
(((((((((((((((((((((%&&((((((
((((((((((((((((((((((((((((((
""")

# while(True):

print('You do not have a character, one will be created for you')
# print('1 for Yes, 0 for No')
characters = conn.execute(metadata.tables['characters'].select())
for char in characters:
    print(char)
    
conn.execute(metadata.tables['characters'].insert().values(charactersid='4',name='teste', position=0,charactermodel='model1',type='main',item='testes'))
print('personagem criado!')
characters = conn.execute(metadata.tables['characters'].select())
for char in characters:
    print(char)
conn.close()
engine.dispose()


#INSERT INTO Characters VALUES (1, 'Character1', '10', 'model1', 1, 'type1', 'item1'),(2, 'Character2', '5', 'model2', 2, 'type2', 'item2'),(3, 'Character3', '20', 'model3', 3, 'type3', 'item3');

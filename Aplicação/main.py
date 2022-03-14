import psycopg2

conn = psycopg2.connect(dbname="Rust", user="", password="")
cur = conn.cursor()

cur.execute("INSERT INTO Maps VALUES (%d)",(1))
conn.commit()

cur.execute("SELECT * FROM Maps;")
cur.fetchall()

cur.close()
conn.close()
exit()

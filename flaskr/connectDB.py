import mysql.connector
from instance import dbCreds

mydb = mysql.connector.connect(
    host=dbCreds.hostname,
    user=dbCreds.username,
    passwd=dbCreds.password,
    database=dbCreds.database,
)

my_cursor = mydb.cursor()

my_cursor.execute('SHOW DATABASES')
for db in my_cursor:
    print(db)

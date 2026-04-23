CSCI 5140 - Database Management Systems
File: README.txt

PROJECT TITLE: Project
AUTHORS:Laura Dominguez
DATE: 02/21/26

DESCRIPTION: 
This project was developed as part of a structured course assignment. The SQL scripts were used to create the las_palmas_medical_center database, define its schema, and populate it with data for analysis and querying.

FILES INCLUDED:
create_db.sql : Creates the database schema. 
insert_db.sql : Insert data into the database tables.
query_db_python.py: Connect to the las_palmas_medical_center database and generate 8 queries using Python.

SYSTEM REQUIREMENTS:
- MySQL 9.x
- MySQL Workbench 8.x
- Python 3.13.0
- pip install mysql-connector-python

HOW TO SETUP AND RUN ON MY SQL Workbench:
1. Open MySQL Workbench and connect to your local MySQL server.
2. Open the create_db.sql file using File>Open SQL Script.
3. Execute the script by Query>Execute(All or Selection). 
4. Repeat steps 2 and 3 to open and execute insert_db.sql file. 

HOW TO SETUP AND RUN ON MySQL Command Line Client:
1. Open the MySQL Command Line Client.
2. Enter your MySQL password when prompted.
3. Execute the scripts:
   source "path/to/create_db.sql";
   source "path/to/insert_db.sql";

HOW TO SETUP AND RUN SQL FILES ON TERMINAL/COMMAND PROMPT
1. Open a terminal or command prompt.
2. Start the MySQL client:
   mysql -u root -p
3. Execute the scripts:
   source "path/to/create_db.sql";
   source "path/to/insert_db.sql";

NOTE: Scripts must be executed in order: create_db.sql followed by insert_db.sql.

EXPECTED OUTPUT:
The sql files will create a database, define the schema, and inserts data into the created database.

TROUBLESHOOTING:
- If the script fails to execute, check that you are connected to the server.
- Verify the path to all datasets is correct if the script cannot find the file.
- Ensure all data files are in the same directory as the script or update the script with the correct file path.


HOW TO SETUP AND RUN PY FILES ON TERMINAL/COMMAND PROMPT
1. Navigate to local file directory 
2. python proj.py [INSERT QUERY NUMBER AND ADDITIONAL PARAMETERS HERE] (remove brackets)

Queries to Enter:
1 'Vaccination'
2
3 100.00
4 "General Medicine"
5 "Allergy Relief"
6 "1981-08-27" "1981-08-27"
7 "1581-08-02" "1581-0
8 "General Medicine"

NOTE: Query 2 will generate an empty dataframe as all appointments where schedule with the patient's primary physician. 
      Query 7 will only generate one tuple (row) as only one patient stayed in a double room. 

EXPECTED OUTPUT: The py files will connect to the database and give query results stored in pandas dataframe. 

TROUBLESHOOTING:
- Ensure all data files are in the same directory as the script or update the script with the correct file path.
- Ensure that you are wrapping text in "" or ''

CONTACT: For any further assistance, please contact laudom5@nmsu.edu 





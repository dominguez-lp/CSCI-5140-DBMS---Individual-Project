# Laura Dominguez
# CSCI 5140 
# Project: Phase 2
# 03/22/2026
import pandas as pd
import sys

# results Function 
def get_results(query_num, *arg):
    # Connect to MySql
    import mysql.connector
    
    # Set up connection
    conn = mysql.connector.connect(
        host="localhost",      # or your server IP
        user="root",
        password="M@$t3r!",
        database="las_palmas_medical_center")
    
    # Create a cursor object
    cursor = conn.cursor()

    # Written SQL Queries
    query1 = (f"""SELECT ph.physicianID, ph.name, ph.position, ph.ssn 
              FROM physician ph, `procedure` p, undergoes u 
              WHERE ph.physicianID = u.physicianID AND u.procedureID = p.procID AND p.name = %s;""")
    query2 = (f"""SELECT pa.name as patient_name, ph.name as physician_name, n.name as nurse_name, a.startDateTime, a.endDateTime, prim.name as primary_physician_name
              FROM appointment a, physician ph, patient pa, nurse n, physician prim
              WHERE pa.patientID = a.patientID 
              AND a.physicianID = ph.physicianID
              AND a.nurseID = n.nurseID
              AND prim.physicianID = pa.primaryPhysID
              AND pa.primaryPhysID != a.physicianID
              """)
    query3 = (f"""SELECT pa.patientID, pa.ssn, pa.name, pa.address, pa.dob, pa.phone, pa.insuranceNumber, pa.primaryPhysID
              FROM patient pa, `procedure` p, undergoes u
              WHERE pa.patientID = u.patientID
              AND p.procID = u.procedureID 
              AND p.cost > %s""")
    query4 = (f"""SELECT pa.patientID, pa.ssn, pa.name, pa.address, pa.dob, pa.phone, pa.insuranceNumber, pa.primaryPhysID
              FROM patient pa, department d
              WHERE pa.primaryPhysID = d.headID
              AND d.name = %s""")
    query5 = (f"""SELECT pa.name as patient_name, ph.name as physician_name, pr.prescribedDate as prescribed_date
              FROM patient pa, physician ph, prescribes pr, medication m
              WHERE pa.patientID = pr.patientID
              AND ph.physicianID = pr.physicianID
              AND m.medID = pr.medicationID
              AND m.name = %s""")
    query6 = ("""SELECT n.nurseID, n.name, n.position, n.ssn, o.startDate as on_call_start_date, o.endDate as on_call_end_date
              FROM nurse n, oncall o
              WHERE n.nurseID = o.nurseID
              AND o.startDate <= %s
              AND o.endDate >= %s """)
    query7 = ("""SELECT r.roomID, pa.name as Patient, s.startDate as Stay_Start_Date, s.endDate as Stay_End_Date
              FROM patient pa, stay s, room r
              WHERE pa.patientID = s.patientID
              AND r.roomID = s.roomID
              AND r.roomType = "Double"
              AND s.startDate <= %s
              AND s.endDate >= %s""")
    query8 = ("""SELECT pa.patientID, pa.ssn as patient_ssn, pa.name as patient_name, pa.address as patient_address, pa.dob as patient_dob, pa.phone as patient_phone, 
              pa.insuranceNumber as patient_insuranceNumber, pa.primaryPhysID as patient_primaryPhysID, ph.physicianID, ph.name as physician_name, ph.position as physician_position,
              ph.ssn as physician_ssn, a.appID as appointmentID
              FROM patient pa, physician ph, appointment a, affiliatedwith af, department d
              WHERE pa.patientID = a.patientID
              AND ph.physicianID = a.physicianID
              AND ph.physicianID = af.physicianID
              AND af.departmentID = d.deptID
              AND d.name = %s""")
    
    # Dictionary to Store Queries 
    queries = {1:query1,
               2:query2,
               3:query3, 
               4:query4,
               5:query5,
               6:query6,
               7:query7,
               8:query8}

    # Execute query
    if arg:
        cursor.execute(queries[query_num],arg)
    else:
        cursor.execute(queries[query_num])

    # Fetch the rows generated from the query and put them into a pandas dataframe for a nicer output
    rows = cursor.fetchall()

    if rows: # check if not an empty result
        table = pd.DataFrame(rows, columns=[col[0] for col in cursor.description])
    else:
        table = pd.DataFrame(columns=[col[0] for col in cursor.description])
    
    cursor.close()
    conn.close()
    
    return table

def main_func():
    query_num = int(sys.argv[1])  # first argument = query number
    arg = sys.argv[2:]            # everything else = query arguments

    result = get_results(query_num, *arg)
    print(result)

if __name__ == "__main__":
    main_func()






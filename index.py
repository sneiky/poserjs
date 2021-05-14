#!D:\portpy\python.exe
#
import os
import pymysql
import pymysql.cursors
#
def main():
    sql = ""
    #
    csv = open("formulas.csv","r").read()
    sql += csv_to_sql(csv,"formulas")
    #
    csv = open("themes.csv","r").read()
    sql += csv_to_sql(csv,"themes")
    #
    open("insert.sql","w").write(sql)
    #
    exit()
    #
    create_db()
    fill_tables()
    #
    formulas_table=get_formulas_table()
    index(formulas_table)
#
def wrap_in_quotes(l):
    r = []
    #
    for i in l:
        r.append('"{}"'.format(i))
    #
    return(r)
#
def csv_to_sql(csv,table_name):
    sql = ""
    #
    inserts = csv.split("\n")
    inserts = delete_spaces(inserts)
    inserts = delete_empty(inserts)
    for i in inserts:
        values = i.split("\t")
        values = wrap_in_quotes(values)
        values = ",".join(values)
        #
        ins = "INSERT INTO {table_name} VALUES({values});\n"
        ins = ins.format(table_name=table_name,
                         values=values)
        #
        sql += ins
    #
    return(sql)
#
def create_db():
    connection = pymysql.connect(host='localhost',
        user='lala',
        password='lala',
        database='lala',
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor)
    #
    cursor = connection.cursor()
    #
    qs = open("create.sql","r").read()
    #
    l = qs.split(";\n")
    l = delete_spaces(l)
    l = delete_empty(l)
    for i in l:
        cursor.execute(i)
    #
    connection.commit()
    #
    cursor.close()
    connection.close()
#
def fill_tables():
    connection = pymysql.connect(host='localhost',
        user='lala',
        password='lala',
        database='lala',
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor)
    #
    cursor = connection.cursor()
    #
    qs = open("insert.sql","r").read()
    #
    l = qs.split(";\n")
    l = delete_spaces(l)
    l = delete_empty(l)
    for i in l:
        cursor.execute(i)
    #
    connection.commit()
    #
    cursor.close()
    connection.close()
#
def get_formulas_table():
    output = ""
    #
    connection = pymysql.connect(host='localhost',
        user='lala',
        password='lala',
        database='lala',
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor)
    #
    cursor = connection.cursor()
    #
    sql = "SELECT * FROM formulas;"
    cursor.execute(sql)
    result = cursor.fetchall()
    n = 0
    output += "<table>"
    while(n < len(result)):
        formula_id = result[n].get("formula_id")
        formula_name = result[n].get("formula_name")
        formula_tex = result[n].get("formula_tex")
        output += '''<tr>
<td>{formula_id}</td>
<td>{formula_name}</td>
<td>{formula_tex}</td>
</tr>
'''.format(formula_id=formula_id,
           formula_name=formula_name,
           formula_tex=formula_tex)
        n+=1
    #
    output += "</table>"
    #
    cursor.close()
    connection.close()
    #
    return(output)
#
def index(formulas_table):
    print("Content-type: text/html\n\n")
    #
    html = open("pattern.html","r").read()
    #
    html.format(formulas_table=formulas_table)
    #
    print(html)
#
def delete_empty(elements):
    return list(filter(lambda x: x!="",elements))
#
def delete_spaces(elements):
    a = list(elements)
    i = 0
    n = len(a)
    while(i<n):
        a[i]=a[i].strip()
        i+=1
    return(a)
#
if(__name__=="__main__"):
  main()

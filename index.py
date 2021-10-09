#!D:\ilqyul\portpy\python.exe
#
import cgi
import cgitb
import locale
import codecs
import sys
import os
import pymysql
import pymysql.cursors
import re
#
_pattern_html = "pattern.html"
#
_db_user = "lala_user"
_db_password = "lala_pass"
_db_name = "lala_db"
#
def main():
    #sql = ""
    #
    #csv = open("formulas.csv","r").read()
    #sql += csv_to_sql(csv,"formulas")
    #
    #csv = open("themes.csv","r").read()
    #sql += csv_to_sql(csv,"themes")
    #
    #open("insert.sql","w").write(sql)
    #
    #exit()
    #
    #create_db()
    #fill_tables()
    #
    cgitb.enable(display=1)
    #
    print("Content-type: text/html")
    print()
    #
    if(os.environ["REQUEST_METHOD"] == "GET"):
        kuseru = os.environ["QUERY_STRING"]
        hemado = re.match(".*hemado=([^&]*).*",kuseru)
        if(hemado != None):
            hemado = hemado.group(1)
        #
    #
    #print(os.environ)
    #print(hemado)
    #exit()
    #
    hemado = None
    form = cgi.FieldStorage()
    if("hemado" not in form):
        hemado = 0
    else:
        hemado = form["hemado"].value
    #
    #print(form.__dict__)
    #print(hemado)
    #exit()
    #
    tanaha=get_tanaha(int(hemado))
    menuha=get_menuha()
    index(tanaha,menuha)
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
        user=_db_user,
        password=_db_password,
        database=_db_name,
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
        user=_db_user,
        password=_db_password,
        database=_db_name,
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
def get_menuha():
    output = ""
    #
    connection = pymysql.connect(host='localhost',
        user=_db_user,
        password=_db_password,
        database=_db_name,
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor)
    #
    cursor = connection.cursor()
    #
    sql = "SELECT * FROM themes;"
    cursor.execute(sql)
    result = cursor.fetchall()
    n = 0
    #
    output += "<ul>"
    #
    output += '<a href="/">'
    output += '<li>'
    output += get_file_contents("svg/gl.svg")
    output += '</li>'
    output += '</a>'
    #
    while(n < len(result)):
        theme_id = result[n].get("theme_id")
        theme_name = result[n].get("theme_name")
        theme_icon = result[n].get("theme_icon")
        #
        #print(formula_tex)
        #exit()
        #
        output += f'<a href="/?hemado={theme_id}">'
        output += '<li>'
        output += get_file_contents(theme_icon)
        output += '</li>'
        output += '</a>'
        #
        n+=1
    #
    output += "</ul>"
    #
    cursor.close()
    connection.close()
    #
    return(output)
#
def get_tanaha(hemado=0):
    output = ""
    #
    connection = pymysql.connect(host='localhost',
        user=_db_user,
        password=_db_password,
        database=_db_name,
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor)
    #
    cursor = connection.cursor()
    #
    sql = "SELECT * FROM formulas;"
    cursor.execute(sql)
    result = cursor.fetchall()
    n = 0
    #
    harame = False
    if(hemado == 0):
        harame = True
    #
    while(n < len(result)):
        formula_id = result[n].get("formula_id")
        formula_name = result[n].get("formula_name")
        formula_tex = result[n].get("formula_tex")
        theme_id = result[n].get("theme_id")
        #
        #print(formula_tex)
        #exit()
        #
        if((theme_id == hemado) or harame):
            output += '<div class="t">'
            output += f'{formula_name}'
            output += '</div>'
            output += '<div class="h">'
            output += f'{formula_tex}'
            output += '</div>'
        #
        n+=1
    #
    output = output.encode("utf-8").decode('utf-8')
    #
    cursor.close()
    connection.close()
    #
    return(output)
#
def get_formulas_table():
    output = ""
    #
    connection = pymysql.connect(host='localhost',
        user=_db_user,
        password=_db_password,
        database=_db_name,
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
        theme_id = result[n].get("theme_id")
        output += '''<tr>
<td>{formula_id}</td>
<td>{formula_name}</td>
<td>{formula_tex}</td>
<td>{theme_id}</td>
</tr>
'''.format(
           formula_id=formula_id,
           formula_name=formula_name,
           formula_tex=formula_tex,
           theme_id=theme_id
          )
        n+=1
    #
    output += "</table>"
    #
    cursor.close()
    connection.close()
    #
    return(output)
#
def get_file_contents(fn):
    #
    fl = open(fn,"r",encoding="utf-8")
    st = fl.read()
    fl.close()
    #
    return(st)
#
def index(tanaha,menuha):
    #
    html = open(_pattern_html,"r",encoding="utf-8").read()
    #
    html = html.replace(
                        "<!--tanaha-->",
                        tanaha
                       )
    #
    html = html.replace(
                        "<!--menuha-->",
                        menuha
                       )
    #
    #print(sys.getdefaultencoding())
    #print(sys.getfilesystemencoding())
    #
    #sys.stdout = codecs.getwriter(locale.getpreferredencoding())(sys.stdout)
    html = html.encode("utf-8").decode("cp1251")
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

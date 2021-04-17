#!D:\portpy\python.exe
#
import os
import pymysql
import pymysql.cursors
import sqlp
#
def main():
    index()
#
def index():
    print("Content-type: text/html\n\n")
    #
    s = '''
    <head>
        <style>
            table {
                border-collapse: collapse;
            }
            td {
                border: 1px solid black;
                padding: 5px;
            }
        </style>
    </head>
    <body>
    '''
    print(s)
    #
    qs = r'''
    CREATE TABLE `ma` (
    `magi` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
    `man1` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`magi`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
    INSERT INTO ma VALUES("bhfkeb","3");
    INSERT INTO ma VALUES("eelfdt","2");
    INSERT INTO ma VALUES("pvywoy","4");
    INSERT INTO ma VALUES("vdxueu","5");
    '''
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
    l = qs.split(";\n")
    l = delete_spaces(l)
    l = delete_empty(l)
    for i in l:
        cursor.execute(i)
    #
    connection.commit()
    #
    sql = "SELECT * FROM ma;"
    cursor.execute(sql)
    result = cursor.fetchall()
    print(result)
    n = 0
    s = ""
    s += "<table>"
    while(n < len(result)):
        magi = result[n].get("magi")
        man1 = result[n].get("man1")
        s += "<tr>"
        s += "<td>"
        s += magi
        s += "</td>"
        s += "<td>"
        s += man1
        s += "</td>"
        s += "</tr>"
        n+=1
    #
    s += "</table>"
    print(s)
    #
    cursor.close()
    connection.close()
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

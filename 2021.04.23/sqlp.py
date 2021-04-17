#!D:\portpy\python.exe
#
def run_sql_str(cur,sqls):
    ql = sqls.split(";\n")
    for i in ql:
        cur.execute(i)
        print(i)
#

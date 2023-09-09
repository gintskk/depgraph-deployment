#!/bin/sh

BASE="/tmp/psql"

# create db
psql -v ON_ERROR_STOP=1 --username "postgres" -f ${BASE}/create_dbs.sql

# create tables
psql -v ON_ERROR_STOP=1 --dbname "fasten_java" --username "fasten" -f ${BASE}/create_tables_java.sql
psql -v ON_ERROR_STOP=1 --dbname "fasten_c" --username "fasten" -f ${BASE}/create_tables_c.sql
psql -v ON_ERROR_STOP=1 --dbname "fasten_python" --username "fasten" -f ${BASE}/create_tables_python.sql

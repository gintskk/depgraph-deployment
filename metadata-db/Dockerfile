FROM postgres:15.4
COPY schema/*.sql /tmp/psql/
COPY init_metadata_db.sh /docker-entrypoint-initdb.d/
RUN chmod 755 /docker-entrypoint-initdb.d/*.sh

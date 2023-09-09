CREATE DATABASE fasten_java ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0;
CREATE DATABASE fasten_c ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0;
CREATE DATABASE fasten_python ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0;

 -- User fasten has all privileges

CREATE USER fasten with encrypted password 'fasten1234';
ALTER USER fasten with CREATEDB;

GRANT ALL PRIVILEGES ON database fasten_java to fasten;
ALTER DATABASE fasten_java OWNER to fasten;
GRANT ALL PRIVILEGES ON database fasten_c to fasten;
ALTER DATABASE fasten_c OWNER to fasten;
GRANT ALL PRIVILEGES ON database fasten_python to fasten;
ALTER DATABASE fasten_python OWNER to fasten;

 -- User fastenro has read-only access

CREATE USER fastenro WITH ENCRYPTED PASSWORD 'fasten1234';

GRANT CONNECT ON DATABASE fasten_java TO fastenro;
GRANT CONNECT ON DATABASE fasten_c TO fastenro;
GRANT CONNECT ON DATABASE fasten_python TO fastenro;

\c fasten_java
GRANT USAGE ON SCHEMA public TO fastenro;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO fastenro;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO fastenro;

\c fasten_c
GRANT USAGE ON SCHEMA public TO fastenro;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO fastenro;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO fastenro;

\c fasten_python
GRANT USAGE ON SCHEMA public TO fastenro;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO fastenro;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO fastenro;

\c fasten_java postgres
CREATE EXTENSION pgcrypto;
CREATE EXTENSION pg_stat_statements;

\c fasten_c postgres
CREATE EXTENSION pgcrypto;
CREATE EXTENSION pg_stat_statements;

\c fasten_python postgres
CREATE EXTENSION pgcrypto;
CREATE EXTENSION pg_stat_statements;

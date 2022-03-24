FROM postgres:13.3

COPY app/rust-db-dump.sql /docker-entrypoint-initdb.d/
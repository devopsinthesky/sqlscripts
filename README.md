# sqlscripts
This SQL script for Postgres will grant a user a full read-only access on all tables in all schemas and will also grant access to the tables created in future.

This is how you run it:

cd /home/postgres
psql -d databasename -a -f multigrant.sql


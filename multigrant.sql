DO $do$
DECLARE
    sch text;
BEGIN
    FOR sch IN SELECT nspname FROM pg_namespace where nspname != 'pg_temp_1' and nspname != 'pg_toast_temp_1'
    LOOP
        EXECUTE format($$ GRANT USAGE ON SCHEMA %I TO "df-read-only" $$, sch);
        EXECUTE format($$ GRANT SELECT ON ALL TABLES IN SCHEMA %I TO "df-read-only" $$, sch);
        EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT SELECT ON TABLES TO "df-read-only" $$, sch);
    END LOOP;
END;
$do$;

psql -d net_activity_data -a -f mg.sql


DO $do$
DECLARE
    sch text;
BEGIN
    FOR sch IN SELECT nspname FROM pg_namespace where nspname != 'pg_temp_1' and nspname != 'pg_toast_temp_1'
    LOOP
        EXECUTE format($$ GRANT USAGE ON SCHEMA %I TO "oleksii_m" $$, sch);
        EXECUTE format($$ GRANT SELECT ON ALL TABLES IN SCHEMA %I TO "oleksii_m" $$, sch);
        EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT SELECT ON TABLES TO "oleksii_m" $$, sch);
    END LOOP;
END;
$do$;

psql -d net_activity_data -a -f mg.sql

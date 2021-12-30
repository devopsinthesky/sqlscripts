DO $do$
DECLARE
    sch text;
BEGIN
    FOR sch IN SELECT nspname FROM pg_namespace where nspname != 'pg_temp_1' and nspname != 'pg_toast_temp_1'
    LOOP
        EXECUTE format($$ GRANT USAGE ON SCHEMA %I TO "user" $$, sch);
        EXECUTE format($$ GRANT SELECT ON ALL TABLES IN SCHEMA %I TO "user" $$, sch);
        EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT SELECT ON TABLES TO "user" $$, sch);
    END LOOP;
END;
$do$;

-- PRIMERA PART

psql -U adminworld -W -d world -h localhost

-- create database world;

create role adminworld superuser createdb createrole inherit login replication;

alter user adminworld with password 'per83ad';

create database world with owner adminworld;
grant database_owner to adminworld;
alter database world owner to adminworld;
\du -- visualitza els usuaris

grant all privileges on database world to adminworld;

select current_user;
select current_schema;

create schema countries;

select usename, application_name, client_addr, datname 
from pg_stat_activity;

select schema_name
from information_schema.schemata;

grant create on schema countries to adminworld;

grant all privileges on all tables in schema countries to adminworld;

psql -U adminworld -W -d world -h localhost < "C:\Users\ianbu\Desktop\countries.sql"

psql -U adminworld -W -d world -h localhost

select current_user;
select current_schema;

set search_path to countries;

\dt

alter table public.city set schema countries;
alter table public.country set schema countries;
alter table public.countrylanguage set schema countries;

select current_schema();

set search_path = countries;
\dt

set search_path = public;

select * from country;

set search_path = countries;

update country
set lifeexpectancy = 45.3
where continent =’Africa’;

pg_dump world > world.sql -h localhost -U adminworld

psql -U postgres -W -d world -h localhost

create database world2 with owner adminworld;
alter database world2 owner to adminworld;

psql world2 < world.sql -h localhost -U adminworld

psql -h localhost -d world2 -U adminworld -W

set search_path = countries;
\dt

create database world3 with owner adminworld;
create schema world3;
grant all privileges on database world3 to adminworld;
grant all privileges on all tables in schema world3 to adminworld;

pg_dump world2 > world2.sql -h localhost -U adminworld

psql world3 < world2.sql -h localhost -U adminworld

psql -h localhost -d world3 -U adminworld -W

select * from city;

-- SEGONA PART

psql -h localhost -d world2 -U adminworld -W
set search_path = countries;

copy (select * from country) to "C:\Users\ianbu\Desktop\country.csv" with csv delimiter ',';

copy (select * from country) to "C:\Users\ianbu\Desktop\city.csv" with csv delimiter ',';

copy (select * from country) to "C:\Users\ianbu\Desktop\countrylanguage.csv" with csv delimiter ',';

copy (select to_json(array_agg(country)) from country) to "C:\Users\ianbu\Desktop\country.json";

copy (select to_json(array_agg(city)) from city) to "C:\Users\ianbu\Desktop\city.json";

copy (select to_json(array_agg(countrylanguage)) from countrylanguage) to "C:\Users\ianbu\Desktop\countrylanguage.json";

copy (select row_to_json(t) from (select * from country where continent = 'Europe') t) to "C:\Users\ianbu\Desktop\europe.json";

jq -c '.[]' country.json > country.json
jq -c '.[]' city.json > city.json
jq -c '.[]' countrylanguage.json > countrylanguage.json
jq -c '.[]' europe.json > europe.json

psql -h localhost -d world2 -U adminworld -W

CREATE TABLE city (
    id integer NOT NULL,
    name text NOT NULL,
    countrycode character(3) NOT NULL,
    district text NOT NULL,
    population integer NOT NULL
);

CREATE TABLE country (
    code character(3) NOT NULL,
    name text NOT NULL,
    continent text NOT NULL,
    region text NOT NULL,
    surfacearea real NOT NULL,
    indepyear smallint,
    population integer NOT NULL,
    lifeexpectancy real,
    gnp numeric(10,2),
    gnpold numeric(10,2),
    localname text NOT NULL,
    governmentform text NOT NULL,
    headofstate text,
    capital integer,
    code2 character(2) NOT NULL,
    CONSTRAINT country_continent_check CHECK ((((((((continent = 'Asia'::text) OR (continent = 'Europe'::text)) OR (continent = 'North America'::text)) OR (continent = 'Africa'::text)) OR (continent = 'Oceania'::text)) OR (continent = 'Antarctica'::text)) OR (continent = 'South America'::text)))
);

CREATE TABLE countrylanguage (
    countrycode character(3) NOT NULL,
    "language" text NOT NULL,
    isofficial boolean NOT NULL,
    percentage real NOT NULL
);

create table temp (data jsonb);
\copy temp (data) from 'country.json';

insert into country
select *
from temp;

drop table temp;

create table temp (data jsonb);
\copy temp (data) from 'city.json';

insert into cjity
select *
from temp;

drop table temp;

create table temp (data jsonb);
\copy temp (data) from 'countrylanguage.json';

insert into countrylanguage
select *
from temp;

drop table temp;


-- backup_script.bat

@echo off
set BACKUP_PATH=C:\backup
set PG_BIN="C:\Program Files\PostgreSQL\15\bin"
set PG_USER=postgres
set PG_DATABASE=world
set TIMESTAMP=%date:~10,4%-%date:~4,2%-%date:~7,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%

%PG_BIN%\pg_dump.exe -U %PG_USER% -Fc -f %BACKUP_PATH%\%PG_DATABASE%_%TIMESTAMP%.backup %PG_DATABASE%
-- end of script

-- Task Scheduler > create basic task
-- Configuramos la tarea con el tiempo que queramos y dejamos el resto por defecto



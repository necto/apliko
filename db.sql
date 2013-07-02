
-- add password autentification to joe in pg_hba.conf :
-- sudo emacs /etc/postgresql/9.1/main/pg_hba.conf
-- sudo service postgresql restart

create user joe with password 'lapass';
create database bids;
grant all privileges on database bids to joe;

create table claims (
       id integer primary key,
       name text
);
\q

-- add password autentification to joe, bids_admin, tomcat_auth in pg_hba.conf :
-- sudo emacs /etc/postgresql/9.1/main/pg_hba.conf
-- sudo service postgresql restart

drop database bids_auth;
drop database bids;

drop user joe;
drop user bids_admin;
drop user tomcat_auth;

---------------------------
-- Requests database
---------------------------

create user joe with password 'lapass';
create database bids;
grant all privileges on database bids to joe;

\c bids
set role joe;

create table claims (
       id                   serial primary key,
       user_name            text,
       name                 text,
       buildings_list       text,
       room                 text,
       device_type          text,
       device_number        text,
       problem_description  text,
       priority             text,
       comment              text,
       telephone            text,
       date                 date,
       status               text
);

---------------------------
-- Authentication base
---------------------------

set role postgres;

create user tomcat_auth with password 'tomcat_188';
create user bids_admin with password '11111';
create database bids_auth;
grant all privileges on database bids_auth to bids_admin;

\c bids_auth;
set role bids_admin;

create table users (
  user_name         text not null primary key,
  user_pass         text not null,
  name              text,
  surname           text,
  middle_name       text,
  building          text,
  unit              text,
  telephone         text
);

create table user_roles (
  user_name         text not null,
  role_name         text not null,
  primary key (user_name, role_name)
);

insert into users values ('tom', 'aga');
insert into users values ('jerry', 'jer');
insert into users values ('customer1', 'customer');
insert into users values ('manager1', 'manager');

insert into user_roles values ('tom', 'manager-script');
insert into user_roles values ('jerry', 'manager-gui');
insert into user_roles values ('customer1', 'customer');
insert into user_roles values ('manager1', 'manager');

grant select on users to tomcat_auth;
grant select on user_roles to tomcat_auth;

\q

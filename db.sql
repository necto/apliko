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

create table towns (
       id                   serial primary key,
       name                 text UNIQUE
);

create table buildings (
       id                   serial primary key,
       town                 integer references towns,
       name                 text
);

create table units (
       id                   serial primary key,
       name                 text UNIQUE
);

create table priorities (
       id                   serial primary key,
       name                 text
);

create table statuses (
       id                   serial primary key,
       name                 text
);

create table claims (
       id                   serial primary key,
       creator_login        text,
       name                 text,
       middle_name          text,
       surname              text,
       telephone            text,
       building             integer references buildings,
       unit                 integer references units,
       room                 text,
       device_type          text,
       device_number        text,
       problem_description  text,
       priority             integer references priorities,
       comment              text,
       service_number       text,
       date                 date,
       status               integer references statuses
);

insert into priorities values (DEFAULT, 'Высокий');
insert into priorities values (DEFAULT, 'Средний');
insert into priorities values (DEFAULT, 'Низкий');

insert into statuses values (DEFAULT, 'Не обработана');
insert into statuses values (DEFAULT, 'В обработке');
insert into statuses values (DEFAULT, 'Выполнена');
insert into statuses values (DEFAULT, 'Отложена');
insert into statuses values (DEFAULT, 'Не возможно выполнить');
insert into statuses values (DEFAULT, 'Отклонена');
insert into statuses values (DEFAULT, 'Требуются уточнения');


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

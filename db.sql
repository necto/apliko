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
       name                 text,
       color                text
);

create table statuses (
       id                   serial primary key,
       name                 text,
       color                text
);

create table claim_type (
       id                   serial primary key,
       name                 text
);

create table expendable(
       device_type          text,
       model                text
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
       type                 integer references claim_type,
       problem_description  text,
       priority             integer references priorities,
       comment              text,
       service_number       text,
       date                 date,
       status               integer references statuses
);

create table userinfo (
  user_name         text not null primary key,
  name              text,
  surname           text,
  middle_name       text,
  building          integer references buildings,
  unit              integer references units,
  telephone         text
);

insert into priorities values (DEFAULT, 'Высокий', 'red');
insert into priorities values (DEFAULT, 'Средний', 'black');
insert into priorities values (DEFAULT, 'Низкий',  'blue');

insert into statuses values (DEFAULT, 'Не обработана', 'black');
insert into statuses values (DEFAULT, 'В обработке', 'black');
insert into statuses values (DEFAULT, 'Выполнена', 'green');
insert into statuses values (DEFAULT, 'Отложена', 'blue');
insert into statuses values (DEFAULT, 'Не возможно выполнить', 'red');
insert into statuses values (DEFAULT, 'Отклонена', 'red');
insert into statuses values (DEFAULT, 'Требуются уточнения', 'black');


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
  user_pass         text not null
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

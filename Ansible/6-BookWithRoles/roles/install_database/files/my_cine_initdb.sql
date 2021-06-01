--
-- TODO1: manage user with ip/hostname of client(s)
-- TODO2: make template from this file to inject dbname,user,password

-- create database
create database if not exists dbmovie CHARACTER SET utf8;

-- create user with all privileges to database
create user 'movie'@'*' identified by 'password';
grant all privileges on dbmovie.* to 'movie'@'*';
flush privileges;

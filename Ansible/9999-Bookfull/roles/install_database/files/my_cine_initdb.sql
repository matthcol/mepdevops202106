-- create database
create database dbmovie CHARACTER SET utf8;

-- create user with all privileges to database
create user 'movie'@'*' identified by 'password';
grant all privileges on dbmovie.* to 'movie'@'*';
flush privileges;

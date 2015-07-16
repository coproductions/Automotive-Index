CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars OWNER indexed_cars_user;

\i ~/DevLeague/Automotive-Index/scripts/car_models.sql;

\i ~/DevLeague/Automotive-Index/scripts/car_model_data.sql;

select count (*) from car_models;
--20ms

select make_title from car_models where make_code = 'LAM';
--6ms

select distinct make_title count from car_models where make_code = 'LAM';
--27ms

select count(ms.model_title) from (select distinct model_title from car_models where make_code = 'NISSAN') as ms;
--28ms

select * from car_models where year BETWEEN 2010 and 2015;
--88ms

select * from car_models where year = 2010;
--39ms


create index make_code_index on car_models (make_code);

create index year_index on car_models (year);

  select make_title from car_models where make_code = 'LAM';
  --1.3ms

  select distinct make_title count from car_models where make_code = 'LAM';
--1.2ms

select count(ms.model_title) from (select distinct model_title from car_models where make_code = 'NISSAN') as ms;
--3.4ms

select * from car_models where year BETWEEN 2010 and 2015;
--68ms

select * from car_models where year = 2010;
--16ms

DROP TABLE car_models;

\i ~/DevLeague/Automotive-Index/scripts/car_models.sql;
\i ~/DevLeague/Automotive-Index/scripts/car_model_data.sql;







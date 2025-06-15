CREATE DATABASE home_work;

CREATE TABLE students(
    id SERIAL,
    first_name VARCHAR(64) CHECK(first_name != '') NOT NULL,
    last_name VARCHAR(64) CHECK(last_name != '') NOT NULL,
    birthday DATE CHECK(birthday <= current_date) NOT NULL,
    phone_number CHAR(13) NOT NULL,
    group VARCHAR(20) CHECK (group ~ '^[A-Za-z]{1,6}-\d{1,6}$'),
    avg_mark NUMERIC(3,2) CHECK(avg_mark >= 0) NOT NULL,
    gender VARCHAR(30) CHECK(gender != '') NOT NULL,
    entered_at SMALLINT CHECK(entered_at <= extract(YEAR FROM CURRENT_DATE)) NOT NULL,
    department VARCHAR(64) CHECK(department != '') NOT NULL
);
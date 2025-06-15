CREATE DATABASE home_work;

DROP TABLE IF EXISTS students;

CREATE TABLE IF NOT EXISTS students(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(64) CONSTRAINT first_name_not_empty CHECK(first_name != '')  NOT NULL,
    last_name VARCHAR(64) CONSTRAINT last_name_not_empty CHECK(last_name != '')  NOT NULL,
    birthday DATE CONSTRAINT birthday_later_current_date CHECK(birthday <= current_date)  NOT NULL,
    phone_number CHAR(13)  UNIQUE NOT NULL,
    student_group VARCHAR(20) CONSTRAINT student_group_example_ITd_2020 CHECK (student_group ~ '^[A-Za-z]{1,6}-\d{1,6}$') ,
    avg_mark NUMERIC(3, 2) CONSTRAINT avg_mark_not_less_0 CHECK(avg_mark >= 0)  NOT NULL,
    gender VARCHAR(30) CONSTRAINT gender_not_empty CHECK(gender != '')  NOT NULL,
    entered_at SMALLINT CONSTRAINT entered_at_later_current_date CHECK(entered_at <= extract(YEAR FROM CURRENT_DATE))  NOT NULL,
    department VARCHAR(64) CONSTRAINT department_not_empty CHECK(department != '')  NOT NULL
);

INSERT INTO students(
        first_name,
        last_name,
        birthday,
        phone_number,
        student_group,
        avg_mark,
        gender,
        entered_at,
        department
    )
VALUES(
        'Tom',
        'Grey',
        '2004.01.11',
        '+380959934560',
        'ITd-2020',
         6.43,
        'male',
        2020,
        'Faculty of Information Technology'
    ),(
        'Riana',
        'Oliver',
        '2005.02.14',
        '+38098934560',
        'ITd-2021',
         8.09,
        'female',
        2021,
        'Faculty of Information Technology'
    ),(
        'Jerry',
        'Huston',
        '2006.04.16',
        '+380669934560',
        'ITd-2022',
         4.99,
        'female',
        2022,
        'Faculty of Information Technology'
    );
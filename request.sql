--Отримати інформацію про студентів (ім'я+прізвище, дата народження)
-- у порядку від найстаршого до наймолодшого.
SELECT first_name, last_name, birthday
FROM students
ORDER BY birthday;


--Отримати список шифрів груп, що не повторюються.
INSERT INTO students(first_name,last_name,birthday, phone_number,student_group,avg_mark,gender,entered_at,department)
VALUES('Mark','Markvenko','2004.11.19','+380675554431','ITd-2024', 7.8,'male', 2024,'Faculty of Information Technology');

SELECT student_group
FROM students
GROUP BY student_group
HAVING COUNT(id) = 1;


--Отримати рейтинговий список студентів 
--(ім'я (*або ініціал)+прізвище, середній бал): 
--спочатку студентів із найвищим середнім балом, наприкінці з найменшим.
SELECT (LEFT (first_name, 1)|| '. ' || last_name) AS Fullname, avg_mark
FROM students
ORDER BY avg_mark DESC;


--Отримати другу сторінку списку студентів
-- під час перегляду по 6 студентів на сторінці.
INSERT INTO students(first_name,last_name,birthday, phone_number,student_group,avg_mark,gender,entered_at,department)
VALUES('Anton','Kucenko','2003.07.29','+380688887654','CEd-2023', 6.8,'male', 2023,'Faculty of Computer Engineering'),
      ('Elina','Jekson','2003.04.25','+380974443526','CEd-2023', 5.6,'female', 2023,'Faculty of Computer Engineering'),
      ('Nick','Nickonenko','2002.03.17','+380986543822','CEd-2022', 7.8,'other', 2022,'Faculty of Computer Engineering'),
      ('Lora','Palor','2004.09.13','+380680987765','AMd-2024', 6.1,'female', 2024,'Faculty of Applied Mathematics and Informatics'),
      ('Dolli','Cucher','2002.12.15','+380952341789','AMd-2022', 4.6,'female', 2022,'Faculty of Applied Mathematics and Informatics'),
      ('Oscar','Gold','2001.04.16','+380689876645','AMd-2021', 3.1,'male', 2021,'Faculty of Applied Mathematics and Informatics');

 SELECT *
 FROM students
 LIMIT 6 OFFSET 6;     


 --Отримати список 3-х найуспішніших студентів 
 --(ім'я, прізвище, середній бал, група).
 SELECT first_name, last_name, avg_mark, student_group
 FROM students
 ORDER BY avg_mark DESC
 LIMIT 3;


--* Отримати максимальний середній бал серед усіх студентів.
SELECT MAX(avg_mark) 
FROM students;


--* Отримати інфо про студентів (ініціал+прізвище, номер телефону),
-- де номер телефону буде частково прихований та представлений у форматі:
-- +38012******* (тобто видно код оператора, але не сам номер). 
SELECT 
  (LEFT (first_name, 1)|| '. ' || last_name) AS Fullname,
  (LEFT(phone_number,6)|| '*******') AS Phone_students
FROM students;


--Відобразити студентів на ім'я Anton та прізвище Antonov.
UPDATE students
SET first_name = 'Anton', last_name = 'Antonov'
WHERE id = 1;

SELECT *
FROM students
WHERE first_name = 'Anton' AND last_name ='Antonov';



--Відобразити студентів, які народилися в період із 2005 по 2008 рік.
UPDATE students
SET birthday = '2008-08-08'
WHERE id = 12;

SELECT *
FROM students
WHERE birthday BETWEEN '2005-01-01' AND '2008-12-31';


--Відобразити студентів на ім'я Mykola із середніми балами більше 4.5.
INSERT INTO students(first_name,last_name,birthday, phone_number,student_group,avg_mark,gender,entered_at,department)
VALUES('Mykola','Mykolovich','2003.10.10','+380685554431','ITd-2024', 7.8,'male', 2024,'Faculty of Information Technology');

SELECT first_name,avg_mark
FROM students
WHERE first_name LIKE 'Mykola' AND avg_mark >= 4.5;


--Відобразити кількість студентів, які навчаються у кожній групі.
SELECT student_group, COUNT(id)
FROM students
GROUP BY student_group
ORDER BY student_group;


--Відобразити загальну кількість студентів, які вступили 2018 року.
INSERT INTO students(first_name,last_name,birthday, phone_number,student_group,avg_mark,gender,entered_at,department)
VALUES('Roland','Businovich','2000.11.11','+380680009988','ITd-2018', 7.8,'male', 2018,'Faculty of Information Technology');

SELECT COUNT(id)
FROM students
WHERE entered_at = 2018;


--*Відобразити студентів, які користуються послугами оператора Київстар.
-- (тобто код 098 або 096 або ...)
SELECT *
FROM students
WHERE phone_number LIKE '+38098%' OR
      phone_number LIKE '+38096%';


--*Відобразити середній (середній) бал студентів жіночої статі кожного факультету. Список впорядкувати за зменшенням середнього балу.
-- Стовпчик із середнім балом назвати avg_avg_mark.
SELECT AVG(avg_mark) AS avg_avg_mark, department
FROM students
WHERE gender = 'female'
GROUP BY department
ORDER BY avg_avg_mark;


--*Відобразити мінімальний середній бал студентів факультету інформаційних технологій,
-- що народилися влітку, залежно від року вступу. 
--Виводити інформацію лише про ті роки вступу, 
--де мінімальний середній бал вищий за 3,5.
INSERT INTO students(first_name,last_name,birthday, phone_number,student_group,avg_mark,gender,entered_at,department)
VALUES('Caty','Luis','2000.07.11','+380683009988','ITd-2018', 7.8,'female', 2018,'Faculty of Information Technology');

SELECT entered_at, MIN(avg_mark) AS min_avg_mark
FROM students
WHERE department = 'Faculty of Information Technology'AND 
      EXTRACT(MONTH FROM birthday) IN (6, 7, 8)
GROUP BY entered_at
HAVING MIN(avg_mark) > 3.5
ORDER BY entered_at;



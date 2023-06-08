/*1. Отсортируйте данные 
по полю заработная плата (salary) в порядке: убывания; возрастания*/
#убывание
SELECT * FROM staff
ORDER BY salary DESC;

#возрастание
SELECT * FROM staff
ORDER BY salary;

#2. Выведите 5 максимальных заработных плат (saraly)
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

#3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, SUM(salary) AS sum_salary FROM staff
GROUP BY post;

/*4. Найдите кол-во сотрудников 
с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.*/
SELECT count(post) AS quantity FROM staff
WHERE post = "Рабочий" AND  age BETWEEN 24 AND 49;

#5.Найдите количество специальностей
SELECT count(DISTINCT post) AS post_quantity FROM staff;

#6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, AVG(age) AS av_age FROM staff
GROUP BY post
HAVING AVG(age) <30;

/*специальностей со средним возрастом меньше 30 нет, 
так как средний возраст по каждой специальности больше или равно 30:*/
SELECT post, AVG(age) AS av_age FROM staff
GROUP BY post





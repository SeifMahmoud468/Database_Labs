-- Question 1
SELECT
    student_name
FROM
    student as s
WHERE
    s.LEVEL = "SR"
    and s.student_id in (
        SELECT
            student_id
        FROM
            semester_course as sc
            JOIN enrolled as e on sc.course_code = e.course_code
            AND sc.QUARTER = e.QUARTER
            AND sc.year = e.year
        WHERE
            sc.prof_id = "1"
    );

-- Question 2
SELECT
    s.age
FROM
    student AS s
WHERE
    s.age =(
        SELECT
            MAX(age)
        FROM
            student
        WHERE
            student.major = "History"
            OR student.student_id IN(
                SELECT
                    student_id
                FROM
                    enrolled AS e
                    JOIN semester_course AS sc ON sc.course_code = e.course_code
                    AND sc.QUARTER = e.QUARTER
                    AND sc.year = e.year
                    JOIN professor AS p ON p.prof_id = sc.prof_id
                WHERE
                    p.prof_name = "Michael Miller"
            )
    );

-- Question 3
SELECT
    s.student_name,
    c.NAME
FROM
    student AS s
    LEFT JOIN enrolled AS e ON s.student_id = e.student_id
    LEFT JOIN course AS c ON c.course_code = e.course_code;

-- Question 4
SELECT
    p.prof_name
FROM
    semester_course AS sc
    JOIN enrolled AS e ON sc.course_code = e.course_code
    AND sc.QUARTER = e.QUARTER
    AND sc.year = e.year
    JOIN professor as p ON p.prof_id = sc.prof_id
GROUP by
    sc.prof_id
HAVING
    COUNT(*) < 5;

-- Question 5
SELECT
    s.student_name
FROM
    student AS s
    JOIN enrolled AS e ON s.student_id = e.student_id
    JOIN semester_course AS sc ON sc.course_code = e.course_code
    AND sc.QUARTER = e.QUARTER
    AND sc.year = e.year
    JOIN professor AS p ON p.prof_id = sc.prof_id
WHERE
    p.prof_id = "2"
GROUP BY
    s.student_id
HAVING
    COUNT(*) =(
        SELECT
            COUNT(*)
        FROM
            course AS c,
            professor AS p,
            semester_course AS sc
        WHERE
            sc.course_code = c.course_code
            AND sc.prof_id = p.prof_id
            AND p.prof_id = "2"
    );

-- Question 6
SELECT
    "Never Taught" as Type,
    c.NAME,
    c.course_code
FROM
    course as c
WHERE
    c.course_code not in (
        SELECT
            enrolled.course_code
        FROM
            enrolled
    )
UNION
ALL
SELECT
    "Taught by CS" as Type,
    c.NAME,
    c.course_code
FROM
    course as c
WHERE
    c.course_code in (
        SELECT
            e.course_code
        FROM
            enrolled as e
            JOIN semester_course AS sc ON sc.course_code = e.course_code
            AND sc.QUARTER = e.QUARTER
            AND sc.year = e.year
            JOIN professor AS p ON p.prof_id = sc.prof_id
            JOIN department as d on d.dept_id = p.prof_id
        WHERE
            d.dept_name = "Computer Science"
    );

-- Question 7
SELECT
    "Student" AS Type,
    s.student_name
FROM
    student as s
WHERE
    s.student_name LIKE 'M%'
    AND s.age < 20
UNION
SELECT
    "Teacher",
    p.prof_name
FROM
    professor as p
WHERE
    p.prof_name LIKE 'M%'
    AND p.prof_id IN (
        SELECT
            sc.prof_id
        FROM
            semester_course as sc
        GROUP BY
            sc.prof_id
        HAVING
            COUNT(*) > 2
    );

-- Question 8
SELECT
    p.prof_name,
    p.prof_id
FROM
    professor AS p
    LEFT JOIN semester_course AS sc ON sc.prof_id = p.prof_id
WHERE
    p.dept_id IN(1, 2, 3, 4)
GROUP BY
    p.prof_id
HAVING
    COUNT(*) < 2;

-- Question 9
SELECT
    s.student_name,
    p.prof_name
FROM
    enrolled as e
    RIGHT JOIN semester_course AS sc ON sc.course_code = e.course_code
    AND sc.QUARTER = e.QUARTER
    AND sc.year = e.year
    RIGHT JOIN professor as p ON p.prof_id = sc.prof_id
    LEFT JOIN student as s ON s.student_id = e.student_id
UNION
SELECT
    s.student_name,
    p.prof_name
FROM
    enrolled as e
    RIGHT JOIN semester_course AS sc ON sc.course_code = e.course_code
    AND sc.QUARTER = e.QUARTER
    AND sc.year = e.year
    RIGHT JOIN professor as p ON p.prof_id = sc.prof_id
    RIGHT JOIN student as s ON s.student_id = e.student_id
WHERE
    s.student_id not in (
        SELECT
            s.student_id
        FROM
            enrolled as e
            RIGHT JOIN semester_course AS sc ON sc.course_code = e.course_code
            AND sc.QUARTER = e.QUARTER
            AND sc.year = e.year
            RIGHT JOIN professor as p ON p.prof_id = sc.prof_id
            JOIN student as s ON s.student_id = e.student_id
    );

--  Question 10
SELECT
    c.NAME,
    c.course_code,
    p.prof_name,
    p.prof_id
FROM
    semester_course as sc
    JOIN professor as p ON p.prof_id = sc.prof_id
    JOIN course as c ON c.course_code = sc.course_code
GROUP BY
    p.prof_id,
    sc.course_code
HAVING
    COUNT(*) >= 2;

-- Question 11
SELECT
    d.*
FROM
    department AS d
    LEFT JOIN professor AS p ON p.dept_id = d.dept_id
    LEFT JOIN semester_course AS sc ON sc.prof_id = p.prof_id
GROUP BY
    d.dept_id
HAVING
    COUNT(*) < 3;
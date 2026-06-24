USE StudentDB;

CREATE TABLE courses (
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE enrollments (
student_id INT,
course_id INT,
grade INT,
FOREIGN KEY (student_id) REFERENCES Students(StudentID),
FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO courses VALUES
(1,'Database'),
(2,'Python'),
(3,'Java');

INSERT INTO enrollments VALUES
(1,1,85),
(1,2,90),
(2,1,95),
(2,3,80),
(3,2,75),
(4,1,88),
(5,3,92),
(6,2,81);

-- Query 1
SELECT s.Name, c.name
FROM enrollments e
JOIN Students s ON e.student_id=s.StudentID
JOIN courses c ON e.course_id=c.id;

-- Query 2
SELECT c.name,
AVG(e.grade) AS avg_grade
FROM enrollments e
JOIN courses c ON e.course_id=c.id
GROUP BY c.name;

-- Query 3
SELECT s.Name,
AVG(e.grade) AS avg_grade
FROM enrollments e
JOIN Students s ON e.student_id=s.StudentID
GROUP BY s.Name
ORDER BY avg_grade DESC
LIMIT 3;

-- Query 4
SELECT COUNT(*)
AS Failed_Students
FROM enrollments
WHERE grade<40;
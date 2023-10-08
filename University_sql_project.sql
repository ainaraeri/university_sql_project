USE university_project_schema;

-- Average grade given by each professor:
SELECT ProfessorID, AVG(Grade) AS AverageGrade
FROM Grades
GROUP BY ProfessorID;

-- Top grades for each student: 
SELECT StudentID, MAX(Grade) AS TopGrade
FROM Grades
GROUP BY StudentID;

-- Sort students by the courses they are enrolled in:
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students s
JOIN Grades g ON s.StudentID = g.StudentID
JOIN Courses c ON g.CourseID = c.CourseID
ORDER BY c.CourseName, s.StudentID;

-- Summary report of courses and their average grades, sorted by difficulty:
SELECT c.CourseName, AVG(g.Grade) AS AverageGrade
FROM Courses c
LEFT JOIN Grades g ON c.CourseID = g.CourseID
GROUP BY c.CourseName
ORDER BY AVG(g.Grade);

-- Finding which student and professor have the most courses in common:
SELECT s.StudentID, p.ProfessorID, COUNT(*) AS CommonCourses
FROM Grades s
JOIN Grades p ON s.CourseID = p.CourseID
WHERE s.StudentID != p.StudentID
GROUP BY s.StudentID, p.ProfessorID
ORDER BY CommonCourses DESC
LIMIT 1;
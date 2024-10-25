# # Write your MySQL query statement below
# select students.student_id, students.student_name, subjects.subject_name, count(examinations.subject_name) as attended_exams from students
# right join examinations on students.student_id = examinations.student_id
# cross join subjects on examinations.subject_name = subjects.subject_name
# group by examinations.student_id, students.student_name, examinations.subject_name
# order by students.student_id, subjects.subject_name ;


##

# Write your MySQL query statement below
SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

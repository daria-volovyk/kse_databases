WITH quantity_of_courses AS(     #create cte to find how many courses each student enrolled
	SELECT  
			s.student_id, 
			COUNT(c.course_id) as quantity 
	FROM courses c
    JOIN enrollments e
    on e.course_id=c.course_id
    JOIN students s
    on s.student_id=e.student_id
    GROUP BY student_id HAVING count(c.course_id)<2) #select only that students who has less than 2
SELECT s.first_name as student_name, s.last_name as student_last_name, d.department_name,
	c.course_name, p.first_name as teacher_name, p.last_name as teacher_last_name, p.email as teacher_email, 
    e.enrollment_date, e.grade, d.building, q.quantity FROM students s
	JOIN departments d on s.department_id=d.department_id
	JOIN enrollments e on s.student_id=e.student_id
    JOIN courses c on e.course_id=c.course_id
    JOIN professors p on p.department_id=d.department_id
    JOIN quantity_of_courses q on s.student_id=q.student_id
    WHERE e.grade>(SELECT avg(grade) FROM enrollments)  #select students whose grade is bigger than avg
    ORDER BY e.grade DESC #descending grade
    LIMIT 2;
    
#so as the result this code will show the first 2 persons, who took less than 2 classes, has the grade more than avg, and as we have desc order by it means that they also have the greatest grades
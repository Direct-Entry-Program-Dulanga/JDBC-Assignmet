DROP DATABASE IF EXISTS DEP_master;

CREATE DATABASE DEP_master;

USE DEP_master;

DROP TABLE IF EXISTS student;

CREATE TABLE student (
     id   INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(50) NOT NULL
);

ALTER TABLE student ADD COLUMN contact VARCHAR(25);

DROP TABLE IF EXISTS contact;


CREATE TABLE contact(
        student_id INT NOT NULL,
        contact VARCHAR(15) NOT NULL,
        CONSTRAINT PRIMARY KEY ( student_id, contact ),
        CONSTRAINT fk_contact FOREIGN KEY (student_id) REFERENCES student(id)
);


SELECT * FROM student;
# DELETE FROM student WHERE 1=1;

TRUNCATE student;

DELETE FROM student WHERE true;

ALTER TABLE student AUTO_INCREMENT = 1;



# SELECT * FROM table1, table2 = CROSS JOIN;
SELECT * FROM student, contact;
SELECT * FROM student CROSS JOIN contact;

#INNER JOIN (EQUI JOIN)
SELECT * FROM student INNER JOIN contact ON student.id = contact.student_id;

#RIGHT OUTER JOIN
SELECT * FROM student RIGHT OUTER JOIN contact ON student.id = contact.student_id;

#LEFT OUTER JOIN
SELECT * FROM student LEFT OUTER JOIN contact ON student.id = contact.student_id;

#SELECT * FROM student FULL OUTER JOIN contact;

#UNION
SELECT * FROM student
UNION
SELECT * FROM contact;

SELECT * FROM student LEFT OUTER JOIN contact ON student.id = contact.student_id
UNION
SELECT * FROM student RIGHT OUTER JOIN contact ON student.id = contact.student_id;


# ALTER TABLE contact RENAME COLUMN id TO student_id;

SELECT s.id, s.name, c.contact FROM student s LEFT OUTER JOIN contact c on s.id = c.student_id;

SELECT s.id AS sid, s.name, c.contact FROM student s LEFT OUTER JOIN contact c on s.id = c.student_id;
INSERT INTO students VALUES
(1, 'Anna', 'Ivanova', '2003-04-10', 'anna.iv@univ.edu', 1, 2021),
(2, 'Bohdan', 'Klymenko', '2002-11-25', 'bohdan.k@univ.edu', 2, 2020),
(3, 'Kateryna', 'Melnyk', '2004-01-14', 'katya.m@univ.edu', 1, 2022),
(4, 'Oleksandr', 'Hrytsenko', '2001-09-07', 'oleksandr.h@univ.edu', 3, 2019),
(5, 'Daria', 'Polishchuk', '2003-06-19', 'daria.p@univ.edu', 5, 2021),
(6, 'Yurii', 'Tkachenko', '2002-03-02', 'yurii.t@univ.edu', 4, 2020),
(7, 'Denys', 'Pavliyk', '2007-02-02', 'dpav@gmail.com', 2 ,2021);
#inserting
INSERT INTO courses VALUES
(1, 'Database Systems', 4, 1, 1),
(2, 'Linear Algebra', 3, 2, 2),
(3, 'Quantum Mechanics', 5, 3, 3),
(4, 'Microeconomics', 3, 4, 4),
(5, 'Cognitive Psychology', 4, 5, 5),
(6, 'Web Development', 3, 1, 1);

INSERT INTO professors VALUES
(1, 'Olena', 'Kovalenko', 'olena.kov@univ.edu', '2015-09-01', 1),
(2, 'Ihor', 'Petrenko', 'ihor.petrenko@univ.edu', '2010-03-12', 2),
(3, 'Maria', 'Tkachenko', 'maria.tk@univ.edu', '2018-06-20', 3),
(4, 'Dmytro', 'Shevchenko', 'dmytro.sh@univ.edu', '2013-11-05', 4),
(5, 'Svitlana', 'Bondar', 'svitlana.bondar@univ.edu', '2020-02-14', 5);

INSERT INTO enrollments VALUES
(1, 1, 1, '2023-09-01', 91.0),
(2, 2, 2, '2023-09-01', 87.5),
(3, 3, 6, '2023-09-02', NULL),
(4, 4, 3, '2023-09-05', 78.0),
(5, 5, 5, '2023-09-03', 89.0),
(6, 6, 4, '2023-09-01', 92.0),
(7, 1, 6, '2023-09-02', NULL),
(8, 2, 4, '2023-09-03', 85.0),
(9, 7, 3, '2023-09-5', 100.0);

INSERT INTO departments VALUES
(1, 'Computer Science', 'Tech Hall', 250000.00),
(2, 'Mathematics', 'Main Building', 180000.00),
(3, 'Physics', 'Newton Block', 200000.00),
(4, 'Economics', 'Business Center', 150000.00),
(5, 'Psychology', 'Humanities Wing', 130000.00);

-- INTRODUCTION TO DATABASE FINAL PROJECT, PHASE 3.

										-- Table For Building --
CREATE TABLE Building(
	Building_ID VARCHAR(10) PRIMARY KEY,
	Building_Name VARCHAR(50),
	Status VARCHAR(50),
	Number_of_Rooms INTEGER
);

										-- Table for Room --
CREATE TABLE Room(
	Room_ID VARCHAR(10) PRIMARY KEY,
	Building_ID VARCHAR(10),
	Type VARCHAR(50),
	Capacity INTEGER,
	Status VARCHAR(50),
	FOREIGN KEY (Building_ID) REFERENCES Building(Building_ID)
);

									-- Table for Faculty --
CREATE TABLE Faculty(
	Faculty_ID VARCHAR(10) PRIMARY KEY,
	Faculty_Name VARCHAR(50),
	Phone_Number VARCHAR(15),
	Email VARCHAR(50)
);

								 -- Table for Departments --
CREATE TABLE Department(
	Department_ID VARCHAR(10) PRIMARY KEY,
	Department_Name VARCHAR(50),
	Faculty_ID VARCHAR(10),
	Email VARCHAR(50),
	Phone_Number VARCHAR(15),
	FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID)
);

								-- Table for Instructors --
CREATE TABLE Instructor(
	Instructor_ID VARCHAR(10) PRIMARY KEY,
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Department_ID VARCHAR(10),
	Email VARCHAR(50),
	FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

								-- Table for Semesters --
CREATE TABLE Semester(
	Semester_ID VARCHAR(10) PRIMARY KEY,
	Name VARCHAR(50),
	Start_Date DATE,
	End_Date DATE,
	Status VARCHAR(50)
);

									-- Table for Courses --
CREATE TABLE Courses(
	Course_ID VARCHAR(10) PRIMARY KEY,
	Name VARCHAR(50),
	Credits DECIMAL(8,2)
);

								-- Table for Programs --
CREATE TABLE Programs(
	Program_ID VARCHAR(10) PRIMARY KEY,
	Program_Name VARCHAR(50),
	Faculty_ID VARCHAR(10),
	Program_Level VARCHAR(50),
	Total_Credits DECIMAL(8,2),
	FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID)
);

								-- Table for Students --
CREATE TABLE Students( 
	Student_ID VARCHAR(10) PRIMARY KEY,
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Program VARCHAR(50),
	Email VARCHAR(50),
	Contact_Number VARCHAR(15),
	Program_ID VARCHAR(10),
	FOREIGN KEY (Program_ID) REFERENCES Programs(Program_ID)
	);

									-- Table for Enrollments --
CREATE TABLE Enrollments(
	Enrollment_ID VARCHAR(10) PRIMARY KEY,
	Student_ID VARCHAR(10),
	Course_ID VARCHAR(10),
	Enrollment_Date DATE,
	Grade DECIMAL(8,2),
	Semester_ID VARCHAR(10),
	FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
	FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
	FOREIGN KEY (Semester_ID) REFERENCES Semester(Semester_ID)
);

                            -- Table for Lectures --
CREATE TABLE Lectures(
	Lecture_ID VARCHAR(10) PRIMARY KEY,
	Course_ID VARCHAR(10),
	Instructor_ID VARCHAR(10),
	Day VARCHAR(50),
	Time TIME,
	Room_ID VARCHAR(10),
	FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
	FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
	FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
	
); 

                                    -- Table for Attendance --
CREATE TABLE Attendance( 
	Attendance_ID VARCHAR(10) PRIMARY KEY,
	Lecture_ID VARCHAR(10),
	Student_ID VARCHAR(10),
	Date DATE,
	Status VARCHAR(50),
	FOREIGN KEY (Lecture_ID) REFERENCES Lectures(Lecture_ID),
	FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
);

                                             -- Dummy Data ----
INSERT INTO Building (Building_ID, Building_Name, Status, Number_of_Rooms)
VALUES
('BL001', 'Science Hall', 'Active', 20),
('BL002', 'Business Center', 'Active', 15),
('BL003', 'Engineering Block', 'Active', 25),
('BL004', 'Health Complex', 'Active', 10);

INSERT INTO Room (Room_ID, Building_ID, Type, Capacity, Status)
VALUES
('RM001', 'BL001', 'Lecture Hall', 80, 'Available'),
('RM002', 'BL002', 'Classroom', 40, 'Available'),
('RM003', 'BL003', 'Lab', 30, 'Available'),
('RM004', 'BL004', 'Nursing Lab', 25, 'Available'),
('RM005', 'BL003', 'Workshop', 50, 'Available');

INSERT INTO Faculty (Faculty_ID, Faculty_Name, Phone_Number, Email)
VALUES
('FA001', 'Faculty of Science and Technology', '601-1000', 'fst@university.edu'),
('FA002', 'Faculty of Business and Management', '602-2000', 'fbm@university.edu'),
('FA003', 'Faculty of Engineering', '603-3000', 'fe@university.edu'),
('FA004', 'Faculty of Health Sciences', '604-4000', 'fhs@university.edu');

INSERT INTO Department (Department_ID, Department_Name, Faculty_ID, Email, Phone_Number)
VALUES
('DP001', 'Computer Science', 'FA001', 'cs@university.edu', '601-1111'),
('DP002', 'Business Studies', 'FA002', 'business@university.edu', '602-2222'),
('DP003', 'Civil Engineering', 'FA003', 'civil@university.edu', '603-3333'),
('DP004', 'Health', 'FA004', 'health@university.edu', '604-4444');

INSERT INTO Instructor (Instructor_ID, First_Name, Last_Name, Department_ID, Email)
VALUES
('IN001', 'John', 'Smith', 'DP001', 'jsmith@university.edu'),
('IN002', 'Laura', 'Brown', 'DP002', 'lbrown@university.edu'),
('IN003', 'Carlos', 'Lopez', 'DP003', 'clopez@university.edu'),
('IN004', 'Mia', 'Taylor', 'DP004', 'mtaylor@university.edu');

INSERT INTO Semester (Semester_ID, Name, Start_Date, End_Date, Status)
VALUES
('SE001', 'Semester 1 2025', '2025-01-15', '2025-05-15', 'Active'),
('SE002', 'Semester 2 2025', '2025-08-15', '2025-12-15', 'Upcoming');

INSERT INTO Courses (Course_ID, Name, Credits)
VALUES
('CO001', 'Database Systems', 3.00),
('CO002', 'Accounting I', 3.00),
('CO003', 'Structural Design', 4.00),
('CO004', 'Health and Nutrition', 3.00),
('CO005', 'Programming Concepts', 3.00);

INSERT INTO Programs (Program_ID, Program_Name, Faculty_ID, Program_Level, Total_Credits)
VALUES
('PR001', 'Business Administration', 'FA002', 'Bachelor', 120.00),
('PR002', 'Civil Engineering', 'FA003', 'Bachelor', 124.00),
('PR003', 'Biology', 'FA001', 'Bachelor', 120.00),
('PR004', 'Nursing', 'FA004', 'Bachelor', 118.00),
('PR005', 'Information Technology', 'FA001', 'Bachelor', 122.00),
('PR006', 'Mathematics', 'FA001', 'Bachelor', 120.00),
('PR007', 'English', 'FA001', 'Bachelor', 120.00),
('PR008', 'Spanish', 'FA001', 'Bachelor', 120.00),
('PR009', 'Chemistry', 'FA001', 'Bachelor', 120.00),
('PR010', 'Mechanical Engineering', 'FA003', 'Bachelor', 126.00);

UPDATE Programs
SET Program_Level = 'Associate'
WHERE Total_Credits <= 120;


INSERT INTO Students(Student_ID, First_Name, Last_Name, Program, Email, Contact_Number, Program_ID)
VALUES 
('ST001', 'Amber', 'Russo', 'Information Technology', 'amber12@gmail.com', '669-2114', 'PR005'),
('ST002', 'Peter', 'Parker', 'Science', 'pp2011@gmail.com', '644-3343', 'PR003'),
('ST003', 'Ernesto', 'Escobar', 'Engineering', 'ernesto99@gmail.com', '608-4858', 'PR002'),
('ST004', 'Greg', 'Tucker', 'Business', 'gt23@gmail.com', '607-8778', 'PR001'),
('ST005', 'Arthur', 'Melo', 'Information Technology', 'melo@gmail.com', '641-2205', 'PR007'),
('ST006', 'Ray', 'Cole', 'Nursing', 'cray@gmail.com', '615-3300', 'PR004'),
('ST007', 'Donald', 'Trump', 'Information Technology', 'dtrump@gmail.com', '669-2113', 'PR008'),
('ST008', 'Kirk', 'Swassey', 'Business', 'sway15@gmail.com', '669-2114', 'PR007'),
('ST009', 'Spencer', 'Burns', 'Science', 'bspence@gmail.com', '696-1111', 'PR009'),
('ST010', 'Zander', 'Moore', 'Engineering', 'mzane@gmail.com', '677-0955', 'PR010'),
('ST011', 'Jude', 'Bellignham', 'Information Technology', 'jb22@gmail.com', '602-6405', 'PR003'),
('ST012', 'Jose', 'Maria', 'Business', 'jose16@gmail.com', '600-0220', 'PR001'),
('ST013', 'Cristiano', 'Ronaldo', 'Science', 'cr7@gmail.com', '601-0010', 'PR007'),
('ST014', 'Lionel', 'Messi', 'Math', 'messi10@gmail.com', '697-1401', 'PR002'),
('ST015', 'Roddy', 'Rich', 'English', 'rr99@gmail.com', '622-9988', 'PR009'),
('ST016', 'Travis', 'Scott', 'Information Technology', 'travis33@gmail.com', '647-9544', 'PR009'),
('ST017', 'Marko', 'Antonio', 'Spanish', 'marko23@gmail.com', '665-8412', 'PR006'),
('ST018', 'Kent', 'Harry', 'English', 'harryk9@gmail.com', '631-5518', 'PR005'),
('ST019', 'Alaine', 'Bush', 'Math', 'bush224@gmail.com', '665-6549', 'PR006'),
('ST020', 'Charles', 'Barkley', 'Science', 'cb3@gmail.com', '663-2884', 'PR002');

INSERT INTO Enrollments(Enrollment_ID, Student_ID, Course_ID, Enrollment_Date, Grade, Semester_ID) 
VALUES
('EN001', 'ST001', 'CO001', '2025-01-20', 89.50, 'SE001'),
('EN002', 'ST002', 'CO002', '2025-01-22', 77.00, 'SE001'),
('EN003', 'ST003', 'CO003', '2025-01-25', 85.00, 'SE001'),
('EN004', 'ST004', 'CO004', '2025-01-27', 92.00, 'SE001'),
('EN005', 'ST005', 'CO005', '2025-01-28', 88.00, 'SE001'),
('EN006', 'ST006', 'CO004', '2025-01-29', 91.00, 'SE001'),
('EN007', 'ST007', 'CO001', '2025-01-30', 86.50, 'SE001'),
('EN008', 'ST008', 'CO002', '2025-02-01', 79.00, 'SE001'),
('EN009', 'ST009', 'CO003', '2025-02-02', 84.00, 'SE001'),
('EN010', 'ST010', 'CO005', '2025-02-03', 90.00, 'SE001'),
('EN011', 'ST011', 'CO001', '2025-02-04', 87.00, 'SE001'),
('EN012', 'ST012', 'CO002', '2025-02-05', 82.00, 'SE001'),
('EN013', 'ST013', 'CO003', '2025-02-06', 88.00, 'SE001'),
('EN014', 'ST014', 'CO005', '2025-02-07', 93.00, 'SE001'),
('EN015', 'ST015', 'CO005', '2025-02-08', 85.00, 'SE001'),
('EN016', 'ST016', 'CO001', '2025-02-09', 90.00, 'SE001'),
('EN017', 'ST017', 'CO002', '2025-02-10', 81.00, 'SE001'),
('EN018', 'ST018', 'CO005', '2025-02-11', 88.50, 'SE001'),
('EN019', 'ST019', 'CO003', '2025-02-12', 79.50, 'SE001'),
('EN020', 'ST020', 'CO004', '2025-02-13', 86.00, 'SE001');

INSERT INTO Lectures (Lecture_ID, Course_ID, Instructor_ID, Day, Time, Room_ID)
VALUES
('LE001', 'CO001', 'IN001', 'Monday', '09:00', 'RM001'),
('LE002', 'CO002', 'IN002', 'Tuesday', '10:00', 'RM002'),
('LE003', 'CO003', 'IN003', 'Wednesday', '11:00', 'RM003'),
('LE004', 'CO004', 'IN004', 'Thursday', '13:00', 'RM004'),
('LE005', 'CO005', 'IN001', 'Friday', '14:00', 'RM005');

INSERT INTO Attendance (Attendance_ID, Lecture_ID, Student_ID, Date, Status)
VALUES
('AT001', 'LE001', 'ST001', '2025-02-10', 'Present'),
('AT002', 'LE002', 'ST002', '2025-02-11', 'Absent'),
('AT003', 'LE003', 'ST003', '2025-02-12', 'Present'),
('AT004', 'LE004', 'ST004', '2025-02-13', 'Present'),
('AT005', 'LE005', 'ST005', '2025-02-14', 'Absent'),
('AT006', 'LE001', 'ST006', '2025-02-15', 'Present'),
('AT007', 'LE002', 'ST007', '2025-02-16', 'Present'),
('AT008', 'LE003', 'ST008', '2025-02-17', 'Absent'),
('AT009', 'LE004', 'ST009', '2025-02-18', 'Present'),
('AT010', 'LE005', 'ST010', '2025-02-19', 'Present'),
('AT011', 'LE003', 'ST011', '2025-02-20', 'Present'),
('AT012', 'LE002', 'ST012', '2025-02-21', 'Absent'),
('AT013', 'LE003', 'ST013', '2025-02-22', 'Present'),
('AT014', 'LE004', 'ST014', '2025-02-23', 'Present'),
('AT015', 'LE005', 'ST015', '2025-02-24', 'Absent'),
('AT016', 'LE001', 'ST016', '2025-02-25', 'Present'),
('AT017', 'LE002', 'ST017', '2025-02-26', 'Present'),
('AT018', 'LE003', 'ST018', '2025-02-27', 'Absent'),
('AT019', 'LE004', 'ST019', '2025-02-28', 'Present'),
('AT020', 'LE005', 'ST020', '2025-03-01', 'Present');


-- View all data from each table

SELECT * FROM Students;
SELECT * FROM Enrollments;
SELECT * FROM Lectures;
SELECT * FROM Programs;
SELECT * FROM Courses;
SELECT * FROM Room;
SELECT * FROM Department;
SELECT * FROM Instructor;
SELECT * FROM Building;
SELECT * FROM Faculty;
SELECT * FROM Attendance;
SELECT * FROM Semester;

-- Joining Students to Attendance.
	SELECT * FROM Students JOIN Attendance USING (Student_ID);

-- Joining Students to Enrollments.
	SELECT * FROM Students JOIN Enrollments USING (Student_ID);

-- Joining Enrollments to Semester.
	SELECT * FROM Enrollments JOIN Semester USING (Semester_ID);

-- Joining Enrollments to Courses.
	SELECT * FROM Enrollments JOIN Courses USING (Course_ID);

-- Joining Course to Lectures
	SELECT * FROM Courses JOIN Lectures USING (Course_ID);

-- Joining Lecturers to instructors.
	SELECT * FROM Lectures JOIN Instructor USING (Instructor_ID);

-- Joining Lectures to Room.
	SELECT * FROM Lectures JOIN Room USING (Room_ID);

-- Joining Room to Building.
	SELECT * FROM Room JOIN Building USING (Building_ID);

-- Joining Instructor to Department.
	SELECT * FROM Instructor JOIN Department USING (Department_ID);

-- Joining Department to Faculty.
	SELECT * FROM Department JOIN Faculty USING (Faculty_ID);

-- Joining Faculty to Program.
	SELECT * FROM Faculty JOIN Programs USING (Faculty_ID);

-- Joining Program To Students.
	SELECT * FROM Programs JOIN Students USING (Program_ID);



-- 1 List all students and their programs
SELECT s.First_Name,s.Last_Name, p.Program_Name
FROM Students s
JOIN Programs p ON s.Program_ID = p.Program_ID;

-- 2 List all instructors in the Computer Science department
SELECT i.First_Name, i.Last_Name, i.Email
FROM Instructor i
JOIN Department d ON i.Department_ID = d.Department_ID
WHERE d.Department_Name = 'Computer Science';

-- 3 Show students enrolled in each course
SELECT c.Name, s.First_Name, s.Last_Name, e.Grade
FROM Enrollments e
JOIN Students s ON e.Student_ID = s.Student_ID
JOIN Courses c ON e.Course_ID = c.Course_ID
ORDER BY c.Name;

-- 4 Average grade per course
SELECT c.Name, AVG(e.Grade) AS Average_Grade
FROM Enrollments e
JOIN Courses c ON e.Course_ID = c.Course_ID
GROUP BY c.Name;

-- 5️ Student schedule (Lectures they attend)
SELECT s.First_Name, s.Last_Name, c.Name AS course_name, l.Day, l.Time, l.Room_ID
FROM Enrollments e
JOIN Students s ON e.Student_ID = s.Student_ID
JOIN Courses c ON e.Course_ID = c.Course_ID
JOIN Lectures l ON c.Course_ID = l.Course_ID
ORDER BY s.Last_Name;

-- 6️ Attendance report
SELECT s.First_Name, s.Last_Name, c.Name AS course_name, a.Status, a.Date
FROM Attendance a
JOIN Students s ON a.Student_ID = s.Student_ID
JOIN Lectures l ON a.Lecture_ID = l.Lecture_ID
JOIN Courses c ON l.Course_ID = c.Course_ID;

-- 7️ Average grade per program
SELECT p.Program_Name, ROUND(AVG(e.Grade), 2) AS Average_Program_Grade
FROM Enrollments e
JOIN Students s ON e.Student_ID = s.Student_ID
JOIN Programs p ON s.Program_ID = p.Program_ID
GROUP BY p.Program_Name;

-- 8️ Students performing below 70
SELECT s.First_Name, s.Last_Name, e.Grade, c.Name AS course_name
FROM Enrollments e
JOIN Students s ON e.Student_ID = s.Student_ID
JOIN Courses c ON e.Course_ID = c.Course_ID
WHERE e.Grade < 70;

-- 9️ Number of students per department
SELECT d.Department_Name, COUNT(s.Student_ID) AS TotalStudents
FROM Students s
JOIN Programs p ON s.Program_ID = p.Program_ID
JOIN Department d ON p.Faculty_ID = d.Faculty_ID
GROUP BY d.Department_Name;

-- 10️ Top 3 performing students overall
SELECT s.First_Name, s.Last_Name, ROUND(AVG(e.Grade), 2) AS AverageGrade
FROM Enrollments e
JOIN Students s ON e.Student_ID = s.Student_ID
GROUP BY s.First_Name, s.Last_Name
ORDER BY AverageGrade DESC
LIMIT 3;

--11 List students who scored above the overall average grade
SELECT s.Student_ID, s.First_Name, s.Last_Name, ROUND(AVG(e.Grade), 2) AS Student_Avg_Grade
FROM Enrollments e
JOIN Students s ON e.Student_ID = s.Student_ID
GROUP BY s.Student_ID, s.First_Name, s.Last_Name
HAVING AVG(e.Grade) > (SELECT AVG(Grade) FROM Enrollments);

--12 Showing Instructors and their respective departments
SELECT i.First_Name, i.Last_Name, d.Department_Name FROM Instructor i
JOIN Department d ON i.Department_ID = d.Department_ID

-- 14.Lectures Per Department
SELECT l.Lecture_ID, i.First_Name, i.Last_Name, d.Department_Name FROM Lectures l
JOIN Instructor i ON i.Instructor_ID = l.Instructor_ID
JOIN Department d ON i.Department_ID = d.Department_ID

-- 15. Grade report showing all courses a student is enrolled in along with their grades
SELECT s.Student_ID, s.First_Name, s.Last_Name, c.Name AS Course_Name, e.Grade FROM Enrollments e
JOIN Students s ON e.Student_ID = s.Student_ID
JOIN Courses c ON e.Course_ID = c.Course_ID
ORDER BY s.Last_Name, c.Name;
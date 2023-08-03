CREATE DATABASE Task
USE Task

CREATE TABLE Departments (
	Id int PRIMARY KEY IDENTITY,
	[Name] nvarchar(50) NOT NULL
)

CREATE TABLE Positions (
	Id int PRIMARY KEY IDENTITY,
	Title nvarchar(50) NOT NULL,
	Salary decimal NOT NULL,
	DepartmentId int FOREIGN KEY REFERENCES Departments(Id)
)

CREATE TABLE Employees (
	Id int PRIMARY KEY IDENTITY,
	FirstName nvarchar(20) NOT NULL,
	LastName nvarchar(20),
	PositionId int FOREIGN KEY REFERENCES Positions(Id)
)

SELECT E.Id, FirstName, LastName, [Name] 'Department', Title 'Position', Salary
FROM Employees E
JOIN Positions P ON E.PositionId = P.Id
JOIN Departments D ON P.DepartmentId = D.Id

USE PROJECT

create table Employee (
EmployeeId  int Identity(101,1) PRIMARY KEY,
EmployeeName Varchar(30),
EmployeePhoneNumber Varchar(10),
Department_id int NOT NULL,
FOREIGN KEY(Department_id) references Department(Department_id),
manager_id int,
EmployeeDesignation Varchar(20),
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)
GO
Create table Department(
Department_id int Identity(1,1) PRIMARY KEY,
DepartmentName Varchar(20)
)
GO
DROP TABLE Userlogin
insert into Department (DepartmentName )values ('Technical Team')
Select * from Employee
ALTER TABLE Department Alter COlumn DepartmentName Varchar(20)
BEGIN TRANSACTION
insert into Employee(EmployeeName,EmployeePhoneNumber,Department_id,manager_id,EmployeeDesignation) Values('AnishK','8828769865',1,2,'JuniorDeveloper')
insert into Employee(EmployeeName,EmployeePhoneNumber,Department_id,manager_id,EmployeeDesignation) Values('Srini','8838658956',2,2,'Trainer')
COMMIT TRAN
BEGIN TRANSACTION
UPDATE Employee SET EmployeeName='Srini' where EmployeeId='101'
SELECT EmployeeID,EmployeeName,EmployeePhoneNumber,Department_id,manager_id,EmployeeDesignation,created_at,
CASE when Department_id=1 then 'Technical team'  
when Department_id=2 then 'HR Team' END as Department from Employee ;
COMMIT TRAN
CREATE PROCEDURE INSERT_RECORD
@name VArchar(30),
@phoneNumber Varchar(10),
@Dept_id int,
@manager_id int,
@designation VArchar(20)
AS 
BEGIN
insert into Employee(EmployeeName,EmployeePhoneNumber,Department_id,manager_id,EmployeeDesignation) Values(@name,@phoneNumber,@Dept_id,@manager_id,@designation)
END
CREATE PROCEDURE DISPLAY_DEPARTMENT
AS
BEGIN
SELECT Department_id,DepartmentName FROM Department 
END	
DROP PROCEDURE INSERT_RECORD
CREATE TABLE Userlogin(
userId int Identity(1,1) PRIMARY KEY,
Employeeid int NOT NULL,
FOREIGN KEY(EmployeeId) references Employee(EmployeeId),
username Varchar(30) NOT NULL UNIQUE,
password Varchar(15) NOT NULL UNIQUE,
roll Varchar(5) NOT NULL,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)
ALTER TABLE Userlogin ALTER COLUMN password Varchar(15)NOT NULL
SELECT * FROM Userlogin
CREATE PROCEDURE INSERT_USER
@employeeId int,
@username Varchar(30),
@password Varchar(15),
@roll Varchar(5)
AS 
BEGIN
Insert into Userlogin(Employeeid,username,password,roll) VALUES(@employeeId,@username, @password,@roll)
END
CREATE PROCEDURE GET_EMPLOYEEID
@name Varchar(30),
@phoneNumber Varchar(10)
AS
BEGIN
SELECT EmployeeId FROM Employee where EmployeeName=@name and EmployeePhoneNumber=@phoneNumber
END	
CREATE PROCEDURE USER_DETAILS
AS
BEGIN
SELECT  username,password,roll from Userlogin
END
Select * from Employee
Select * from UserLogin
ALTER TABLE Userlogin ALTER COLUMN password varchar(15)
CREATE PROCEDURE SP_UPDATE_EMPLOYEE
@employeeId int,
@name VArchar(30),
@phoneNumber Varchar(10)
AS
BEGIN
UPDATE Employee set EmployeeName=@name,EmployeePhoneNumber=@phoneNumber where EmployeeId=@employeeId
END
CREATE PROCEDURE SP_DISPLAY_EMPLOYEE
AS
BEGIN
SELECT EmployeeId,EmployeeName,EmployeePhoneNumber,Department_id,manager_id,EmployeeDesignation from Employee
END

CREATE PROCEDURE SP_DELETE_EMPLOYEE
@employeeId int
AS
BEGIN
delete from Employee where Employeeid =@employeeId
END

CREATE PROCEDURE SP_DELETE_DEPARTMENT
@departmentId int
AS
BEGIN
delete from Department where Department_id =@departmentId
END

CREATE PROCEDURE SP_UPDATE_DEPARTMENT
@departmentId int,
@departmentName Varchar(20)
AS
BEGIN
UPDATE Department set DepartmentName=@departmentName where Department_id=@departmentId
END

CREATE PROCEDURE SP_INSERT_DEPARTMENT
@departmentName Varchar(20)
AS
BEGIN
insert into Department(DepartmentName)Values(@departmentName)
END

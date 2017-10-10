use QueryTests

Create table Departments   
(    
ID int primary key identity,    
DepName nvarchar(50),              
)  

Create table Employees    
(    
ID int primary key identity,    
FirstName nvarchar(50),    
LastName nvarchar(50),    
Gender nvarchar(50),    
Salary int,    
DepartmentId int foreign key references Departments(Id)    
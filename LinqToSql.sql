use Test

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
)    

Insert into Departments values ('R&D')    
Insert into Departments values ('Accounting')    
Insert into Departments values ('HR') 
  
Insert into Employees values ('Jai', 'Reddy', 'Male', 32000, 1)    
Insert into Employees values ('Ajay', 'k', 'Male', 23000, 3)    
Insert into Employees values ('Vijay', 'j', 'Male', 8000, 1)    
Insert into Employees values ('Sujay', 'v', 'Male', 8000, 2)    
Insert into Employees values ('Kumari', 'k', 'Female', 12000, 2)   
Create database VIP
use VIP
Create table Departments
(id int primary key identity,
 Name varchar(max)) 

 create table Employees
 (id int primary key identity,
 name varchar(max),
 email varchar(max),
 gender varchar(20),
 mobile varchar(15),
 department_id int foreign key references Departments (id)
 ) 
 select*from Departments;
 select*from Employees ;

 exec SP_Department 'Select'
 exec SP_Department 'CREATE',0,'ACCOUNT'
 exec SP_Department 'UPDATE',2,'SALES' 
 exec SP_Department 'DELETE'

 create proc SP_Department 
 @action varchar(20),
 @id int=0,
 @name varchar(100)=null 
 as 
 begin 
 if (@action='CREATE')
 BEGIN
     insert into Departments(Name)  values(@name) 
	 select 1 as result 
	 end 
	 else if (@action='DELETE')
	 begin 
	 delete from Departments where id =@id
    select 1 as result  
	END
	else if (@action='SELECT') 
	BEGIN 
	SELECT*from Departments
	end 
	else if (@action='UPDATE')
    begin 
	update Departments set Name=@name where id=@id 
	select 1 as ruselt 
	end 
	end
---------------------------------------------------------------------------------------------------------   

exec sp_Employee 'SELECT' 

  exec SP_Employee 'CREATE',0,'RAHUL','rah@gamil.com','9936524110','male',1  
EXEC  sp_Employee 'SELECT JOIN'


create proc sp_Employee  
(
@action varchar(20),
@id int = 0,
@Name varchar(100)=null,
@email varchar(100)=null,
@mobile varchar(15)=null,
@gender varchar(10)=null,
@dept_id int = NULL
)
 as 
 begin 
 if (@action='CREATE')
 BEGIN
     insert into Employees(name, email,mobile,gender,department_id) 
	 values(@Name,@email,@mobile,@gender,@dept_id)
	 select 1 as result 
	 end 
	 else if (@action='DELETE')
	 begin 
	 delete from Employees where id =@id
    select 1 as result  
	END
	else if (@action='SELECT') 
	BEGIN 
	SELECT*from Employees
	end  
	else if (@action='SELECT_JOIN')
	BEGIN 
	SELECT e.Id,e.name,e.email,e.mobile,e.gender,d.name
	from Employees e
	inner join
	Departments d
	on e.department_id=d.id
	end 
	else if (@action='UPDATE')
    begin 
	update Employees set Name=@name,email=@email,mobile=@mobile,gender=@gender,
	department_id=@dept_id WHERE id=@id
	select 1 as ruselt 
	end 
	end
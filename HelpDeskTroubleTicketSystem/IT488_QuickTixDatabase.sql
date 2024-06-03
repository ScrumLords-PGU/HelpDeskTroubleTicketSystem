--Creates the SQL Server Instance Logins (SQL Server Authentication)
--CREATE LOGIN User_Admin WITH PASSWORD='password123', DEFAULT_DATABASE=QuickTix, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
--CREATE LOGIN User_Customer WITH PASSWORD='password123', DEFAULT_DATABASE=QuickTix, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
--CREATE LOGIN User_Technician WITH PASSWORD='password123', DEFAULT_DATABASE=QuickTix, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
--Executed


--Creates the users
--CREATE USER User_Admin FOR LOGIN User_Admin;
--CREATE USER User_Customer FOR LOGIN User_Customer;
--CREATE USER User_Technician FOR LOGIN User_Technician;
--Executed


--Creates database roles
--CREATE ROLE AdminRole;
--CREATE ROLE CustomerRole;
--CREATE ROLE TechnicianRole;
--Executed

--Assigns permissions to roles
Grant Select on [TableName] To AdminRole;
Grant Select on [TableName] To CustomerRole;
Grant Select on [TableName] To TechnicianRole;

--Add users to roles
Alter Role AdminRole Add Member User_Admin;
Alter Role CustomerRole Add Member User_Customer;
Alter Role TechnicianRole Add Member User_Technician;

--Creates UserLogin for admin
CREATE TABLE "UserLogin"(
	"UserID" "int" IDENTITY (1,1) NOT NULL,
	"UserName" nvarchar (20) NOT NULL,
	"Password" nvarchar (10) NOT NULL,
	CONSTRAINT "PK_UserLogin" PRIMARY KEY CLUSTERED 
	(
	"UserID"
	)
)

--Creates ticket table
CREATE TABLE "Ticket"(
	"TicketID" "int" IDENTITY (1,1) NOT NULL,
	"Status" nvarchar (20) NOT NULL,
	"Comments" nvarchar (250) NOT NULL,
	"AssignedTo" nvarchar (50) NOT NULL,
	"CreatedBy" nvarchar (50) NOT NULL,
	CONSTRAINT "PK_TicketID" PRIMARY KEY CLUSTERED
	(
	"TicketID"
	)
)
--Executed

CREATE INDEX "TicketID" ON "dbo"."Ticket"("TicketID")
--Executed

--Creates category table
CREATE TABLE "Category" (
	"CategoryID" "int" IDENTITY (1,1) NOT NULL,
	"CategoryName" nvarchar (50) NOT NULL,
	CONSTRAINT "PK_CategoryID" PRIMARY KEY CLUSTERED
	(
	"CategoryID"
	)
)
--Executed

CREATE INDEX "CategoryName" ON "dbo"."Category"("CategoryName")
--Executed


--Creates priority table
CREATE TABLE "Priority" (
	"PriorityID" "int" IDENTITY (1,1) NOT NULL,
	"PriorityName" nvarchar (50) NOT NULL,
	CONSTRAINT "PK_PriorityID" PRIMARY KEY CLUSTERED
	(
	"PriorityID"
	)
)
--Executed

CREATE INDEX "PriorityName" ON "dbo"."Priority"("PriorityName")
--Executed

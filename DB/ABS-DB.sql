USE [ABS]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[UserEmailAddress] [nvarchar](256) NULL,
	[Password] [nvarchar](50) NULL,
	[UserType] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingObjectWorkingDay]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingObjectWorkingDay](
	[BookingObjectId] [int] NOT NULL,
	[WorkingDayId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[ID] [int] NOT NULL,
	[UserID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Comments] [nvarchar](max) NULL,
	[BookingObjectId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkingDay]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingDay](
	[ID] [int] NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_updt_users]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_updt_users]
(
@ID	int,
@UserName nvarchar(256),              
@FirstName nvarchar(100),
@LastName nvarchar(100),
@UserEmailAddress nvarchar(256)
)

AS BEGIN 

DECLARE @error INT
 

UPDATE Users
SET FirstName=@FirstName,
LastName=@LastName,
UserEmailAddress=@UserEmailAddress
WHERE ID = @ID
AND UserName = @UserName

select @error= @@error
if @error<>0
return @error
end

/*
exec usp_updt_users 1,'shridhar','Shridharan','Iyeran','abc@domain.com'
select * from users 
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_updt_password]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_updt_password]
(
@ID	int,
@UserName nvarchar(256),              
@OldPassword nvarchar(50),
@NewPassword nvarchar(50)
)

AS BEGIN 

DECLARE @error INT
 

UPDATE Users
SET Password=@NewPassword
WHERE ID = @ID
AND UserName = @UserName
AND Password = @OldPassword

select @error= @@error
if @error<>0
return @error
end

/*
exec usp_updt_password 1,'shridhar','shridhari12','shridhar'
select * from users 

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ins_Users]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_ins_Users]  
(    
@FirstName nvarchar(100),    
@LastName nvarchar(100),    
@UserName nvarchar(256),
@UserEmailAddress nvarchar(256),
@Password nvarchar(50), 
@UserType tinyint  
)   
AS BEGIN    
  
Declare @error int 
  
INSERT INTO Users
(  
UserName,
FirstName,
LastName,
UserEmailAddress,
Password,
UserType
)  
VALUES  
(  
@UserName,
@FirstName,
@LastName,
@UserEmailAddress,
@Password,
@UserType
)  
  
     
 SELECT @error=@@error      
  IF @error <>0      
   select @error
  ELSE
   select @@IDENTITY                    
End    
/*  
Test Procedure  
Exec usp_ins_Users 'draco','Draco','Chan','draco@gmail.com','draco',1  
  
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ins_BookingObjectWorkingDay]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_ins_BookingObjectWorkingDay]  
(    
@BookingObjectId int,
@WorkingDayId int  
)   

AS BEGIN    
  
Declare @error int 
  
INSERT INTO BookingObjectWorkingDay
(  
BookingObjectId,
WorkingDayId
)  
VALUES  
(  
@BookingObjectId,
@WorkingDayId
)  
  
SELECT @error=@@error      
IF @error <>0      
   select @error
                       
End    
/*  
Test Procedure  
Exec usp_ins_BookingObjectWorkingDay 'Conference Room 1 - East Wing','2012-05-12 10:00','2012-05-14 12:00'   
select * from Booking  
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ins_Booking]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ins_Booking]  
(    
@Title nvarchar(100),    
@StartTime datetime,    
@EndTime datetime  
)   
AS BEGIN    
  
Declare @error int 
  
INSERT INTO Booking
(  
Title,
StartTime,
EndTime
)  
VALUES  
(  
@Title,
@StartTime,
@EndTime
)  
  
     
 SELECT @error=@@error      
  IF @error <>0      
   select @error
  ELSE
   select @@IDENTITY
                       
End    
/*  
Test Procedure  
Exec usp_ins_Booking 'Conference Room 1 - East Wing','2012-05-12 10:00','2012-05-14 12:00'   
select * from Booking  
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ins_Appointment]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_ins_Appointment]  
(
@UserID int,
@StartDate datetime,
@EndDate datetime,
@Comments nvarchar(MAX),    
@BookingObjectId int
)   

AS BEGIN    
  
Declare @error int 
  
INSERT INTO Appointment
(  
UserID,
StartDate,
EndDate,
Comments,
BookingObjectId
)  
VALUES  
(  
@UserID,
@StartDate,
@EndDate,
@Comments,
@BookingObjectId
)  
  
SELECT @error=@@error      
IF @error <>0      
   select @error
ELSE
   select @@IDENTITY
                          
End    
/*  
Test Procedure  
Exec usp_ins_Appointment 1,'2012-05-12 10:00','2012-05-14 12:00','Staff Lunch',1   
select * from Appointment  
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_get_conference_rooms]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_conference_rooms]
AS BEGIN 

DECLARE @error INT

SELECT ID,Title,StartTime,EndTime
FROM Booking

SELECT @error = @@error                
IF @error <> 0
        RETURN @error
END

/*

EXEC usp_get_conference_rooms

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_get_booking_details_for_edit]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_booking_details_for_edit]
(@ID int
)
AS BEGIN 

DECLARE @error INT

SELECT ID,Title,StartTime,EndTime
FROM Booking
WHERE ID = @ID

SELECT BookingObjectId,WorkingDayId
FROM BookingObjectWorkingDay
WHERE BookingObjectId = @ID

SELECT @error = @@error                
IF @error <> 0
        RETURN @error
END


/*

EXEC usp_get_booking_details_for_edit

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_get_booking_availability]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_booking_availability]
(@Dt datetime
)
AS BEGIN 

DECLARE @error INT,
		@pInputDate datetime,
		@fdow datetime,
		@edow datetime

SELECT @pInputDate = CONVERT(VARCHAR(10), @Dt, 111)
SELECT @pInputDate

SELECT DATEPART(DW,@pInputDate)

SELECT @fdow = DATEADD(DD, 1 - DATEPART(DW, @pInputDate),
               @pInputDate)
SELECT @fdow

SELECT @edow = DATEADD(DD, 13,@fdow)
SELECT @edow

SELECT b.ID,b.Title,b.StartTime,b.EndTime,bowd.WorkingDayId
FROM Booking b,BookingObjectWorkingDay bowd
WHERE b.ID = bowd.BookingObjectId


SELECT @error = @@error                
IF @error <> 0
        RETURN @error
END


/*
sp_helptext usp_get_booking_availability
EXEC usp_get_booking_availability '2012-05-06'
select datepart(weekday,getdate())
select @@DATEFIRST

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_del_BookingObjectWorkingDay]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_del_BookingObjectWorkingDay]  
(    
@BookingObjectId int,
@WorkingDayId int  
)   

AS BEGIN    
  
Declare @error int 
  
DELETE FROM BookingObjectWorkingDay
WHERE BookingObjectId = @BookingObjectId
AND WorkingDayId = @WorkingDayId
  
  
SELECT @error=@@error      
IF @error <>0      
   select @error
                       
End    
/*  
Test Procedure  
Exec usp_del_BookingObjectWorkingDay 
select * from BookingObjectWorkingDay  
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_del_Booking]    Script Date: 05/12/2012 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_del_Booking]  
( 
@ID int,   
@Title nvarchar(100),    
@StartTime datetime,    
@EndTime datetime  
)   
AS BEGIN    
  
Declare @error int 
  
DELETE FROM Booking
WHERE ID = @ID
  
     
SELECT @error=@@error      
IF @error <>0      
   select @error
                       
End    
/*  
Test Procedure  
Exec usp_del_Booking 1
select * from Booking  
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_del_Appointment]    Script Date: 05/12/2012 17:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_del_Appointment]  
(
@ID int
)   

AS BEGIN    
  
Declare @error int 
  
DELETE FROM Appointment
WHERE ID = @ID
  
SELECT @error=@@error      
IF @error <>0      
   select @error
ELSE
   select @@IDENTITY
                          
End    
/*  
Test Procedure  
Exec usp_del_Appointment 1
select * from Appointment  
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_check_for_duplicate_UserName]    Script Date: 05/12/2012 17:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_check_for_duplicate_UserName]  
(
@UserName nvarchar(256)
)   

AS BEGIN    
  
Declare @error int,
	    @count int,
	    @return_value int
	    
SET @count = (SELECT COUNT(*)
			  FROM Users
			  WHERE UserName = @UserName
			  ) 
  
IF @count > 0
	SELECT 'Username not available'
ELSE
	SELECT 'Username is available'
  
SELECT @error=@@error      
IF @error <>0      
   select @error
                          
End    
/*  
Test Procedure  
Exec usp_check_for_duplicate_UserName 'shridhar'  
select * from users where username = 'shridhar'  
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_check_for_duplicate_conference_room]    Script Date: 05/12/2012 17:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_check_for_duplicate_conference_room]  
(
@Title nvarchar(100)
)   

AS BEGIN    
  
Declare @error int,
	    @count int,
	    @return_value int
	    
SET @count = (SELECT COUNT(*)
			  FROM Booking 
			  WHERE Title = @Title
			  ) 
  
IF @count > 0
	SET @return_value = -1
ELSE
	SET @return_value = 1
  
SELECT @error=@@error      
IF @error <>0      
   select @error
ELSE
   select @return_value	
                          
End    
/*  
Test Procedure  
Exec usp_check_for_duplicate_conference_room 'Conference Room 1 - East Wing'  
select * from booking
select * from bookingobjectworkingday where bookingobjectid = 1
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_check_for_duplicate_Booking]    Script Date: 05/12/2012 17:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_check_for_duplicate_Booking]  
(
@Title nvarchar(100),
@StartTime datetime,
@EndTime datetime
)   

AS BEGIN    
  
Declare @error int,
	    @count int,
	    @return_value int
	    
SET @count = (SELECT COUNT(*)
			  FROM Booking b,BookingObjectWorkingDay bowd
			  WHERE b.Title = @Title
			  AND ((b.StartTime = @StartTime) AND (@StartTime <> '1900-01-01'))
			  AND ((b.EndTime = @EndTime) AND (@EndTime <> '1900-01-01'))
			  AND b.ID = bowd.BookingObjectId
			  ) 
  
IF @count > 0
	SET @return_value = -1
ELSE
	SET @return_value = 1
  
SELECT @error=@@error      
IF @error <>0      
   select @error
ELSE
   select @return_value	
                          
End    
/*  
Test Procedure  
Exec usp_check_for_duplicate_Booking 'shridhar'  
select * from booking
select * from bookingobjectworkingday where bookingobjectid = 1
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_check_for_duplicate_Appointment]    Script Date: 05/12/2012 17:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_check_for_duplicate_Appointment]  
(
@UserID int,
@StartDate datetime,
@EndDate datetime,
@BookingObjectId int
)   

AS BEGIN    
  
Declare @error int,
	    @count int,
	    @return_value int
	    
SET @count = (SELECT COUNT(*)
			  FROM Appointment
			  WHERE UserID = @UserID	
			  AND StartDate = @StartDate
			  AND EndDate = @EndDate
			  AND BookingObjectId = @BookingObjectId
			  ) 
  
IF @count > 0
	SET @return_value = -1
ELSE
	SET @return_value = 1 
  
SELECT @error=@@error      
IF @error <>0      
   select @error
ELSE
   select @return_value
                          
End    
/*  
Test Procedure  
Exec usp_check_for_duplicate_Appointment 1,'2012-05-12 10:00','2012-05-14 12:00','Staff Lunch',1   
select * from Appointment  
*/
GO

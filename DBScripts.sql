USE [BookingSystemDB]
GO
/****** Object:  Table [dbo].[WorkingDay]    Script Date: 05/17/2012 22:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingDay](
	[ID] [int] NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK_WorkingDay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 05/17/2012 22:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/17/2012 22:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[UserEmailAddress] [nvarchar](256) NULL,
	[Password] [nvarchar](50) NULL,
	[UserType] [tinyint] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingObjectWorkingDay]    Script Date: 05/17/2012 22:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingObjectWorkingDay](
	[BookingObjectId] [int] NOT NULL,
	[WorkingDayId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 05/17/2012 22:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Comments] [nvarchar](max) NULL,
	[BookingObjectId] [int] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_check_for_duplicate_UserName]    Script Date: 05/17/2012 22:47:54 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_check_for_duplicate_conference_room]    Script Date: 05/17/2012 22:47:54 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_get_conference_rooms]    Script Date: 05/17/2012 22:47:54 ******/
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
GO
/****** Object:  StoredProcedure [dbo].[usp_del_Booking]    Script Date: 05/17/2012 22:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_del_Booking]  
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
/****** Object:  StoredProcedure [dbo].[usp_ins_Booking]    Script Date: 05/17/2012 22:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_ins_Booking]  
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
  
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_updt_password]    Script Date: 05/17/2012 22:47:54 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ins_Users]    Script Date: 05/17/2012 22:47:54 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ins_BookingObjectWorkingDay]    Script Date: 05/17/2012 22:47:54 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ins_Appointment]    Script Date: 05/17/2012 22:47:54 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_del_Appointment]    Script Date: 05/17/2012 22:47:54 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_get_booking_details_for_edit]    Script Date: 05/17/2012 22:47:54 ******/
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
GO
/****** Object:  StoredProcedure [dbo].[usp_get_booking_availability]    Script Date: 05/17/2012 22:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_booking_availability]
(@Dt datetime
)
AS BEGIN 

DECLARE @error INT,
		@7AMSlot nvarchar(5),
		@8AMSlot nvarchar(5),
		@9AMSlot nvarchar(5),
		@10AMSlot nvarchar(5),
		@11AMSlot nvarchar(5),
		@12PMSlot nvarchar(5),
		@1PMSlot nvarchar(5),
		@2PMSlot nvarchar(5),
		@3PMSlot nvarchar(5),
		@4PMSlot nvarchar(5),
		@5PMSlot nvarchar(5),
		@6PMSlot nvarchar(5),
		@7PMSlot nvarchar(5),
		@8PMSlot nvarchar(5)

CREATE TABLE #TempTbl
(BookingID int,
 Title nvarchar(100),
 _7AMSlot bit,
 _8AMSlot bit,
 _9AMSlot bit,
 _10AMSlot bit,
 _11AMSlot bit,
 _12PMSlot bit,
 _1PMSlot bit,
 _2PMSlot bit,
 _3PMSlot bit,
 _4PMSlot bit,
 _5PMSlot bit,
 _6PMSlot bit,
 _7PMSlot bit,
 _8PMSlot bit
)


INSERT INTO #TempTbl
SELECT b.ID,b.Title,
CASE 
	WHEN  ('7' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ('7' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate)))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  ('8' >= ((CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ('8' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  ('9' >= ((CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ('9' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('10' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ('10' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('11' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ('11' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('12' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ( '12' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('13' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ( '13' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('14' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ( '14' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('15' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ( '15' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('16' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ( '16' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('17' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ( '17' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('18' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ( '18' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('19' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ( '19' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END,
CASE 
	WHEN  (('20' >= (CONVERT(VARCHAR(5),DATEPART(hh,a.StartDate)))) AND ( '20' < (CONVERT(VARCHAR(5),DATEPART(hh,a.EndDate))))) THEN 1
	ELSE 0
END
--,b.StartTime,b.EndTime,a.BookingObjectId
FROM Booking b LEFT OUTER JOIN Appointment a
ON (a.BookingObjectId = b.ID)
--,BookingObjectWorkingDay bowd
WHERE
((DATEPART(dd,@Dt) >= DATEPART(dd,a.StartDate)) AND 
(DATEPART(mm,@Dt) >= DATEPART(mm,a.StartDate))AND 
(DATEPART(yyyy,@Dt) >= DATEPART(yyyy,a.StartDate))) 
AND 
((DATEPART(dd,@Dt) <= DATEPART(dd,a.EndDate)) AND
(DATEPART(mm,@Dt) <= DATEPART(mm,a.EndDate))AND
(DATEPART(yyyy,@Dt) <= DATEPART(yyyy,a.EndDate))
) 
AND a.BookingObjectId = b.ID

SELECT BookingID, Title,_7AMSlot,_8AMSlot,_9AMSlot,_10AMSlot,_11AMSlot,_12PMSlot,_1PMSlot,
 _2PMSlot,_3PMSlot,_4PMSlot,_5PMSlot,_6PMSlot,_7PMSlot,_8PMSlot
FROM #TempTbl

DROP TABLE #TempTbl

SELECT @error = @@error                
IF @error <> 0
        RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[usp_del_BookingObjectWorkingDay]    Script Date: 05/17/2012 22:47:54 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_check_for_duplicate_Booking]    Script Date: 05/17/2012 22:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_check_for_duplicate_Booking]  
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
/****** Object:  StoredProcedure [dbo].[usp_check_for_duplicate_Appointment]    Script Date: 05/17/2012 22:47:54 ******/
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
/****** Object:  ForeignKey [FK_Appointment_Booking]    Script Date: 05/17/2012 22:47:49 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Booking] FOREIGN KEY([BookingObjectId])
REFERENCES [dbo].[Booking] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Booking]
GO
/****** Object:  ForeignKey [FK_Appointment_Users]    Script Date: 05/17/2012 22:47:49 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Users]
GO
/****** Object:  ForeignKey [FK_BookingObjectWorkingDay_Booking]    Script Date: 05/17/2012 22:47:50 ******/
ALTER TABLE [dbo].[BookingObjectWorkingDay]  WITH CHECK ADD  CONSTRAINT [FK_BookingObjectWorkingDay_Booking] FOREIGN KEY([BookingObjectId])
REFERENCES [dbo].[Booking] ([ID])
GO
ALTER TABLE [dbo].[BookingObjectWorkingDay] CHECK CONSTRAINT [FK_BookingObjectWorkingDay_Booking]
GO
/****** Object:  ForeignKey [FK_BookingObjectWorkingDay_WorkingDay]    Script Date: 05/17/2012 22:47:50 ******/
ALTER TABLE [dbo].[BookingObjectWorkingDay]  WITH CHECK ADD  CONSTRAINT [FK_BookingObjectWorkingDay_WorkingDay] FOREIGN KEY([WorkingDayId])
REFERENCES [dbo].[WorkingDay] ([ID])
GO
ALTER TABLE [dbo].[BookingObjectWorkingDay] CHECK CONSTRAINT [FK_BookingObjectWorkingDay_WorkingDay]
GO

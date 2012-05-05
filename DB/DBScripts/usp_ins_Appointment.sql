if exists(Select * from sysobjects
            where id = object_id('usp_ins_Appointment'))

drop procedure usp_ins_Appointment
Go

Create Procedure usp_ins_Appointment  
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

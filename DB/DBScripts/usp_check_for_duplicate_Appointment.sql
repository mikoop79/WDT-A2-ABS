if exists(Select * from sysobjects
            where id = object_id('usp_check_for_duplicate_Appointment'))

drop procedure usp_check_for_duplicate_Appointment
Go

Create Procedure usp_check_for_duplicate_Appointment  
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

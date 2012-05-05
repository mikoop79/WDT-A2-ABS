if exists(Select * from sysobjects
            where id = object_id('usp_check_for_duplicate_Booking'))

drop procedure usp_check_for_duplicate_Booking
Go

Create Procedure usp_check_for_duplicate_Booking  
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

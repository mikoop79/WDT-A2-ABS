if exists(Select * from sysobjects
            where id = object_id('usp_check_for_duplicate_conference_room'))

drop procedure usp_check_for_duplicate_conference_room
Go

Create Procedure usp_check_for_duplicate_conference_room  
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

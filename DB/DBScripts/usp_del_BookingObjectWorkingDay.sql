if exists(Select * from sysobjects
            where id = object_id('usp_del_BookingObjectWorkingDay'))

drop procedure usp_del_BookingObjectWorkingDay
Go

Create Procedure usp_del_BookingObjectWorkingDay  
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

if exists(Select * from sysobjects
            where id = object_id('usp_ins_BookingObjectWorkingDay'))

drop procedure usp_ins_BookingObjectWorkingDay
Go

Create Procedure usp_ins_BookingObjectWorkingDay  
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

if exists(Select * from sysobjects
            where id = object_id('usp_ins_Booking'))

drop procedure usp_ins_Booking
Go

Create Procedure usp_ins_Booking  
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

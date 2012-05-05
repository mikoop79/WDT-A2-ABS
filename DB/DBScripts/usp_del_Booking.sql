if exists(Select * from sysobjects
            where id = object_id('usp_del_Booking'))

drop procedure usp_del_Booking
Go

Create Procedure usp_del_Booking  
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

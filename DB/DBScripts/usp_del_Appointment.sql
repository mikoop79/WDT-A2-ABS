if exists(Select * from sysobjects
            where id = object_id('usp_del_Appointment'))

drop procedure usp_del_Appointment
Go

Create Procedure usp_del_Appointment  
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

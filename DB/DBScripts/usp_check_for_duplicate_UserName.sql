if exists(Select * from sysobjects
            where id = object_id('usp_check_for_duplicate_UserName'))

drop procedure usp_check_for_duplicate_UserName
Go

Create Procedure usp_check_for_duplicate_UserName  
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

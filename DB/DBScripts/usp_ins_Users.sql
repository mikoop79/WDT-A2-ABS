if exists(Select * from sysobjects
            where id = object_id('usp_ins_Users'))

drop procedure usp_ins_Users
Go

Create Procedure usp_ins_Users  
(    
@FirstName nvarchar(100),    
@LastName nvarchar(100),    
@UserName nvarchar(256),
@UserEmailAddress nvarchar(256),
@Password nvarchar(50), 
@UserType tinyint  
)   
AS BEGIN    
  
Declare @error int 
  
INSERT INTO Users
(  
UserName,
FirstName,
LastName,
UserEmailAddress,
Password,
UserType
)  
VALUES  
(  
@UserName,
@FirstName,
@LastName,
@UserEmailAddress,
@Password,
@UserType
)  
  
     
 SELECT @error=@@error      
  IF @error <>0      
   select @error
  ELSE
   select @@IDENTITY                    
End    
/*  
Test Procedure  
Exec usp_ins_Users 'draco','Draco','Chan','draco@gmail.com','draco',1  
  
*/  

IF EXISTS ( SELECT * 
            FROM sysobjects 
            WHERE id = object_id ('usp_updt_users')) 	
	DROP PROCEDURE usp_updt_users
GO
CREATE PROCEDURE usp_updt_users
(
@ID	int,
@UserName nvarchar(256),              
@FirstName nvarchar(100),
@LastName nvarchar(100),
@UserEmailAddress nvarchar(256)
)

AS BEGIN 

DECLARE @error INT
 

UPDATE Users
SET FirstName=@FirstName,
LastName=@LastName,
UserEmailAddress=@UserEmailAddress
WHERE ID = @ID
AND UserName = @UserName

select @error= @@error
if @error<>0
return @error
end

/*
exec usp_updt_users 1,'shridhar','Shridharan','Iyeran','abc@domain.com'
select * from users 
*/
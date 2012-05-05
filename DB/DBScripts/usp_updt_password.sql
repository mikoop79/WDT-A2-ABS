IF EXISTS ( SELECT * 
            FROM sysobjects 
            WHERE id = object_id ('usp_updt_password')) 	
	DROP PROCEDURE usp_updt_password
GO
CREATE PROCEDURE usp_updt_password
(
@ID	int,
@UserName nvarchar(256),              
@OldPassword nvarchar(50),
@NewPassword nvarchar(50)
)

AS BEGIN 

DECLARE @error INT
 

UPDATE Users
SET Password=@NewPassword
WHERE ID = @ID
AND UserName = @UserName
AND Password = @OldPassword

select @error= @@error
if @error<>0
return @error
end

/*
exec usp_updt_password 1,'shridhar','shridhari12','shridhar'
select * from users 

*/
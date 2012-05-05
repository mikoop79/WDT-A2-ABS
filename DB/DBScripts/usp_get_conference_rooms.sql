If Exists (Select * from SysObjects
            Where Id=Object_Id('usp_get_conference_rooms'))
DROP PROCEDURE usp_get_conference_rooms
Go
CREATE PROCEDURE usp_get_conference_rooms
AS BEGIN 

DECLARE @error INT

SELECT ID,Title,StartTime,EndTime
FROM Booking

SELECT @error = @@error                
IF @error <> 0
        RETURN @error
END
go

/*

EXEC usp_get_conference_rooms

*/
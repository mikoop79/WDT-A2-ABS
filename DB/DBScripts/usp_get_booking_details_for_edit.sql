If Exists (Select * from SysObjects
            Where Id=Object_Id('usp_get_booking_details_for_edit'))
DROP PROCEDURE usp_get_booking_details_for_edit
Go
CREATE PROCEDURE usp_get_booking_details_for_edit
(@ID int
)
AS BEGIN 

DECLARE @error INT

SELECT ID,Title,StartTime,EndTime
FROM Booking
WHERE ID = @ID

SELECT BookingObjectId,WorkingDayId
FROM BookingObjectWorkingDay
WHERE BookingObjectId = @ID

SELECT @error = @@error                
IF @error <> 0
        RETURN @error
END
go

/*

EXEC usp_get_booking_details_for_edit

*/
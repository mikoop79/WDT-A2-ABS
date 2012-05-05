If Exists (Select * from SysObjects
            Where Id=Object_Id('usp_get_booking_availability'))
DROP PROCEDURE usp_get_booking_availability
Go
CREATE PROCEDURE usp_get_booking_availability
(@Dt datetime
)
AS BEGIN 

DECLARE @error INT,
		@pInputDate datetime,
		@fdow datetime,
		@edow datetime

SELECT @pInputDate = CONVERT(VARCHAR(10), @Dt, 111)
SELECT @pInputDate

SELECT DATEPART(DW,@pInputDate)

SELECT @fdow = DATEADD(DD, 1 - DATEPART(DW, @pInputDate),
               @pInputDate)
SELECT @fdow

SELECT @edow = DATEADD(DD, 13,@fdow)
SELECT @edow

SELECT b.ID,b.Title,b.StartTime,b.EndTime,bowd.WorkingDayId
FROM Booking b,BookingObjectWorkingDay bowd
WHERE b.ID = bowd.BookingObjectId


SELECT @error = @@error                
IF @error <> 0
        RETURN @error
END
go

/*
sp_helptext usp_get_booking_availability
EXEC usp_get_booking_availability '2012-05-06'
select datepart(weekday,getdate())
select @@DATEFIRST

*/
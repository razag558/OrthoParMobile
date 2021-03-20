 
CREATE PROCEDURE [dbo].[SP_Record_ofuser_Updating]
(
	@id int,
	@firstname nvarchar(50),
	@lastname nvarchar(50),
	@country nvarchar(50),
	@city nvarchar(50),
	@email nvarchar(250),
	@username nvarchar(250), 
	@userpassword nvarchar(250),
	@phone_number nvarchar(50)
)
AS
update [tbl_patient_registeration] 
set 
[first_name]=@firstname, 
[last_name]=@lastname, 
[country]=@country,
[city]=@city,
[username]=@username,
[email]=@email,
[userpassword]=@userpassword,
[phone_number]=@phone_number
where (id=@id)
 
 
 



GO



 

Create PROCEDURE [dbo].[SP_patient_Values_fetching]
(
	 @firstname nvarchar(50),
	@lastname nvarchar(50),
	@country nvarchar(50),
	@city nvarchar(50),
	@email nvarchar(250),
	@username nvarchar(100), 
	@userpassword nvarchar(50),
	@phone nvarchar(50)
)
AS
insert into tbl_userrecord(firstname,secondname,city,email,pnumber,userpassword) values 
(@firstname,@lastname,@country,@city,@email,@username,@userpassword,@phone);






CREATE TABLE [dbo].[patient_register](
	[patient_id] [nchar](10) NOT NULL,
	[patient_fname] [nchar](50) NOT NULL,
	[patient_sname] [nchar](50) NOT NULL,
	[patient_country] [nchar](50) NOT NULL,
	[patient_city] [nchar](50) NOT NULL,
	[patient_username] [nchar](100) NOT NULL,
	[patient_email] [nchar](250) NOT NULL,
	[patient_password] [nchar](100) NOT NULL,
	[patient_phone] [nchar](50) NOT NULL,
 CONSTRAINT [PK_patient_register] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
 
 
 



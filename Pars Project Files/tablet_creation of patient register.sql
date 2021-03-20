 

CREATE TABLE [dbo].[patient_register](
	[id] [int]  IDENTITY(1,1) NOT NULL,
	[patient_fname] [nchar](50) NOT NULL,
	[patient_sname] [nchar](50) NOT NULL,
	[patient_country] [nchar](50) NOT NULL,
	[patient_city] [nchar](50) NOT NULL,
	[patient_username] [nchar](250) NOT NULL,
	[patient_email] [nchar](250) NOT NULL,
	[patient_password] [nchar](250) NOT NULL,
	[patient_phone_number] [nchar](50) NOT NULL,
 CONSTRAINT [PK_patient_register] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



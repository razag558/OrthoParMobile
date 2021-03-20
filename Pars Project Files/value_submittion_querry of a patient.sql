CREATE TABLE [dbo].[patients_values_record](
	[value_id] [nchar](10) NOT NULL,
	[record_status] [bit] NOT NULL,
	[c_value] [nchar](10) NOT NULL,
	[f_value] [nchar](10) NOT NULL,
	[i_value] [nchar](10) NOT NULL,
	[l_value] [nchar](10) NOT NULL,
	[n_value] [nchar](10) NOT NULL,
	[patient_username] [nchar](50) NOT NULL,
 CONSTRAINT [PK_patients_values_record] PRIMARY KEY CLUSTERED 
(
	[value_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
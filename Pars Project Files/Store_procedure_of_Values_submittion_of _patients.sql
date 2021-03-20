Create PROCEDURE [dbo].[patient_recordsubmit]
(
	@record_status bit ,
	@cvalue nvarchar(50),
	@fvalue nvarchar(50),
	@ivalue nvarchar(50),
	@lvalue  nvarchar(50),
	@nvalue nvarchar(250),
	@username nvarchar(50) 
)
AS
insert into patients_values_record(record_status,c_value,f_value,i_value,l_value,n_value,patient_username) values 
(@record_status,@cvalue,@fvalue,@ivalue,@lvalue,@nvalue,@username);
Create PROCEDURE [dbo].[SP_Patient_ParsRecord]
(
	@preorposttreatment nvarchar(50),
	@cvalue float ,
	@fvalue float ,
	@ivalue float ,
	@lvalue  float ,
	@nvalue float ,
	@username nvarchar(250),
	@pars_datetime datetime
)
AS
insert into patients_values_record(preorposttreatment,c_value,f_value,i_value,l_value,n_value,patient_username,pars_datetime) values 
(@preorposttreatment,@cvalue,@fvalue,@ivalue,@lvalue,@nvalue,@username,@pars_datetime);
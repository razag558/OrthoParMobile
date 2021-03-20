Create PROCEDURE [dbo].[patient_recordsubmit]
(
	@status bit(50),
	@cvalue nvarchar(50),
	@fvalue nvarchar(50),
	@ivalue nvarchar(50),
	@lvalue  nvarchar(50),
	@nvalue nvarchar(250),
	@username nvarchar(50) 
)
AS
insert into patient_values(status,c_value,fvalue,ivalue,lvalue,nvalue,username) values 
(@status,@cvalue,@fvalue,@ivalue,@lvalue,@nvalue,@username);
 


OnRowCommand="datatable_RowCommand" OnRowDeleting="datatable_RowDeleting"
                 OnRowDataBound="datatable_RowDataBound" OnPreRender="datatable_PreRender"
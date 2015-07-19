IF  EXISTS (SELECT * FROM sys.objects  WHERE object_id = OBJECT_ID(N'dbo.fn_test')) 
drop function dbo.fn_test 
GO
IF  EXISTS (SELECT * FROM sys.objects  WHERE object_id = OBJECT_ID(N'dbo.usp_TestClrProc')) 
drop procedure dbo.usp_TestClrProc 
GO
IF  EXISTS (SELECT * FROM sys.assemblies  WHERE name = 'SqlAssembly') 
drop ASSEMBLY SqlAssembly
GO
declare @dir as nvarchar(1000)
set @dir = 'd:\Work\GIT\GitHub\CLRFunctionsTest\SqlAssembly\SqlAssembly\bin\Debug\'
create ASSEMBLY SqlAssembly FROM @dir + 'SqlAssembly.dll' 
Go
create FUNCTION dbo.fn_test()
RETURNS TABLE (Id int, Name nvarchar(max))
AS
EXTERNAL NAME SqlAssembly.[SqlAssembly.TabledFunctions].SqlFunction2
GO
CREATE PROCEDURE dbo.usp_TestClrProc
     AS EXTERNAL NAME SqlAssembly.[SqlAssembly.TabledFunctions].TestStoredProcedureCode
--select * from dbo.fn_test()

--exec usp_TestClrProc

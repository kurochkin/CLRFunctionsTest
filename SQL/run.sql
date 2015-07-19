declare @dir as nvarchar(1000)
set @dir = 'd:\Work\GIT\GitHub\CLRFunctionsTest\SqlAssembly\SqlAssembly\bin\Debug\'

drop function dbo.fn_test
drop ASSEMBLY SqlAssembly
create ASSEMBLY SqlAssembly FROM @dir + 'SqlAssembly.dll' 
Go
create FUNCTION dbo.fn_test()
RETURNS TABLE (Id int, Name nvarchar(max))
AS
EXTERNAL NAME SqlAssembly.[SqlAssembly.TabledFunctions].SqlFunction2

--select * from dbo.fn_test()


drop function dbo.fn_test
drop ASSEMBLY SqlAssembly
create ASSEMBLY SqlAssembly FROM 'c:\users\иван\documents\visual studio 2013\Projects\SqlAssembly\SqlAssembly\bin\Debug\SqlAssembly.dll' 
Go
create FUNCTION dbo.fn_test()
RETURNS TABLE (Id int, Name nvarchar(max))
AS
EXTERNAL NAME SqlAssembly.[SqlAssembly.TabledFunctions].SqlFunction2




--drop function dbo.fn_test
--select * from sys.assemblies

--select * from dbo.fn_test()


--CREATE PROCEDURE usp_GetTwoBOMTestData
--(
--@ProductID1 int,
--@ProductID2 int,
--@AsOfDate DateTime
--)
--AS
--BEGIN
--EXEC uspGetBillOfMaterials @ProductID1, @AsOfDate;
--EXEC uspGetBillOfMaterials @ProductID2, @AsOfDate;
--END;
--GO
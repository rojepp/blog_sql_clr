-- First, drop everything in backwards order
IF  EXISTS (SELECT * FROM sys.procedures procs WHERE procs.name = N'Hello')
    DROP PROCEDURE Hello
GO

IF  EXISTS (SELECT * FROM sys.assemblies asms WHERE asms.name = N'SqlClr')
    DROP ASSEMBLY [SqlClr]
GO
IF  EXISTS (SELECT * FROM sys.assemblies asms WHERE asms.name = N'FSCore')
    DROP ASSEMBLY [FSCore]
GO

-- Now, create everything in forwards order
CREATE ASSEMBLY FSCore FROM 'C:\Program Files (x86)\Reference Assemblies\Microsoft\FSharp\2.0\Runtime\v2.0\FSharp.Core.dll' WITH PERMISSION_SET = UNSAFE
GO
CREATE ASSEMBLY SqlClr FROM 'D:\robert\dokument\visual studio 2010\Projects\SqlClr\SqlClr\bin\Debug\SqlClr.dll' WITH PERMISSION_SET = UNSAFE
GO

-- External name is [SqlAssemblyName].[Full typename].[Method name]
CREATE PROCEDURE [dbo].[Hello]
   @name [nvarchar](64)
AS
EXTERNAL NAME [SqlClr].[SqlClr.SqlClrSample].[Hello]
GO


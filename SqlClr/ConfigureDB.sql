
-- Enable Sql Clr
sp_configure 'clr enabled', 1
reconfigure
GO
-- Avoid having to sign assemblies and worry about other security issues
-- Dont forget to change 'DatabaseName' below.
alter database DatabaseName set trustworthy on
go

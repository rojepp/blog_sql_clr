namespace SqlClr
open System
open System.Data
open System.Data.Sql
open System.Data.SqlTypes
open System.Data.SqlClient
open Microsoft.SqlServer.Server

type SqlClrSample = 
   [<SqlProcedure()>]
   static member Hello (x:string) = 
      SqlContext.Pipe.Send("Hello " + x)

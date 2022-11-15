--Este usuario tiene el rol de solo lectura y solamente puede trabajar
--en la base de datos proyecto2022
CREATE LOGIN [l_aguirre] WITH PASSWORD=N'123'
GO
USE [proyecto2022]
GO
CREATE USER [u_aguirre] FOR LOGIN [l_aguirre]
GO
USE [proyecto2022]
GO
ALTER ROLE [db_datareader] ADD MEMBER [u_aguirre]
GO


--Este usuario tiene el rol de lectura y escritura. Puede consultar y realizar modificaciones a la base de datos 
--en la base de datos proyecto2022
CREATE LOGIN [l_acevedo] WITH PASSWORD=N'123'
GO
USE [proyecto2022]
GO
CREATE USER [u_acevedo] FOR LOGIN [l_acevedo]
GO
USE [proyecto2022]
GO
ALTER ROLE [db_datareader] ADD MEMBER [u_acevedo]
GO
USE [proyecto2022]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [u_acevedo]
GO


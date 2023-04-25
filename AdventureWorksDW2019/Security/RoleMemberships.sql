ALTER ROLE [db_owner] ADD MEMBER [MSSQLServerOLAPService];


GO
ALTER ROLE [db_accessadmin] ADD MEMBER [MSSQLServerOLAPService];


GO
ALTER ROLE [db_securityadmin] ADD MEMBER [MSSQLServerOLAPService];


GO
ALTER ROLE [db_ddladmin] ADD MEMBER [C_connect_user];


GO
ALTER ROLE [db_ddladmin] ADD MEMBER [MSSQLServerOLAPService];


GO
ALTER ROLE [db_backupoperator] ADD MEMBER [MSSQLServerOLAPService];


GO
ALTER ROLE [db_datareader] ADD MEMBER [Cpp_connect];


GO
ALTER ROLE [db_datareader] ADD MEMBER [ruslan];


GO
ALTER ROLE [db_datareader] ADD MEMBER [MSSQLServerOLAPService];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [MSSQLServerOLAPService];


GO
ALTER ROLE [db_denydatareader] ADD MEMBER [MSSQLServerOLAPService];


GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [MSSQLServerOLAPService];


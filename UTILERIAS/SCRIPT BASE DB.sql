CREATE DATABASE UADEO_BASE_DE_DATOS_II
GO

--------------------------------------------------------------------------

-- Nombre de la base de datos
DECLARE @DatabaseName NVARCHAR(128) = 'UADEO_BASE_DE_DATOS_II';

-- Ubicaci�n de los archivos de datos y de registro
DECLARE @DataFilePath NVARCHAR(260) = 'C:\SQLData\'; -- Ajusta la ruta seg�n tu sistema
DECLARE @LogFilePath NVARCHAR(260) = 'D:\SQLLogs\'; -- Ajusta la ruta seg�n tu sistema

-- Tama�o inicial de los archivos (en MB)
DECLARE @DataFileSize INT = 100;
DECLARE @LogFileSize INT = 50;

-- Modelo de recuperaci�n
DECLARE @RecoveryModel NVARCHAR(60) = 'FULL'; -- FULL, BULK_LOGGED, SIMPLE

-- Intercalaci�n
DECLARE @Collation NVARCHAR(128) = 'SQL_Latin1_General_CP1_CI_AS'; -- Ajusta seg�n tus necesidades

-------------------------------------------------------------------------------

-- Crear la base de datos
CREATE DATABASE @DatabaseName
ON PRIMARY (
    NAME = @DatabaseName + '_Data',
    FILENAME = @DataFilePath + @DatabaseName + '_Data.mdf',
    SIZE = @DataFileSize + 'MB',
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 10%
)
LOG ON (
    NAME = @DatabaseName + '_Log',
    FILENAME = @LogFilePath + @DatabaseName + '_Log.ldf',
    SIZE = @LogFileSize + 'MB',
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 10%
)
COLLATE @Collation;

-- Establecer el modelo de recuperaci�n
ALTER DATABASE @DatabaseName
SET RECOVERY @RecoveryModel;

ALTER DATABASE UADEO_BASE_DE_DATOS_II 
SET RECOVERY 'FULL';

-- Mostrar mensaje de �xito
PRINT 'Base de datos "' + @DatabaseName + '" creada con �xito.';


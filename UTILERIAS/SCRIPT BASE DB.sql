CREATE DATABASE UADEO_BASE_DE_DATOS_II
GO

--------------------------------------------------------------------------

-- Nombre de la base de datos
DECLARE @DatabaseName NVARCHAR(128) = 'UADEO_BASE_DE_DATOS_II';

-- Ubicación de los archivos de datos y de registro
DECLARE @DataFilePath NVARCHAR(260) = 'C:\SQLData\'; -- Ajusta la ruta según tu sistema
DECLARE @LogFilePath NVARCHAR(260) = 'D:\SQLLogs\'; -- Ajusta la ruta según tu sistema

-- Tamaño inicial de los archivos (en MB)
DECLARE @DataFileSize INT = 100;
DECLARE @LogFileSize INT = 50;

-- Modelo de recuperación
DECLARE @RecoveryModel NVARCHAR(60) = 'FULL'; -- FULL, BULK_LOGGED, SIMPLE

-- Intercalación
DECLARE @Collation NVARCHAR(128) = 'SQL_Latin1_General_CP1_CI_AS'; -- Ajusta según tus necesidades

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

-- Establecer el modelo de recuperación
ALTER DATABASE @DatabaseName
SET RECOVERY @RecoveryModel;

ALTER DATABASE UADEO_BASE_DE_DATOS_II 
SET RECOVERY 'FULL';

-- Mostrar mensaje de éxito
PRINT 'Base de datos "' + @DatabaseName + '" creada con éxito.';


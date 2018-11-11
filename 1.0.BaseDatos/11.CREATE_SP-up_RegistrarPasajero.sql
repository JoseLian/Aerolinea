/*
 * Motivo	: Registrar datos del Pasajero.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_RegistrarPasajero '20708008', 'Alex Muñoz'
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_RegistrarPasajero
(
  @Dni INT,
  @Nombre VARCHAR(50)
)
AS
SET NOCOUNT ON

INSERT INTO dbo.Pasajero (DniPasajero, NombrePasajero) 
  VALUES (@Dni, @Nombre)

SELECT SCOPE_IDENTITY() AS IdPasajero

SET NOCOUNT OFF
GO
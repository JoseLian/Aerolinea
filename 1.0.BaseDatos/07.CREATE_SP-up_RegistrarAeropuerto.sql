/*
 * Motivo	: Registrar datos del Aeropuerto.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_RegistrarAeropuerto 'Aeropuerto de Bremen', 'Neustadt', 'Alemania'
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_RegistrarAeropuerto
(
  @Nombre VARCHAR(30),
  @Ciudad VARCHAR(30),
  @Pais VARCHAR(30)
)
AS
SET NOCOUNT ON

INSERT INTO dbo.Aeropuerto (NombreAeropuerto, CiudadAeropuerto, PaisAeropuerto, FlagEliminado) 
  VALUES (@Nombre, @Ciudad, @Pais, 0)

SELECT SCOPE_IDENTITY() AS IdAeropuerto

SET NOCOUNT OFF
GO
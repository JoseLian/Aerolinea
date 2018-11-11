/*
 * Motivo	: Obtener todos los Aeropuertos.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_ListarAeropuertos
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_ListarAeropuertos
AS
  SELECT
    A.IdAeropuerto,
	A.NombreAeropuerto+'-'+A.CiudadAeropuerto+'-'+A.PaisAeropuerto AS AeropuertoCiudadPais
  FROM dbo.Aeropuerto A
  WHERE A.FlagEliminado = 0
  ORDER BY AeropuertoCiudadPais ASC
GO
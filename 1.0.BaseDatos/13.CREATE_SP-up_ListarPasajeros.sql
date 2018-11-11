/*
 * Motivo	: Obtener todos los Aeropuertos.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_ListarPasajeros
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_ListarPasajeros
AS
  SELECT
    A.IdPasajero,
	A.NombrePasajero,
	A.DniPasajero
  FROM dbo.Pasajero A
  ORDER BY NombrePasajero ASC
GO
/*
 * Motivo	: Obtener los aviones en estado activo.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_ListarAviones
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_ListarAviones
AS
  SELECT
    A.IdAvion,
	A.ModeloAvion,
	A.FabricanteAvion
  FROM dbo.Avion A
  WHERE A.FlagEliminado = 0
  ORDER BY FabricanteAvion ASC
GO
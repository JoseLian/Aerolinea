/*
 * Motivo	: Ajustes de tablas.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 */

USE Aeropuerto
GO

SET NOCOUNT ON

ALTER TABLE dbo.Avion
  ADD FlagEliminado BIT
GO

ALTER TABLE dbo.Aeropuerto
  ADD FlagEliminado BIT
GO

UPDATE dbo.Avion SET FlagEliminado = 1
GO

UPDATE dbo.Aeropuerto SET FlagEliminado = 1
GO

SET NOCOUNT OFF
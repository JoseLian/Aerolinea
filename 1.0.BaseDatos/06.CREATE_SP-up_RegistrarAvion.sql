/*
 * Motivo	: Registrar datos del Avión.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_RegistrarAvion 'Boeing', '777-200LR', 300
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_RegistrarAvion
(
  @Fabricante VARCHAR(30),
  @Modelo VARCHAR(30),
  @NumeroPasajeros INT
)
AS
SET NOCOUNT ON

INSERT INTO dbo.Avion (FabricanteAvion, ModeloAvion, NumeroPasajerosAvion, FlagEliminado) 
  VALUES (@Fabricante, @Modelo, @NumeroPasajeros, 0)

SELECT SCOPE_IDENTITY() AS IdAvion

SET NOCOUNT OFF
GO
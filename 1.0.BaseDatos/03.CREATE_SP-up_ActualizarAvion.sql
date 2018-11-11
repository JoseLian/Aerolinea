/*
 * Motivo	: Actualizar datos del Avión.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_ActualizarAvion 17, 'Boeing', '777-200LR', 250
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_ActualizarAvion
(
  @IdAvion INT,
  @Fabricante VARCHAR(30),
  @Modelo VARCHAR(30),
  @NumeroPasajeros INT
)
AS
SET NOCOUNT ON

DECLARE @Flag BIT

IF EXISTS (SELECT IdAvion FROM dbo.Avion WHERE IdAvion = @IdAvion)
BEGIN
  UPDATE A 
    SET
	A.FabricanteAvion = @Fabricante,
	A.ModeloAvion = @Modelo,
	A.NumeroPasajerosAvion = @NumeroPasajeros
  FROM dbo.Avion A
  WHERE A.IdAvion = @IdAvion

  SET @Flag = 1
END
ELSE
BEGIN
  SET @Flag = 0
END

SELECT @Flag AS Resultado

SET NOCOUNT OFF
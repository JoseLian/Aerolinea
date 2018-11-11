/*
 * Motivo	: Eliminar Avión. Se hace una eliminación lógica.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_EliminarAvion 17
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_EliminarAvion
(
  @IdAvion INT
)
AS
SET NOCOUNT ON

DECLARE @Flag BIT

IF EXISTS (SELECT IdAvion FROM dbo.Avion WHERE IdAvion = @IdAvion)
BEGIN
  UPDATE A SET A.FlagEliminado = 1 FROM dbo.Avion A WHERE A.IdAvion = @IdAvion
  SET @Flag = 1
END
ELSE
BEGIN
  SET @Flag = 0
END

SELECT @Flag AS Resultado

SET NOCOUNT OFF
GO
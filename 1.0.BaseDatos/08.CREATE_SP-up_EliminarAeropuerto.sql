/*
 * Motivo	: Eliminar Aeropuerto. Se hace una eliminación lógica.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_EliminarAeropuerto 9
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_EliminarAeropuerto
(
  @IdAeropuerto INT
)
AS
SET NOCOUNT ON

DECLARE @Flag BIT

IF EXISTS (SELECT IdAeropuerto FROM dbo.Aeropuerto WHERE IdAeropuerto = @IdAeropuerto)
BEGIN
  UPDATE A SET A.FlagEliminado = 1 FROM dbo.Aeropuerto A WHERE A.IdAeropuerto = @IdAeropuerto
  SET @Flag = 1
END
ELSE
BEGIN
  SET @Flag = 0
END

SELECT @Flag AS Resultado

SET NOCOUNT OFF
GO
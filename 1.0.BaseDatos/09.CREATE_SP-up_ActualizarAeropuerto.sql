/*
 * Motivo	: Actualizar datos de Aeropuerto.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_ActualizarAeropuerto 9, 'Aeropuerto de Bremen', 'Neustadt', 'Alemania'
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_ActualizarAeropuerto
(
  @IdAeropuerto INT,
  @Nombre VARCHAR(30),
  @Ciudad VARCHAR(30),
  @Pais VARCHAR(30)
)
AS
SET NOCOUNT ON

DECLARE @Flag BIT

IF EXISTS (SELECT IdAeropuerto FROM dbo.Aeropuerto WHERE IdAeropuerto = @IdAeropuerto)
BEGIN
  UPDATE A 
    SET
	A.NombreAeropuerto = @Nombre,
	A.CiudadAeropuerto = @Ciudad,
	A.PaisAeropuerto = @Pais
  FROM dbo.Aeropuerto A
  WHERE A.IdAeropuerto = @IdAeropuerto

  SET @Flag = 1
END
ELSE
BEGIN
  SET @Flag = 0
END

SELECT @Flag AS Resultado

SET NOCOUNT OFF
GO
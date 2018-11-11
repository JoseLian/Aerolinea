/*
 * Motivo	: Actualizar datos de Pasajero.
 * Fecha	: 2018-10-11
 * Autor	: JoseLian
 * EXEC up_ActualizarPasajero 31, '20708008', 'Alex Muñoz Cerron'
 */

USE Aeropuerto
GO

CREATE PROCEDURE up_ActualizarPasajero
(
  @IdPasajero INT,
  @Dni VARCHAR(30),
  @Nombre VARCHAR(30)
)
AS
SET NOCOUNT ON

DECLARE @Flag BIT

IF EXISTS (SELECT IdPasajero FROM dbo.Pasajero WHERE IdPasajero = @IdPasajero)
BEGIN
  UPDATE A 
    SET
	A.DniPasajero = @Dni,
	A.NombrePasajero = @Nombre
  FROM dbo.Pasajero A
  WHERE A.IdPasajero = @IdPasajero

  SET @Flag = 1
END
ELSE
BEGIN
  SET @Flag = 0
END

SELECT @Flag AS Resultado

SET NOCOUNT OFF
GO
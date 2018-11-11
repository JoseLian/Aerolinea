USE master
GO

SET NOCOUNT ON

CREATE DATABASE Aeropuerto
ON
( NAME = Aeropuerto_dat,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Aeropuertodat.mdf',
    SIZE = 10,
    MAXSIZE = 100,
    FILEGROWTH = 5
)
LOG ON
( NAME = Aeropuerto_log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Aeropuertolog.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
)
GO 

USE Aeropuerto
GO

CREATE TABLE Aeropuerto(
  IdAeropuerto INT IDENTITY(1,1) NOT NULL,
  NombreAeropuerto VARCHAR(30) NOT NULL,
  CiudadAeropuerto VARCHAR(30) NOT NULL,
  PaisAeropuerto VARCHAR(30) NOT NULL
)

CREATE TABLE Avion(
  IdAvion INT IDENTITY(1,1) NOT NULL,
  FabricanteAvion VARCHAR(30) NOT NULL,
  ModeloAvion VARCHAR(30) NOT NULL,
  NumeroPasajerosAvion INT NOT NULL
)

CREATE TABLE CategoriaTrabajador(
  IdCategoriaTrabajador INT IDENTITY(1,1) NOT NULL,
  DescripcionCategoriaTrabajador VARCHAR(50) NOT NULL
)

CREATE TABLE Pasajero(
  IdPasajero INT IDENTITY(1,1) NOT NULL,
  DniPasajero INT NOT NULL,
  NombrePasajero VARCHAR(50) NOT NULL
)

CREATE TABLE Reservas(
  IdReservas INT IDENTITY(1,1) NOT NULL,
  Fecha DATETIME NULL,
  Monto DECIMAL(18, 2) NULL,
  IdCliente INT NULL
)

CREATE TABLE Rol(
  IdRol INT IDENTITY(1,1) NOT NULL,
  DescripcionRol VARCHAR(30) NULL
)

CREATE TABLE Seguridad(
  CodigoUsuario VARCHAR(20) NULL,
  Clave VARCHAR(20) NULL
)

CREATE TABLE Trabajador(
  IdTrabajador INT IDENTITY(1,1) NOT NULL,
  NombreTrabajador VARCHAR(50) NOT NULL,
  IdCategoriaTrabajador INT NOT NULL
)

CREATE TABLE Usuario(
  CodigoUsuario VARCHAR(20) NOT NULL,
  Nombres VARCHAR(100) NULL,
  Apellidos VARCHAR(100) NULL,
  Correo VARCHAR(100) NULL,
  IdRol INT NULL,
  IdTrabajador int NULL
)

CREATE TABLE Vuelo(
  IdVuelo INT IDENTITY(1,1) NOT NULL,
  IdAeropuertoOrigen INT NULL,
  IdAeropuertoDestino INT NULL,
  IdAvion INT NULL,
  Fecha DATETIME NULL,
  Precio DECIMAL(18, 2) NULL
)

CREATE TABLE Vuelo_Pasajero(
  IdVuelo INT NULL,
  IdPasajero INT NULL,
  NumeroAsiento INT NOT NULL,
  IdReserva INT NOT NULL
)

CREATE TABLE Vuelo_Trabajador(
  IdVuelo INT NULL,
  IdTrabajador INT NULL
)

ALTER TABLE Aeropuerto 
ADD CONSTRAINT PK_Aeropuerto PRIMARY KEY (IdAeropuerto)
GO

ALTER TABLE Avion 
ADD CONSTRAINT PK_Avion PRIMARY KEY (IdAvion)
GO

ALTER TABLE CategoriaTrabajador 
ADD CONSTRAINT PK_CategoriaTrabajador PRIMARY KEY (IdCategoriaTrabajador)
GO

ALTER TABLE Pasajero
ADD CONSTRAINT PK_Pasajero PRIMARY KEY (IdPasajero)
GO

ALTER TABLE Reservas
ADD CONSTRAINT PK_Reservas PRIMARY KEY (IdReservas)
GO

ALTER TABLE Rol
ADD CONSTRAINT PK_Rol PRIMARY KEY (IdRol)
GO

ALTER TABLE Trabajador
ADD CONSTRAINT PK_Trabajador PRIMARY KEY (IdTrabajador)
GO

ALTER TABLE Usuario
ADD CONSTRAINT PK_Usuario PRIMARY KEY (CodigoUsuario)
GO

ALTER TABLE Vuelo
ADD CONSTRAINT PK_Vuelo PRIMARY KEY (IdVuelo)
GO

SET IDENTITY_INSERT dbo.Aeropuerto ON 
INSERT dbo.Aeropuerto (IdAeropuerto, NombreAeropuerto, CiudadAeropuerto, PaisAeropuerto) VALUES (1, N'Jorge Chavez', N'Lima', N'Peru')
INSERT dbo.Aeropuerto (IdAeropuerto, NombreAeropuerto, CiudadAeropuerto, PaisAeropuerto) VALUES (2, N'Barra de Colorado', N'Miami', N'EstadoUnidos')
INSERT dbo.Aeropuerto (IdAeropuerto, NombreAeropuerto, CiudadAeropuerto, PaisAeropuerto) VALUES (3, N'Gustavo Rizo', N'Nueva Baracoa', N'Cuba')
INSERT dbo.Aeropuerto (IdAeropuerto, NombreAeropuerto, CiudadAeropuerto, PaisAeropuerto) VALUES (4, N'Jorge Newbery', N'Buenos Aires', N'Argentina')
INSERT dbo.Aeropuerto (IdAeropuerto, NombreAeropuerto, CiudadAeropuerto, PaisAeropuerto) VALUES (5, N'Viracopos', N'Sao Paulo', N'Brasil')
INSERT dbo.Aeropuerto (IdAeropuerto, NombreAeropuerto, CiudadAeropuerto, PaisAeropuerto) VALUES (6, N'El Prat', N'Barcelona', N'España')
INSERT dbo.Aeropuerto (IdAeropuerto, NombreAeropuerto, CiudadAeropuerto, PaisAeropuerto) VALUES (8, N'El alto', N'El alto', N'Bolivia')
SET IDENTITY_INSERT dbo.Aeropuerto OFF

SET IDENTITY_INSERT dbo.Avion ON 
INSERT dbo.Avion (IdAvion, FabricanteAvion, ModeloAvion, NumeroPasajerosAvion) VALUES (1, N'Orion', N'Orion_777', 168)
INSERT dbo.Avion (IdAvion, FabricanteAvion, ModeloAvion, NumeroPasajerosAvion) VALUES (2, N'El rapido', N'Rapid_AD2', 168)
INSERT dbo.Avion (IdAvion, FabricanteAvion, ModeloAvion, NumeroPasajerosAvion) VALUES (3, N'Metropolitano', N'Met_737', 168)
INSERT dbo.Avion (IdAvion, FabricanteAvion, ModeloAvion, NumeroPasajerosAvion) VALUES (4, N'Orion', N'Orion_9000', 168)
INSERT dbo.Avion (IdAvion, FabricanteAvion, ModeloAvion, NumeroPasajerosAvion) VALUES (5, N'El rapido', N'Rapid_AC3', 168)
INSERT dbo.Avion (IdAvion, FabricanteAvion, ModeloAvion, NumeroPasajerosAvion) VALUES (6, N'Boeing', N'Boo_999', 168)
INSERT dbo.Avion (IdAvion, FabricanteAvion, ModeloAvion, NumeroPasajerosAvion) VALUES (16, N'Karen', N'A1', 100)
SET IDENTITY_INSERT dbo.Avion OFF

SET IDENTITY_INSERT dbo.CategoriaTrabajador ON 
INSERT dbo.CategoriaTrabajador (IdCategoriaTrabajador, DescripcionCategoriaTrabajador) VALUES (1, N'Piloto')
INSERT dbo.CategoriaTrabajador (IdCategoriaTrabajador, DescripcionCategoriaTrabajador) VALUES (2, N'Copiloto')
INSERT dbo.CategoriaTrabajador (IdCategoriaTrabajador, DescripcionCategoriaTrabajador) VALUES (3, N'Aeromoza')
SET IDENTITY_INSERT dbo.CategoriaTrabajador OFF

SET IDENTITY_INSERT dbo.Pasajero ON 
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (1, 71837940, N'Kelly Baldeon Espinoza')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (2, 83717939, N'Nielsen Arevalo Marreros')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (3, 99837940, N'Fernando Alva Alvarado')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (4, 87991102, N'Luis Calderon Chuquilin ')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (5, 9180780, N'Anthony Aguirre Gallegos')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (6, 25556404, N'Benito Juares Perez')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (7, 99856340, N'Francisco Alvarado Torres')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (8, 82591102, N'Luana Garcia Bravo')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (9, 2580780, N'Adrian Velasquez Ramua')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (10, 25646604, N'Cesar Malasquez Diaz')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (11, 25556424, N'Bertha Dias Gamrra')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (12, 83717639, N'Saul Guerra Santos')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (13, 99832540, N'Ana Torres Palacios')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (14, 36464102, N'Jose Gonzales Fernandez')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (15, 9123566, N'Diana Santos Valle')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (16, 25262366, N'Laura Gutierrez Zambrano')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (17, 99786250, N'Cristian Vaca Jara')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (18, 87925325, N'Ernesto Ramos Castro')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (19, 2744235, N'Carlos Zapata Ubierna')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (20, 68972435, N'Javier Quesada Verde')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (21, 35786255, N'Victoria Castillo Rojas')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (22, 25986846, N'Augusto Ramos Villarubio')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (23, 23578046, N'Diego Fernandez Dias')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (24, 8635235, N'Fabiana Guzman Retuerto')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (25, 34790766, N'Matias Rojas Roldan')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (26, 9789325, N'Nicole Ramirez Falcon')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (27, 25769835, N'Ariana Gamarra Yllescas')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (28, 3586897, N'Selena Torres Vizcardo')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (29, 72435785, N'Noelia Garcia Vasquez')
INSERT dbo.Pasajero (IdPasajero, DniPasajero, NombrePasajero) VALUES (30, 27865982, N'Elizabeth Alvarado Quispe')
SET IDENTITY_INSERT dbo.Pasajero OFF

SET IDENTITY_INSERT dbo.reservas ON 
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (1, CAST(N'2018-10-08 19:16:27.663' AS DateTime), CAST(100.00 AS Decimal(18, 2)), 1)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (2, CAST(N'2018-10-08 20:13:43.230' AS DateTime), CAST(300.00 AS Decimal(18, 2)), 3)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (3, CAST(N'2018-10-08 20:13:43.273' AS DateTime), CAST(300.00 AS Decimal(18, 2)), 3)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (4, CAST(N'2018-10-08 20:13:43.277' AS DateTime), CAST(300.00 AS Decimal(18, 2)), 3)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (5, CAST(N'2018-10-08 20:17:36.717' AS DateTime), CAST(200.00 AS Decimal(18, 2)), 3)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (6, CAST(N'2018-10-08 22:39:31.500' AS DateTime), CAST(100.00 AS Decimal(18, 2)), 2)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (7, CAST(N'2018-10-09 00:24:28.193' AS DateTime), CAST(420.00 AS Decimal(18, 2)), 3)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (11, CAST(N'2018-10-09 10:21:02.277' AS DateTime), CAST(320.00 AS Decimal(18, 2)), 5)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (12, CAST(N'2018-10-09 10:39:20.787' AS DateTime), CAST(200.00 AS Decimal(18, 2)), 7)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (15, CAST(N'2018-10-09 10:53:44.090' AS DateTime), CAST(360.00 AS Decimal(18, 2)), 3)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (17, CAST(N'2018-10-09 11:02:33.397' AS DateTime), CAST(200.00 AS Decimal(18, 2)), 28)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (18, CAST(N'2018-10-09 11:44:56.000' AS DateTime), CAST(630.00 AS Decimal(18, 2)), 9)
INSERT dbo.reservas (idReservas, fecha, monto, IdCliente) VALUES (19, CAST(N'2018-10-09 11:51:07.630' AS DateTime), CAST(100.00 AS Decimal(18, 2)), 4)
SET IDENTITY_INSERT dbo.reservas OFF

SET IDENTITY_INSERT dbo.Rol ON 
INSERT dbo.Rol (IdRol, DescripcionRol) VALUES (1, N'Administrador')
INSERT dbo.Rol (IdRol, DescripcionRol) VALUES (2, N'Trabajador')
INSERT dbo.Rol (IdRol, DescripcionRol) VALUES (3, N'Usuario')
SET IDENTITY_INSERT dbo.Rol OFF

INSERT dbo.Seguridad (CodigoUsuario, Clave) VALUES (N'FAlvaA', N'Octubre2018.')
INSERT dbo.Seguridad (CodigoUsuario, Clave) VALUES (N'BAlvaC', N'Agosto2018.')
INSERT dbo.Seguridad (CodigoUsuario, Clave) VALUES (N'GGuevaraF', N'Julio2018.')

SET IDENTITY_INSERT dbo.Trabajador ON 
INSERT dbo.Trabajador (IdTrabajador, NombreTrabajador, IdCategoriaTrabajador) VALUES (1, N'Luis Moran Apaza', 1)
INSERT dbo.Trabajador (IdTrabajador, NombreTrabajador, IdCategoriaTrabajador) VALUES (2, N'Miguel Gutierrez Marcos', 2)
INSERT dbo.Trabajador (IdTrabajador, NombreTrabajador, IdCategoriaTrabajador) VALUES (3, N'Gabriela Guevara Farfan', 3)
INSERT dbo.Trabajador (IdTrabajador, NombreTrabajador, IdCategoriaTrabajador) VALUES (4, N'Estefano Solis Ortiz', 1)
INSERT dbo.Trabajador (IdTrabajador, NombreTrabajador, IdCategoriaTrabajador) VALUES (5, N'Ernesto Torres Alvarez', 2)
INSERT dbo.Trabajador (IdTrabajador, NombreTrabajador, IdCategoriaTrabajador) VALUES (6, N'Silvia Lopez Marquina', 3)
INSERT dbo.Trabajador (IdTrabajador, NombreTrabajador, IdCategoriaTrabajador) VALUES (7, N'Ramon Gonzales Pardo', 1)
SET IDENTITY_INSERT dbo.Trabajador OFF

INSERT dbo.Usuario (CodigoUsuario, Nombres, Apellidos, Correo, IdRol, IdTrabajador) VALUES (N'BAlvaC', N'Bryanna', N'Alva Cabrera', NULL, 3, NULL)
INSERT dbo.Usuario (CodigoUsuario, Nombres, Apellidos, Correo, IdRol, IdTrabajador) VALUES (N'FAlvaA', N'Fernando', N'Alva Alvarado', NULL, 1, NULL)
INSERT dbo.Usuario (CodigoUsuario, Nombres, Apellidos, Correo, IdRol, IdTrabajador) VALUES (N'GGuevaraF', N'Gabriela', N'Guevara Farfan', NULL, 2, 3)

SET IDENTITY_INSERT dbo.Vuelo ON 
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (1, 1, 1, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (2, 2, 3, 5, CAST(N'2018-11-15 00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (3, 3, 2, 3, CAST(N'2018-11-13 00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (4, 4, 1, 3, CAST(N'2018-11-17 00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (5, 5, 3, 5, CAST(N'2018-11-22 00:00:00.000' AS DateTime), CAST(120.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (6, 6, 5, 4, CAST(N'2018-11-26 00:00:00.000' AS DateTime), CAST(120.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (7, 2, 6, 2, CAST(N'2018-11-21 00:00:00.000' AS DateTime), CAST(130.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (8, 4, 3, 1, CAST(N'2018-11-23 00:00:00.000' AS DateTime), CAST(130.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (9, 4, 3, 2, CAST(N'2018-11-11 00:00:00.000' AS DateTime), CAST(140.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (10, 3, 5, 2, CAST(N'2018-11-23 00:00:00.000' AS DateTime), CAST(140.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (11, 2, 5, 6, CAST(N'2018-11-21 00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (12, 1, 1, 3, CAST(N'2018-11-19 00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (13, 2, 4, 3, CAST(N'2018-11-17 00:00:00.000' AS DateTime), CAST(160.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (14, 3, 5, 2, CAST(N'2018-11-19 00:00:00.000' AS DateTime), CAST(160.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (15, 4, 3, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), CAST(170.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (16, 5, 5, 3, CAST(N'2018-11-15 00:00:00.000' AS DateTime), CAST(170.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (17, 6, 6, 1, CAST(N'2018-12-12 00:00:00.000' AS DateTime), CAST(180.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (18, 2, 3, 2, CAST(N'2018-12-01 00:00:00.000' AS DateTime), CAST(180.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (19, 2, 2, 1, CAST(N'2018-12-03 00:00:00.000' AS DateTime), CAST(190.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (20, 3, 5, 3, CAST(N'2018-12-07 00:00:00.000' AS DateTime), CAST(190.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (21, 1, 1, 2, CAST(N'2018-12-12 00:00:00.000' AS DateTime), CAST(200.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (22, 1, 4, 3, CAST(N'2018-12-16 00:00:00.000' AS DateTime), CAST(200.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (23, 1, 3, 2, CAST(N'2018-12-19 00:00:00.000' AS DateTime), CAST(210.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (24, 2, 5, 6, CAST(N'2018-12-16 00:00:00.000' AS DateTime), CAST(210.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (25, 3, 2, 1, CAST(N'2018-12-14 00:00:00.000' AS DateTime), CAST(220.00 AS Decimal(18, 2)))
INSERT dbo.Vuelo (IdVuelo, IdAeropuertoOrigen, IdAeropuertoDestino, IdAvion, Fecha, Precio) VALUES (26, 5, 6, 1, CAST(N'2018-12-28 00:00:00.000' AS DateTime), CAST(220.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT dbo.Vuelo OFF

INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (1, 1, 10, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (1, 2, 15, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (1, 4, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (1, 5, 21, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 11, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 12, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 12, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (3, 7, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (3, 3, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (3, 7, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (4, 1, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (4, 12, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (4, 4, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (4, 3, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (4, 2, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (5, 2, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (5, 15, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (5, 21, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (5, 20, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (6, 24, 3, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (6, 12, 14, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (6, 1, 13, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (6, 15, 25, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (6, 12, 8, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (7, 11, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (7, 24, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (7, 1, 3, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (7, 25, 14, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (7, 14, 13, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (8, 8, 25, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (8, 7, 8, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (8, 24, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (8, 30, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (9, 21, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (9, 12, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (10, 15, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (10, 5, 25, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (10, 18, 8, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (10, 19, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (10, 22, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (11, 10, 3, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (11, 20, 14, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (11, 29, 13, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (12, 29, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (12, 14, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (12, 21, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (12, 30, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (13, 1, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (13, 6, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (13, 7, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (13, 12, 2, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (13, 7, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (14, 3, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (14, 27, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (14, 1, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (14, 12, 2, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (14, 15, 3, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (15, 5, 25, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (15, 6, 8, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (15, 19, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (15, 22, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (16, 10, 3, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (16, 12, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (16, 24, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (16, 30, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (17, 21, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (17, 12, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (17, 15, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (17, 21, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 20, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 12, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 7, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 3, 17, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 27, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 1, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 14, 2, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 15, 3, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (19, 12, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (19, 24, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (19, 30, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (19, 21, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (20, 12, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (20, 7, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (21, 12, 1, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (21, 7, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (21, 3, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (22, 27, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (23, 1, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (23, 14, 13, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (23, 8, 25, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (24, 7, 8, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (24, 24, 5, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (25, 30, 16, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (26, 21, 11, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (26, 12, 20, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 3, 42, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 9, 48, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 5, 33, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 10, 30, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 15, 39, 1)
GO
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 13, 58, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 10, 54, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 6, 45, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 27, 48, 1)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 9, 3, 2)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 3, 2, 3)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 16, 40, 4)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 5, 4, 5)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 4, 5, 5)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 8, 6, 6)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (23, 3, 9, 7)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (23, 28, 10, 7)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (13, 3, 16, 11)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (13, 16, 18, 11)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 3, 9, 12)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 12, 56, 12)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 7, 19, 15)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (18, 9, 28, 15)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 6, 10, 17)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 11, 18, 17)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (23, 1, 33, 18)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (23, 16, 53, 18)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (23, 12, 41, 18)
INSERT dbo.Vuelo_Pasajero (IdVuelo, IdPasajero, NumeroAsiento, IdReserva) VALUES (2, 11, 8, 19)

INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (1, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (1, 2)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (1, 3)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (2, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (2, 5)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (2, 6)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (3, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (3, 2)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (3, 3)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (4, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (4, 5)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (4, 6)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (5, 7)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (5, 2)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (5, 3)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (6, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (6, 2)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (6, 3)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (7, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (7, 2)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (7, 3)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (8, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (8, 2)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (8, 3)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (9, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (9, 5)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (9, 6)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (10, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (10, 5)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (10, 6)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (11, 7)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (11, 2)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (11, 3)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (12, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (12, 2)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (12, 3)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (13, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (13, 2)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (13, 3)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (14, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (14, 5)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (14, 6)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (15, 7)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (15, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (15, 5)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (16, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (16, 5)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (16, 6)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (17, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (17, 5)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (17, 6)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (18, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (18, 5)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (18, 6)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (19, 7)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (20, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (21, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (22, 4)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (23, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (24, 7)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (25, 1)
INSERT dbo.Vuelo_Trabajador (IdVuelo, IdTrabajador) VALUES (26, 7)
GO

ALTER TABLE dbo.Reservas  WITH CHECK 
ADD CONSTRAINT FK_BJBB59F4 FOREIGN KEY(IdCliente) REFERENCES dbo.Pasajero (IdPasajero)
GO

ALTER TABLE dbo.Reservas CHECK CONSTRAINT FK_BJBB59F4
GO

ALTER TABLE dbo.Seguridad  WITH CHECK 
ADD CONSTRAINT FK_5432A368 FOREIGN KEY(CodigoUsuario) REFERENCES dbo.Usuario (CodigoUsuario)
GO

ALTER TABLE dbo.Seguridad CHECK CONSTRAINT FK_5432A368
GO

ALTER TABLE dbo.Trabajador  WITH CHECK 
ADD CONSTRAINT FK_6983FB24 FOREIGN KEY(IdCategoriaTrabajador) REFERENCES dbo.CategoriaTrabajador (IdCategoriaTrabajador)
GO

ALTER TABLE dbo.Trabajador CHECK CONSTRAINT FK_6983FB24
GO

ALTER TABLE dbo.Usuario  WITH CHECK 
ADD CONSTRAINT FK_02AL142F FOREIGN KEY(IdRol) REFERENCES dbo.Rol (IdRol)
GO

ALTER TABLE dbo.Usuario CHECK CONSTRAINT FK_02AL142F
GO

ALTER TABLE dbo.Usuario  WITH CHECK 
ADD CONSTRAINT FK_853225JJ FOREIGN KEY(IdTrabajador) REFERENCES dbo.Trabajador (IdTrabajador)
GO

ALTER TABLE dbo.Usuario CHECK CONSTRAINT FK_853225JJ
GO

ALTER TABLE dbo.Vuelo  WITH CHECK 
ADD CONSTRAINT FK_B4548532 FOREIGN KEY(IdAeropuertoOrigen) REFERENCES dbo.Aeropuerto (IdAeropuerto)
GO

ALTER TABLE dbo.Vuelo CHECK CONSTRAINT FK_B4548532
GO

ALTER TABLE dbo.Vuelo  WITH CHECK 
ADD CONSTRAINT FK_62383909 FOREIGN KEY(IdAeropuertoDestino) REFERENCES dbo.Aeropuerto (IdAeropuerto)
GO

ALTER TABLE dbo.Vuelo CHECK CONSTRAINT FK_62383909
GO

ALTER TABLE dbo.Vuelo  WITH CHECK 
ADD CONSTRAINT FK_46A2J4A2 FOREIGN KEY(IdAvion) REFERENCES dbo.Avion (IdAvion)
GO

ALTER TABLE dbo.Vuelo CHECK CONSTRAINT FK_46A2J4A2
GO

ALTER TABLE dbo.Vuelo_Pasajero  WITH CHECK 
ADD CONSTRAINT FK_54JA4A7A FOREIGN KEY(IdPasajero) REFERENCES dbo.Pasajero (IdPasajero)
GO

ALTER TABLE dbo.Vuelo_Pasajero CHECK CONSTRAINT FK_54JA4A7A
GO

ALTER TABLE dbo.Vuelo_Pasajero  WITH CHECK 
ADD CONSTRAINT FK_B54FA137 FOREIGN KEY(IdVuelo) REFERENCES dbo.Vuelo (IdVuelo)
GO

ALTER TABLE dbo.Vuelo_Pasajero CHECK CONSTRAINT FK_B54FA137
GO

ALTER TABLE dbo.Vuelo_Trabajador  WITH CHECK 
ADD CONSTRAINT FK_A7958J49 FOREIGN KEY(IdTrabajador) REFERENCES dbo.Trabajador (IdTrabajador)
GO

ALTER TABLE dbo.Vuelo_Trabajador CHECK CONSTRAINT FK_A7958J49
GO

ALTER TABLE dbo.Vuelo_Trabajador  WITH CHECK 
ADD CONSTRAINT FK_210A1843 FOREIGN KEY(IdVuelo) REFERENCES dbo.Vuelo (IdVuelo)
GO

ALTER TABLE dbo.Vuelo_Trabajador CHECK CONSTRAINT FK_210A1843
GO

SET NOCOUNT OFF
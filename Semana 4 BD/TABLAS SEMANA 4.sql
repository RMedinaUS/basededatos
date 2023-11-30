CREATE DATABASE SEMANA4
GO
USE SEMANA4
GO

CREATE TABLE [administrador] (
  [id_administrador] int PRIMARY KEY,
  [nombre_administrado] nvarchar(255),
  [app_administrador] nvarchar(255),
  [apm_administrador] nvarchar(255),
  [correo_electronico] nvarchar(255),
  [contrasena] nvarchar(255),
  [fecha_creacion] date
)
GO

CREATE TABLE [vendedor] (
  [id_vendedor] int PRIMARY KEY,
  [nombre_vendedor] nvarchar(255),
  [app_vendedor] nvarchar(255),
  [apm_vendedor] nvarchar(255),
  [correo_electronico] nvarchar(255),
  [contrasena] nvarchar(255),
  [telefono] int,
  [fecha_creacion] date,
  [id_estatus] int
)
GO

CREATE TABLE [producto] (
  [id_producto] int PRIMARY KEY,
  [nombre_producto] nvarchar(255),
  [id_marca] int,
  [modelo] nvarchar(255),
  [stock] int,
  [precio_provedor] int,
  [precio_publico] int,
  [descripcion] nvarchar(255),
  [id_vendedor] int,
  [fecha_creacion] date,
  [id_estatus] int
)
GO

CREATE TABLE [estatus] (
  [id_estatus] int PRIMARY KEY,
  [nombre_estatus] nvarchar(255)
)
GO

CREATE TABLE [marca] (
  [id_marca] int PRIMARY KEY,
  [nombre_marca] nvarchar(255),
  [fecha_creacion] date
)
GO

CREATE TABLE [cliente] (
  [id_cliente] int PRIMARY KEY,
  [nombre_cliente] nvarchar(255),
  [app_cliente] nvarchar(255),
  [apm_cliente] nvarchar(255),
  [correo_electronico] nvarchar(255),
  [contrasena] nvarchar(255),
  [telefono] int,
  [fecha_creacion] date,
  [id_estatus] int
)
GO

CREATE TABLE [ubicacion] (
  [id_ubicacion] int PRIMARY KEY,
  [nombre_contacto] nvarchar(255),
  [numero_contacto] int,
  [region] nvarchar(255),
  [manzana] nvarchar(255),
  [numero_interior] int,
  [numero_exterior] int,
  [codigo_postal] int,
  [calles] nvarchar(255),
  [referencia] nvarchar(255),
  [id_cliente] int
)
GO

CREATE TABLE [ventas] (
  [id_venta] int PRIMARY KEY,
  [id_vendedor] int,
  [id_cliente] int,
  [id_producto] int,
  [cantidad_producto] int,
  [fecha_venta] date
)
GO

ALTER TABLE [cliente] ADD FOREIGN KEY ([id_estatus]) REFERENCES [estatus] ([id_estatus])
GO

ALTER TABLE [producto] ADD FOREIGN KEY ([id_vendedor]) REFERENCES [vendedor] ([id_vendedor])
GO

ALTER TABLE [producto] ADD FOREIGN KEY ([id_estatus]) REFERENCES [estatus] ([id_estatus])
GO

ALTER TABLE [producto] ADD FOREIGN KEY ([id_marca]) REFERENCES [marca] ([id_marca])
GO

ALTER TABLE [ventas] ADD FOREIGN KEY ([id_vendedor]) REFERENCES [vendedor] ([id_vendedor])
GO

ALTER TABLE [ventas] ADD FOREIGN KEY ([id_cliente]) REFERENCES [cliente] ([id_cliente])
GO

ALTER TABLE [ventas] ADD FOREIGN KEY ([id_producto]) REFERENCES [producto] ([id_producto])
GO

ALTER TABLE [cliente] ADD FOREIGN KEY ([id_cliente]) REFERENCES [ubicacion] ([id_cliente])
GO

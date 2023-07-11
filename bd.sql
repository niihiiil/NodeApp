USE [master]
GO
/****** Object:  Database [BDproyectolibreria]    Script Date: 10/7/2023 22:44:42 ******/
CREATE DATABASE [BDproyectolibreria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDproyectolibreria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\BDproyectolibreria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDproyectolibreria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\BDproyectolibreria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDproyectolibreria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDproyectolibreria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDproyectolibreria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDproyectolibreria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDproyectolibreria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDproyectolibreria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDproyectolibreria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET RECOVERY FULL 
GO
ALTER DATABASE [BDproyectolibreria] SET  MULTI_USER 
GO
ALTER DATABASE [BDproyectolibreria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDproyectolibreria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDproyectolibreria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDproyectolibreria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDproyectolibreria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDproyectolibreria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDproyectolibreria', N'ON'
GO
ALTER DATABASE [BDproyectolibreria] SET QUERY_STORE = OFF
GO
USE [BDproyectolibreria]
GO
/****** Object:  Table [dbo].[bodega]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bodega](
	[Id_Bodega] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Direccion] [varchar](350) NULL,
	[Telefono] [int] NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_bodega] PRIMARY KEY CLUSTERED 
(
	[Id_Bodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[Id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Telefono] [int] NULL,
	[Fecha_Ingreso] [smalldatetime] NOT NULL,
	[Nombre_Cliente] [varchar](150) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[Id_Compra] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proveedor] [int] NULL,
	[Fecha_Compra] [varchar](50) NULL,
	[Total] [decimal](10, 2) NULL,
	[Id_Usuario] [int] NULL,
	[Sub_Total] [decimal](10, 2) NULL,
	[IVA] [decimal](10, 2) NULL,
	[Descuento] [decimal](10, 2) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[Id_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[configuracion]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[configuracion](
	[id_libreria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Direccion] [varchar](200) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Estado] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_compra]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_compra](
	[Id_Detalle_Compra] [int] IDENTITY(1,1) NOT NULL,
	[Id_Compra] [int] NULL,
	[Cantidad_Compra] [int] NOT NULL,
	[Precio_Compra] [decimal](10, 2) NOT NULL,
	[Articulo] [varchar](100) NOT NULL,
	[Subtotal_Compra] [decimal](10, 2) NOT NULL,
	[IVA] [decimal](10, 2) NULL,
	[Total_Compra] [decimal](10, 2) NOT NULL,
	[Descuento] [decimal](10, 2) NULL,
 CONSTRAINT [PK_detalle_compra] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[Id_Detalle_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo] [int] NOT NULL,
	[Id_Venta] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Marca] [decimal](10, 2) NOT NULL,
	[IVA] [decimal](10, 2) NOT NULL,
	[Subtotal] [decimal](10, 2) NOT NULL,
	[Total_Venta] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_detalle venta] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimFechas]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimFechas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Fecha] [varchar](50) NULL,
	[Id_Compra] [int] NULL,
	[Id_Venta] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permisos_usuarios]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos_usuarios](
	[Id_Permisos] [int] IDENTITY(1,1) NOT NULL,
	[Id_rol_usuario] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Fecha_registro] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Estado] [bit] NOT NULL,
	[Nombre] [varchar](350) NOT NULL,
	[Id_Categoria] [int] NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_dañado]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_dañado](
	[Id_Articulo_D] [int] IDENTITY(1,1) NOT NULL,
	[Estado_Venta] [bit] NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[Usuario] [int] NULL,
	[fecha_de_baja] [date] NULL,
 CONSTRAINT [PK_Producto_dañado] PRIMARY KEY CLUSTERED 
(
	[Id_Articulo_D] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Dirección] [varchar](100) NULL,
	[Telefono] [varchar](10) NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_proveedor] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol_usuario]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_usuario](
	[Id_Rol_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](10) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_rol_usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Rol_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock_articulos]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_articulos](
	[Id_StockArticulo] [int] IDENTITY(1,1) NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Id_Bodega] [int] NULL,
	[Id_Compra] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Valor_Unitario] [nchar](10) NOT NULL,
	[Precio_Compra] [decimal](10, 2) NOT NULL,
	[Precio_Venta] [int] NOT NULL,
	[Descripcion] [char](250) NOT NULL,
	[Fecha_Ingreso] [date] NULL,
	[Condicion_Prod] [int] NOT NULL,
	[Color] [varchar](50) NULL,
	[IdMarca] [int] NULL,
	[Dimensiones] [varchar](50) NULL,
 CONSTRAINT [PK_articulos] PRIMARY KEY CLUSTERED 
(
	[Id_StockArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Id_Rol_Usuario] [int] NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 10/7/2023 22:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[Id_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Id_Usuario] [int] NULL,
	[Valor_Total] [decimal](10, 2) NOT NULL,
	[Nro_Venta] [int] NOT NULL,
	[Fecha_Venta] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Cliente_Nombre] [varchar](150) NOT NULL,
	[Sub_Total] [decimal](10, 2) NOT NULL,
	[IVA] [decimal](10, 2) NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_venta] PRIMARY KEY CLUSTERED 
(
	[Id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bodega] ON 

INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (1, N'Bod1', N'Hacia aca', 25324323, 1)
INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (2, N'easdasd', N'sdasdasdasdasd', 232323223, 1)
INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (3, N'easdasd', N'sdasdasdasdasd', 232323223, 1)
INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (4, N'easdasd', N'sdasdasdasdasd', 232323223, 1)
INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (5, N'easdasd', N'sdasdasdasdasd', 232323223, 1)
INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (6, N'easdasd', N'sdasdasdasdasd', 232323223, 1)
INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (7, N'easdasd', N'sdasdasdasdasd', 232323223, 1)
INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (8, N'easdasd', N'sdasdasdasdasd', 232323223, 1)
INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (9, N'asas', N'asas', 12131312, 1)
INSERT [dbo].[bodega] ([Id_Bodega], [Nombre], [Direccion], [Telefono], [Estado]) VALUES (10, N'Bod2', N'Aqui', 89654, 0)
SET IDENTITY_INSERT [dbo].[bodega] OFF
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (1, N'Papeleria', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (2, N'Oficina', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (3, N'Manualidades', 0)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (4, N'Escolar', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (5, N'Papel', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (6, N'Lápices', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (7, N'Cuadernos', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (8, N'Marcadores', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (9, N'Gomas de borrar', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (10, N'Reglas', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (11, N'Adhesivos', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (12, N'Plumas', 1)
INSERT [dbo].[categoria] ([Id_Categoria], [Nombre], [Estado]) VALUES (13, N'Resaltadores', 1)
SET IDENTITY_INSERT [dbo].[categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Compra] ON 

INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (9, 2, N'2023-06-01', CAST(100.00 AS Decimal(10, 2)), 1, CAST(90.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (10, 2, N'2023-06-02', CAST(150.00 AS Decimal(10, 2)), 2, CAST(135.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (11, 4, N'2023-06-03', CAST(200.00 AS Decimal(10, 2)), 1, CAST(180.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (12, 2, N'2023-01-01', CAST(100.50 AS Decimal(10, 2)), 1, CAST(90.00 AS Decimal(10, 2)), CAST(10.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (13, 3, N'2023-02-15', CAST(75.25 AS Decimal(10, 2)), 2, CAST(70.00 AS Decimal(10, 2)), CAST(5.25 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (14, 4, N'2023-03-10', CAST(50.75 AS Decimal(10, 2)), 1, CAST(45.00 AS Decimal(10, 2)), CAST(5.75 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (15, 5, N'2023-04-20', CAST(200.00 AS Decimal(10, 2)), 3, CAST(180.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (16, 6, N'2023-05-05', CAST(150.00 AS Decimal(10, 2)), 2, CAST(135.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (17, 7, N'2023-06-30', CAST(120.50 AS Decimal(10, 2)), 1, CAST(110.00 AS Decimal(10, 2)), CAST(10.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (18, 9, N'2023-07-15', CAST(80.75 AS Decimal(10, 2)), 3, CAST(75.00 AS Decimal(10, 2)), CAST(5.75 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (19, 10, N'2023-08-22', CAST(300.00 AS Decimal(10, 2)), 2, CAST(270.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (20, 11, N'2023-09-10', CAST(250.00 AS Decimal(10, 2)), 1, CAST(225.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total], [Id_Usuario], [Sub_Total], [IVA], [Descuento], [Estado]) VALUES (21, 12, N'2023-10-05', CAST(180.25 AS Decimal(10, 2)), 2, CAST(170.00 AS Decimal(10, 2)), CAST(10.25 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[Compra] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_compra] ON 

INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (2, 1, 10, CAST(1.50 AS Decimal(10, 2)), N'Resma de papel', CAST(15.00 AS Decimal(10, 2)), CAST(2.25 AS Decimal(10, 2)), CAST(17.25 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (3, 1, 5, CAST(2.00 AS Decimal(10, 2)), N'Lápices HB', CAST(10.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (4, 2, 8, CAST(1.80 AS Decimal(10, 2)), N'Cuaderno rayado', CAST(14.40 AS Decimal(10, 2)), CAST(2.16 AS Decimal(10, 2)), CAST(16.56 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (5, 2, 4, CAST(2.50 AS Decimal(10, 2)), N'Marcadores de colores', CAST(10.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (6, 3, 2, CAST(1.20 AS Decimal(10, 2)), N'Goma de borrar', CAST(2.40 AS Decimal(10, 2)), CAST(0.36 AS Decimal(10, 2)), CAST(2.76 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (7, 3, 6, CAST(2.20 AS Decimal(10, 2)), N'Regla de plástico', CAST(13.20 AS Decimal(10, 2)), CAST(1.98 AS Decimal(10, 2)), CAST(15.18 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (8, 4, 5, CAST(1.40 AS Decimal(10, 2)), N'Adhesivo en barra', CAST(7.00 AS Decimal(10, 2)), CAST(1.05 AS Decimal(10, 2)), CAST(8.05 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (9, 4, 3, CAST(2.80 AS Decimal(10, 2)), N'Plumas de gel', CAST(8.40 AS Decimal(10, 2)), CAST(1.26 AS Decimal(10, 2)), CAST(9.66 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (10, 5, 4, CAST(1.60 AS Decimal(10, 2)), N'Resaltador amarillo', CAST(6.40 AS Decimal(10, 2)), CAST(0.96 AS Decimal(10, 2)), CAST(7.36 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_compra] ([Id_Detalle_Compra], [Id_Compra], [Cantidad_Compra], [Precio_Compra], [Articulo], [Subtotal_Compra], [IVA], [Total_Compra], [Descuento]) VALUES (11, 5, 5, CAST(2.40 AS Decimal(10, 2)), N'Tijeras de acero', CAST(12.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[detalle_compra] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_venta] ON 

INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (8, 1, 1, 5, CAST(1.50 AS Decimal(10, 2)), CAST(0.15 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), CAST(28.75 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (9, 2, 1, 3, CAST(2.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (10, 3, 2, 2, CAST(1.80 AS Decimal(10, 2)), CAST(0.18 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(14.16 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (11, 4, 2, 4, CAST(2.50 AS Decimal(10, 2)), CAST(0.25 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (12, 5, 3, 1, CAST(1.20 AS Decimal(10, 2)), CAST(0.12 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (13, 6, 3, 6, CAST(2.20 AS Decimal(10, 2)), CAST(0.22 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), CAST(36.96 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (14, 7, 4, 3, CAST(1.40 AS Decimal(10, 2)), CAST(0.14 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)), CAST(20.52 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (15, 8, 4, 2, CAST(2.80 AS Decimal(10, 2)), CAST(0.28 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(20.48 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (16, 9, 5, 5, CAST(1.60 AS Decimal(10, 2)), CAST(0.16 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(23.20 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (17, 10, 5, 4, CAST(2.40 AS Decimal(10, 2)), CAST(0.24 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(19.04 AS Decimal(10, 2)))
INSERT [dbo].[detalle_venta] ([Id_Detalle_Venta], [Id_Articulo], [Id_Venta], [Cantidad], [Marca], [IVA], [Subtotal], [Total_Venta]) VALUES (18, 1, 1, 10, CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[detalle_venta] OFF
GO
SET IDENTITY_INSERT [dbo].[DimFechas] ON 

INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (1, N'Compra', N'2023-01-01', 1, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (2, N'Compra', N'2023-02-15', 2, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (3, N'Compra', N'2023-03-10', 3, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (4, N'Compra', N'2023-04-20', 4, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (5, N'Compra', N'2023-05-05', 5, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (6, N'Compra', N'2023-06-01', 6, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (7, N'Compra', N'2023-06-02', 7, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (8, N'Compra', N'2023-06-03', 8, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (9, N'Compra', N'2023-06-30', 9, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (10, N'Compra', N'2023-07-15', 10, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (11, N'Compra', N'2023-08-22', 11, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (12, N'Compra', N'2023-09-10', 12, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (13, N'Compra', N'2023-10-05', 13, NULL)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (14, N'Venta', N'2023-06-01', NULL, 1)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (15, N'Venta', N'2023-06-01', NULL, 2)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (16, N'Venta', N'2023-06-02', NULL, 3)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (17, N'Venta', N'2023-06-02', NULL, 4)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (18, N'Venta', N'2023-06-03', NULL, 5)
INSERT [dbo].[DimFechas] ([Id], [Tipo], [Fecha], [Id_Compra], [Id_Venta]) VALUES (19, N'Venta', N'2023-06-03', NULL, 6)
SET IDENTITY_INSERT [dbo].[DimFechas] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (1, N'BIC', N'Marca reconocida de artículos de papelería')
INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (2, N'Pilot', N'Marca especializada en plumas y marcadores')
INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (3, N'Faber-Castell', N'Marca líder en lápices y colores')
INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (4, N'Post-it', N'Marca famosa por sus notas adhesivas')
INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (5, N'Staedtler', N'Marca de productos de escritura y dibujo')
INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (6, N'Papermate', N'Marca conocida por sus bolígrafos')
INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (7, N'Tombow', N'Marca japonesa de suministros de arte')
INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (8, N'Crayola', N'Marca icónica de crayones y lápices de colores')
INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (9, N'Sharpie', N'Marca famosa por sus marcadores permanentes')
INSERT [dbo].[Marca] ([IdMarca], [Nombre], [Descripcion]) VALUES (10, N'Scotch', N'Marca de productos adhesivos y de embalaje')
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (1, N'Almohadillas y Tintas', 1, N'Tintas', 4)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (2, N'Cintas Ahdesivas y Doble Contacto', 1, N'Adhesivos', 4)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (3, N'Marcadores y resaltadores', 1, N'Marcadores', 4)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (4, N'Lapiceros y plumas', 1, N'Lapices', 4)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (5, N'Foamys', 1, N'Foamy', 3)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (6, N'Pintura acrílica ', 1, N'Pinturas', 3)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (7, N'Papel bond', 1, N'Papel bond', 1)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (8, N'Cartón delgado', 1, N'Cartulina', 1)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (9, N'Papel crepé', 1, N'Papel crepé', 1)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (20, N'Lápiz de grafito HB', 1, N'Lápiz HB', 2)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (21, N'Cuaderno de espiral tamaño carta', 1, N'Cuaderno tamaño carta', 3)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (22, N'Marcador de colores surtidos', 1, N'Marcadores de colores', 4)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (23, N'Goma de borrar blanca', 1, N'Goma de borrar', 5)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (24, N'Regla de plástico transparente', 1, N'Regla de plástico', 6)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (25, N'Cinta adhesiva transparente', 1, N'Cinta adhesiva', 7)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (26, N'Pluma de tinta azul', 1, N'Pluma azul', 8)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (27, N'Resaltador amarillo', 1, N'Resaltador amarillo', 9)
INSERT [dbo].[producto] ([Id_Producto], [Descripcion], [Estado], [Nombre], [Id_Categoria]) VALUES (28, N'Tijeras de acero inoxidable', 1, N'Tijeras', 10)
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET IDENTITY_INSERT [dbo].[proveedor] ON 

INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (3, N'Lib San Jerónimo', N'Masaya, Ave. Los Leones, Petronic 30 vrs. al Sur, Masaya', N'2522 4752', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (4, N'GonperLibs', N'awqwqsw', N'1800854', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (5, N'testeo1', N'testeo1', N'12345', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (6, N'test123', N'test123', N'123456', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (7, N'1', N'1', N'1', 0)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (9, N'Librería El Sol', N'Calle Principal, Managua, Nicaragua', N'12345678', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (10, N'Papelera La Tinta', N'Avenida Central, León, Nicaragua', N'98765432', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (11, N'Librería Universo', N'Carretera Sur, Masaya, Nicaragua', N'24681357', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (12, N'Papelera El Lápiz', N'Avenida Bolívar, Granada, Nicaragua', N'57439281', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (13, N'Librería El Arte', N'Calle del Arte, Estelí, Nicaragua', N'90876543', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (14, N'Librería El Sol', N'Calle Principal, Managua, Nicaragua', N'12345678', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (15, N'Papelera La Tinta', N'Avenida Central, León, Nicaragua', N'98765432', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (16, N'Librería Universo', N'Carretera Sur, Masaya, Nicaragua', N'24681357', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (17, N'Papelera El Lápiz', N'Avenida Bolívar, Granada, Nicaragua', N'57439281', 1)
INSERT [dbo].[proveedor] ([Id_Proveedor], [Nombre], [Dirección], [Telefono], [Estado]) VALUES (18, N'Librería El Arte', N'Calle del Arte, Estelí, Nicaragua', N'90876543', 1)
SET IDENTITY_INSERT [dbo].[proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([Id_Usuario], [Username], [Id_Rol_Usuario], [Estado]) VALUES (1, N'vendedor', NULL, 1)
INSERT [dbo].[usuario] ([Id_Usuario], [Username], [Id_Rol_Usuario], [Estado]) VALUES (2, N'seller', NULL, 1)
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[venta] ON 

INSERT [dbo].[venta] ([Id_Venta], [Fecha], [Id_Usuario], [Valor_Total], [Nro_Venta], [Fecha_Venta], [Estado], [Cliente_Nombre], [Sub_Total], [IVA], [Total]) VALUES (1, CAST(N'2023-06-01' AS Date), 1, CAST(500.00 AS Decimal(10, 2)), 1, N'2023-06-01', 1, N'Cliente 1', CAST(450.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[venta] ([Id_Venta], [Fecha], [Id_Usuario], [Valor_Total], [Nro_Venta], [Fecha_Venta], [Estado], [Cliente_Nombre], [Sub_Total], [IVA], [Total]) VALUES (2, CAST(N'2023-06-02' AS Date), 2, CAST(700.00 AS Decimal(10, 2)), 2, N'2023-06-02', 1, N'Cliente 2', CAST(630.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[venta] ([Id_Venta], [Fecha], [Id_Usuario], [Valor_Total], [Nro_Venta], [Fecha_Venta], [Estado], [Cliente_Nombre], [Sub_Total], [IVA], [Total]) VALUES (3, CAST(N'2023-06-03' AS Date), 1, CAST(900.00 AS Decimal(10, 2)), 3, N'2023-06-03', 1, N'Cliente 3', CAST(810.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[venta] ([Id_Venta], [Fecha], [Id_Usuario], [Valor_Total], [Nro_Venta], [Fecha_Venta], [Estado], [Cliente_Nombre], [Sub_Total], [IVA], [Total]) VALUES (4, CAST(N'2023-06-01' AS Date), 1, CAST(500.00 AS Decimal(10, 2)), 1, N'2023-06-01', 1, N'Cliente 1', CAST(450.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[venta] ([Id_Venta], [Fecha], [Id_Usuario], [Valor_Total], [Nro_Venta], [Fecha_Venta], [Estado], [Cliente_Nombre], [Sub_Total], [IVA], [Total]) VALUES (5, CAST(N'2023-06-02' AS Date), 2, CAST(700.00 AS Decimal(10, 2)), 2, N'2023-06-02', 1, N'Cliente 2', CAST(630.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[venta] ([Id_Venta], [Fecha], [Id_Usuario], [Valor_Total], [Nro_Venta], [Fecha_Venta], [Estado], [Cliente_Nombre], [Sub_Total], [IVA], [Total]) VALUES (6, CAST(N'2023-06-03' AS Date), 1, CAST(900.00 AS Decimal(10, 2)), 3, N'2023-06-03', 1, N'Cliente 3', CAST(810.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), CAST(900.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[venta] OFF
GO
ALTER TABLE [dbo].[permisos_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_permisos_usuarios_rol_usuario] FOREIGN KEY([Id_rol_usuario])
REFERENCES [dbo].[rol_usuario] ([Id_Rol_Usuario])
GO
ALTER TABLE [dbo].[permisos_usuarios] CHECK CONSTRAINT [FK_permisos_usuarios_rol_usuario]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_categoria] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[categoria] ([Id_Categoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_categoria]
GO
ALTER TABLE [dbo].[Producto_dañado]  WITH CHECK ADD  CONSTRAINT [FK_Producto_dañado_stock_articulos] FOREIGN KEY([Id_Articulo_D])
REFERENCES [dbo].[stock_articulos] ([Id_StockArticulo])
GO
ALTER TABLE [dbo].[Producto_dañado] CHECK CONSTRAINT [FK_Producto_dañado_stock_articulos]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol_usuario] FOREIGN KEY([Id_Rol_Usuario])
REFERENCES [dbo].[rol_usuario] ([Id_Rol_Usuario])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_rol_usuario]
GO
/****** Object:  StoredProcedure [dbo].[ETLFechas]    Script Date: 10/7/2023 22:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ETLFechas]
AS
BEGIN
    -- Crear la tabla DimFechas
    CREATE TABLE DimFechas (
        Id INT IDENTITY(1,1),
        Tipo VARCHAR(50),
        Fecha VARCHAR(50),
        Id_Compra INT,
        Id_Venta INT
    );

    -- Insertar las fechas de Compra en DimFechas
    INSERT INTO DimFechas (Tipo, Fecha, Id_Compra)
    SELECT 'Compra', Fecha_Compra, ROW_NUMBER() OVER (ORDER BY Fecha_Compra)
    FROM [BDproyectolibreria].[dbo].[Compra];

    -- Insertar las fechas de Venta en DimFechas
    INSERT INTO DimFechas (Tipo, Fecha, Id_Venta)
    SELECT 'Venta', Fecha_Venta, ROW_NUMBER() OVER (ORDER BY Fecha_Venta)
    FROM [BDproyectolibreria].[dbo].[venta];
END
GO
USE [master]
GO
ALTER DATABASE [BDproyectolibreria] SET  READ_WRITE 
GO

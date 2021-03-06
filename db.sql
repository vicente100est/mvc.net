USE [master]
GO
/****** Object:  Database [promad]    Script Date: 24/02/2022 08:07:15 p. m. ******/
CREATE DATABASE [promad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'promad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\promad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'promad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\promad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [promad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [promad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [promad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [promad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [promad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [promad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [promad] SET ARITHABORT OFF 
GO
ALTER DATABASE [promad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [promad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [promad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [promad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [promad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [promad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [promad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [promad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [promad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [promad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [promad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [promad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [promad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [promad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [promad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [promad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [promad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [promad] SET RECOVERY FULL 
GO
ALTER DATABASE [promad] SET  MULTI_USER 
GO
ALTER DATABASE [promad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [promad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [promad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [promad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [promad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [promad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'promad', N'ON'
GO
ALTER DATABASE [promad] SET QUERY_STORE = OFF
GO
USE [promad]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 24/02/2022 08:07:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
	[Codigo] [nchar](20) NOT NULL,
	[Descripcion] [nchar](150) NOT NULL,
	[Unidad] [nchar](3) NOT NULL,
	[Costo] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 24/02/2022 08:07:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nchar](20) NOT NULL,
	[Razon_Social] [nchar](150) NOT NULL,
	[RFC] [nchar](13) NOT NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Codigo], [Descripcion], [Unidad], [Costo]) VALUES (1, 1, N'Dev1045             ', N'Aplicación web                                                                                                                                        ', N'1  ', CAST(5400 AS Decimal(18, 0)))
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Codigo], [Descripcion], [Unidad], [Costo]) VALUES (5, 4, N'Dev1046             ', N'App Movil                                                                                                                                             ', N'1  ', CAST(10400 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Id_Proveedor], [Codigo], [Razon_Social], [RFC]) VALUES (1, N'EADV990419HDFSMC06  ', N'VicentC0de                                                                                                                                            ', N'EADV990419DV3')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Codigo], [Razon_Social], [RFC]) VALUES (4, N'EADV990419MDFSMC06  ', N'Vicente Estrada                                                                                                                                       ', N'HERN990105HC3')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_productos_Codigo]    Script Date: 24/02/2022 08:07:16 p. m. ******/
ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [UQ_productos_Codigo] UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_productos_IdProveedor]    Script Date: 24/02/2022 08:07:16 p. m. ******/
ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [UQ_productos_IdProveedor] UNIQUE NONCLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_proveedores_Codigo]    Script Date: 24/02/2022 08:07:16 p. m. ******/
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [UQ_proveedores_Codigo] UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedores] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO
USE [master]
GO
ALTER DATABASE [promad] SET  READ_WRITE 
GO

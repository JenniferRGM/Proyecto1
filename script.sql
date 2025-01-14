USE [master]
GO
/****** Object:  Database [BoletaServicio]    Script Date: 21/10/2024 22:30:26 ******/
CREATE DATABASE [BoletaServicio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BoletaServicio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BoletaServicio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BoletaServicio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BoletaServicio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BoletaServicio] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BoletaServicio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BoletaServicio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BoletaServicio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BoletaServicio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BoletaServicio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BoletaServicio] SET ARITHABORT OFF 
GO
ALTER DATABASE [BoletaServicio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BoletaServicio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BoletaServicio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BoletaServicio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BoletaServicio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BoletaServicio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BoletaServicio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BoletaServicio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BoletaServicio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BoletaServicio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BoletaServicio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BoletaServicio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BoletaServicio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BoletaServicio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BoletaServicio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BoletaServicio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BoletaServicio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BoletaServicio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BoletaServicio] SET  MULTI_USER 
GO
ALTER DATABASE [BoletaServicio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BoletaServicio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BoletaServicio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BoletaServicio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BoletaServicio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BoletaServicio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BoletaServicio] SET QUERY_STORE = ON
GO
ALTER DATABASE [BoletaServicio] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BoletaServicio]
GO
/****** Object:  User [UsuarioSQLServer]    Script Date: 21/10/2024 22:30:26 ******/
CREATE USER [UsuarioSQLServer] FOR LOGIN [UsuarioSQLServer] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Gestor]    Script Date: 21/10/2024 22:30:26 ******/
CREATE USER [Gestor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [UsuarioSQLServer]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UsuarioSQLServer]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [UsuarioSQLServer]
GO
/****** Object:  Table [dbo].[Boletas]    Script Date: 21/10/2024 22:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boletas](
	[BoletaID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NULL,
	[TecnicoID] [int] NULL,
	[FechaApertura] [date] NULL,
	[FechaCierre] [date] NULL,
	[NroIncidencia] [nvarchar](50) NULL,
	[Modelo] [nvarchar](100) NULL,
	[Serie] [nvarchar](100) NULL,
	[MotivoServicio] [nvarchar](255) NULL,
	[CondicionEquipo] [nvarchar](255) NULL,
	[AccionTomada] [nvarchar](255) NULL,
	[MotivoLlamada] [nvarchar](255) NULL,
	[UbicacionFalla] [nvarchar](255) NULL,
	[TipoFalla] [nvarchar](255) NULL,
	[HoraInicialViaje] [time](0) NULL,
	[HoraFinalViaje] [time](0) NULL,
	[HoraInicialTrabajo] [time](0) NULL,
	[HoraFinalTrabajo] [time](0) NULL,
 CONSTRAINT [PK__Boletas__C8AD91B1D8CB3499] PRIMARY KEY CLUSTERED 
(
	[BoletaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckList]    Script Date: 21/10/2024 22:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckList](
	[CheckID] [int] IDENTITY(1,1) NOT NULL,
	[BoletaID] [int] NULL,
	[Item] [nvarchar](255) NULL,
	[Correcto] [bit] NULL,
	[Defectuoso] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CheckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 21/10/2024 22:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Telefono] [nvarchar](15) NULL,
	[Correo] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contometros]    Script Date: 21/10/2024 22:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contometros](
	[ContometroID] [int] IDENTITY(1,1) NOT NULL,
	[BoletaID] [int] NULL,
	[ContometroInicial] [nvarchar](100) NULL,
	[ContometroFinal] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContometroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicionesVoltaje]    Script Date: 21/10/2024 22:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicionesVoltaje](
	[MedicionID] [int] IDENTITY(1,1) NOT NULL,
	[BoletaID] [int] NULL,
	[VN] [nvarchar](50) NULL,
	[NT] [nvarchar](50) NULL,
	[VT] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpcionesServicio]    Script Date: 21/10/2024 22:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpcionesServicio](
	[OpcionID] [int] IDENTITY(1,1) NOT NULL,
	[BoletaID] [int] NULL,
	[ProformarRepuestos] [bit] NULL,
	[FacturarManoObra] [bit] NULL,
	[MaquinaOperativa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OpcionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repuestos]    Script Date: 21/10/2024 22:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repuestos](
	[RepuestoID] [int] IDENTITY(1,1) NOT NULL,
	[BoletaID] [int] NULL,
	[Codigo] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Cantidad] [int] NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RepuestoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tecnicos]    Script Date: 21/10/2024 22:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tecnicos](
	[TecnicoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Correo] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TecnicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Boletas]  WITH CHECK ADD  CONSTRAINT [FK__Boletas__Cliente__3B75D760] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
ALTER TABLE [dbo].[Boletas] CHECK CONSTRAINT [FK__Boletas__Cliente__3B75D760]
GO
ALTER TABLE [dbo].[Boletas]  WITH CHECK ADD  CONSTRAINT [FK__Boletas__Tecnico__3C69FB99] FOREIGN KEY([TecnicoID])
REFERENCES [dbo].[Tecnicos] ([TecnicoID])
GO
ALTER TABLE [dbo].[Boletas] CHECK CONSTRAINT [FK__Boletas__Tecnico__3C69FB99]
GO
ALTER TABLE [dbo].[CheckList]  WITH CHECK ADD  CONSTRAINT [FK__CheckList__Bolet__4AB81AF0] FOREIGN KEY([BoletaID])
REFERENCES [dbo].[Boletas] ([BoletaID])
GO
ALTER TABLE [dbo].[CheckList] CHECK CONSTRAINT [FK__CheckList__Bolet__4AB81AF0]
GO
ALTER TABLE [dbo].[Contometros]  WITH CHECK ADD  CONSTRAINT [FK__Contometr__Bolet__4222D4EF] FOREIGN KEY([BoletaID])
REFERENCES [dbo].[Boletas] ([BoletaID])
GO
ALTER TABLE [dbo].[Contometros] CHECK CONSTRAINT [FK__Contometr__Bolet__4222D4EF]
GO
ALTER TABLE [dbo].[MedicionesVoltaje]  WITH CHECK ADD  CONSTRAINT [FK__Medicione__Bolet__44FF419A] FOREIGN KEY([BoletaID])
REFERENCES [dbo].[Boletas] ([BoletaID])
GO
ALTER TABLE [dbo].[MedicionesVoltaje] CHECK CONSTRAINT [FK__Medicione__Bolet__44FF419A]
GO
ALTER TABLE [dbo].[OpcionesServicio]  WITH CHECK ADD  CONSTRAINT [FK__OpcionesS__Bolet__47DBAE45] FOREIGN KEY([BoletaID])
REFERENCES [dbo].[Boletas] ([BoletaID])
GO
ALTER TABLE [dbo].[OpcionesServicio] CHECK CONSTRAINT [FK__OpcionesS__Bolet__47DBAE45]
GO
ALTER TABLE [dbo].[Repuestos]  WITH CHECK ADD  CONSTRAINT [FK__Repuestos__Bolet__3F466844] FOREIGN KEY([BoletaID])
REFERENCES [dbo].[Boletas] ([BoletaID])
GO
ALTER TABLE [dbo].[Repuestos] CHECK CONSTRAINT [FK__Repuestos__Bolet__3F466844]
GO
USE [master]
GO
ALTER DATABASE [BoletaServicio] SET  READ_WRITE 
GO

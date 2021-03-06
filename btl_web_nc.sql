USE [master]
GO
/****** Object:  Database [web_nang_cao]    Script Date: 4/20/2019 11:46:18 PM ******/
CREATE DATABASE [web_nang_cao]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'web_nang_cao', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\web_nang_cao.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'web_nang_cao_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\web_nang_cao_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [web_nang_cao] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [web_nang_cao].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [web_nang_cao] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [web_nang_cao] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [web_nang_cao] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [web_nang_cao] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [web_nang_cao] SET ARITHABORT OFF 
GO
ALTER DATABASE [web_nang_cao] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [web_nang_cao] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [web_nang_cao] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [web_nang_cao] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [web_nang_cao] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [web_nang_cao] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [web_nang_cao] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [web_nang_cao] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [web_nang_cao] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [web_nang_cao] SET  DISABLE_BROKER 
GO
ALTER DATABASE [web_nang_cao] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [web_nang_cao] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [web_nang_cao] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [web_nang_cao] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [web_nang_cao] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [web_nang_cao] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [web_nang_cao] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [web_nang_cao] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [web_nang_cao] SET  MULTI_USER 
GO
ALTER DATABASE [web_nang_cao] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [web_nang_cao] SET DB_CHAINING OFF 
GO
ALTER DATABASE [web_nang_cao] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [web_nang_cao] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [web_nang_cao] SET DELAYED_DURABILITY = DISABLED 
GO
USE [web_nang_cao]
GO
/****** Object:  Table [dbo].[tblBaibao]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBaibao](
	[PK_iBaivietID] [int] IDENTITY(1,1) NOT NULL,
	[sTieude] [nvarchar](200) NULL,
	[sNoidung] [nvarchar](max) NULL,
	[bDuyet] [bit] NULL,
	[iLanxem] [int] NULL,
	[dNgaydang] [datetime] NULL,
	[iUserDang] [int] NULL,
	[dNgayduyet] [datetime] NULL,
	[iUserDuyet] [int] NULL,
	[bTrangthai] [bit] NULL,
	[iUserDoiTrangthai] [int] NULL,
	[FK_iTheloaiID] [int] NULL,
	[sMota] [nvarchar](max) NULL,
	[urlAnh] [varchar](max) NULL,
 CONSTRAINT [PK_tblBaibao] PRIMARY KEY CLUSTERED 
(
	[PK_iBaivietID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNhomQuyen]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhomQuyen](
	[PK_iNhomquyenID] [int] IDENTITY(1,1) NOT NULL,
	[sTenNhomquyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblNhomQuyen] PRIMARY KEY CLUSTERED 
(
	[PK_iNhomquyenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuyen]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuyen](
	[PK_iQuyenID] [int] IDENTITY(1,1) NOT NULL,
	[sTenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblQuyen] PRIMARY KEY CLUSTERED 
(
	[PK_iQuyenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuyen_NhomQuyen]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuyen_NhomQuyen](
	[FK_iQuyenID] [int] NOT NULL,
	[FK_iNhomquyenID] [int] NOT NULL,
 CONSTRAINT [PK_tblQuyen_NhomQuyen] PRIMARY KEY CLUSTERED 
(
	[FK_iQuyenID] ASC,
	[FK_iNhomquyenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTheloai]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTheloai](
	[PK_iTheloai] [int] IDENTITY(1,1) NOT NULL,
	[sTenTheloai] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblTheloai] PRIMARY KEY CLUSTERED 
(
	[PK_iTheloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[PK_iUserID] [int] IDENTITY(1,1) NOT NULL,
	[sUserName] [varchar](50) NULL,
	[sPass] [varchar](20) NULL,
	[sHoten] [nvarchar](50) NULL,
	[bGioitinh] [bit] NULL,
	[dNgaysinh] [datetime] NULL,
	[bTrangthai] [bit] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[PK_iUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser_Nhomquyen]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser_Nhomquyen](
	[FK_iUserID] [int] NOT NULL,
	[FK_iNhomquyenID] [int] NOT NULL,
 CONSTRAINT [PK_tblUser_Nhomquyen] PRIMARY KEY CLUSTERED 
(
	[FK_iUserID] ASC,
	[FK_iNhomquyenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblBaibao]  WITH CHECK ADD  CONSTRAINT [FK_tblBaibao_tblTheloai] FOREIGN KEY([FK_iTheloaiID])
REFERENCES [dbo].[tblTheloai] ([PK_iTheloai])
GO
ALTER TABLE [dbo].[tblBaibao] CHECK CONSTRAINT [FK_tblBaibao_tblTheloai]
GO
ALTER TABLE [dbo].[tblBaibao]  WITH CHECK ADD  CONSTRAINT [FK_tblBaibao_tblUser] FOREIGN KEY([iUserDang])
REFERENCES [dbo].[tblUser] ([PK_iUserID])
GO
ALTER TABLE [dbo].[tblBaibao] CHECK CONSTRAINT [FK_tblBaibao_tblUser]
GO
ALTER TABLE [dbo].[tblBaibao]  WITH CHECK ADD  CONSTRAINT [FK_tblBaibao_tblUser1] FOREIGN KEY([iUserDuyet])
REFERENCES [dbo].[tblUser] ([PK_iUserID])
GO
ALTER TABLE [dbo].[tblBaibao] CHECK CONSTRAINT [FK_tblBaibao_tblUser1]
GO
ALTER TABLE [dbo].[tblBaibao]  WITH CHECK ADD  CONSTRAINT [FK_tblBaibao_tblUser2] FOREIGN KEY([iUserDoiTrangthai])
REFERENCES [dbo].[tblUser] ([PK_iUserID])
GO
ALTER TABLE [dbo].[tblBaibao] CHECK CONSTRAINT [FK_tblBaibao_tblUser2]
GO
ALTER TABLE [dbo].[tblQuyen_NhomQuyen]  WITH CHECK ADD  CONSTRAINT [FK_tblQuyen_NhomQuyen_tblNhomQuyen] FOREIGN KEY([FK_iNhomquyenID])
REFERENCES [dbo].[tblNhomQuyen] ([PK_iNhomquyenID])
GO
ALTER TABLE [dbo].[tblQuyen_NhomQuyen] CHECK CONSTRAINT [FK_tblQuyen_NhomQuyen_tblNhomQuyen]
GO
ALTER TABLE [dbo].[tblQuyen_NhomQuyen]  WITH CHECK ADD  CONSTRAINT [FK_tblQuyen_NhomQuyen_tblQuyen] FOREIGN KEY([FK_iQuyenID])
REFERENCES [dbo].[tblQuyen] ([PK_iQuyenID])
GO
ALTER TABLE [dbo].[tblQuyen_NhomQuyen] CHECK CONSTRAINT [FK_tblQuyen_NhomQuyen_tblQuyen]
GO
ALTER TABLE [dbo].[tblUser_Nhomquyen]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_Nhomquyen_tblNhomQuyen] FOREIGN KEY([FK_iNhomquyenID])
REFERENCES [dbo].[tblNhomQuyen] ([PK_iNhomquyenID])
GO
ALTER TABLE [dbo].[tblUser_Nhomquyen] CHECK CONSTRAINT [FK_tblUser_Nhomquyen_tblNhomQuyen]
GO
ALTER TABLE [dbo].[tblUser_Nhomquyen]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_Nhomquyen_tblUser] FOREIGN KEY([FK_iUserID])
REFERENCES [dbo].[tblUser] ([PK_iUserID])
GO
ALTER TABLE [dbo].[tblUser_Nhomquyen] CHECK CONSTRAINT [FK_tblUser_Nhomquyen_tblUser]
GO
/****** Object:  StoredProcedure [dbo].[delete_Baibao]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[delete_Baibao]
@ma int
as
update [dbo].[tblBaibao] set [iUserDoiTrangthai] = @ma, [bTrangthai] = 0
GO
/****** Object:  StoredProcedure [dbo].[delete_Users]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[delete_Users]
@ma int
as
update [dbo].[tblUser] set [bTrangthai] = 0 where [PK_iUserID] = @ma
GO
/****** Object:  StoredProcedure [dbo].[duyet_Baibao]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[duyet_Baibao]
@ma int
as
update [dbo].[tblBaibao] set bDuyet = 1 where PK_iBaivietID = @ma

GO
/****** Object:  StoredProcedure [dbo].[insert_Baibao]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insert_Baibao]
@tieude nvarchar(200),
@noidung nvarchar(max),
@ngaydang datetime,
@manguoidang int,
@matl int,
@mota nvarchar(max),
@urlanh varchar(max)
as
insert into tblBaibao values (@tieude,@noidung,0,0,@ngaydang,@manguoidang,null,null,1,null,@matl,@mota,@urlanh)

GO
/****** Object:  StoredProcedure [dbo].[insert_user_nq_onlyRead]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_user_nq_onlyRead]
@ma int
as
insert into [dbo].[tblUser_Nhomquyen] values(@ma,4)
GO
/****** Object:  StoredProcedure [dbo].[insert_Users]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_Users]
@username varchar(50),
@pass varchar(20),
@hoten nvarchar(50),
@gt bit,
@ns datetime
as
insert into [dbo].[tblUser] values (@username,@pass,@hoten,@gt,@ns,1);

GO
/****** Object:  StoredProcedure [dbo].[search_Article]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[search_Article]
@tieude nvarchar(200)
as
select*from [dbo].[tblBaibao] where [sTieude] like N'%'+@tieude+'%'
GO
/****** Object:  StoredProcedure [dbo].[select_Baibao]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[select_Baibao]
@ma int
as
if(@ma=0)
begin
select [PK_iBaivietID],[sTieude],[sNoidung],[bDuyet],[iLanxem],[dNgaydang],[sTenTheloai],[sMota],[urlAnh]
from [dbo].[tblBaibao] inner join [dbo].[tblTheloai] on [FK_iTheloaiID] = [PK_iTheloai]
end
else
begin
select [PK_iBaivietID],[sTieude],[sNoidung],[bDuyet],[iLanxem],[dNgaydang],[sTenTheloai],[sMota],[urlAnh],[sHoten]
from ([dbo].[tblBaibao] inner join [dbo].[tblTheloai] on [FK_iTheloaiID] = [PK_iTheloai])
inner join [dbo].[tblUser] on [iUserDang] = [PK_iUserID]
where [PK_iBaivietID] = @ma
end
GO
/****** Object:  StoredProcedure [dbo].[select_Baibao_by_Theloai]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[select_Baibao_by_Theloai]
@ma int
as
if(@ma=0)
begin
select [PK_iBaivietID],[sTieude],[sNoidung],[bDuyet],[iLanxem],[dNgaydang],[sTenTheloai],[sMota],[urlAnh]
from [dbo].[tblBaibao] inner join [dbo].[tblTheloai] on [FK_iTheloaiID] = [PK_iTheloai]
end
else
begin
select [PK_iBaivietID],[sTieude],[sNoidung],[bDuyet],[iLanxem],[dNgaydang],[FK_iTheloaiID],[sTenTheloai],[sMota],[urlAnh],[sHoten]
from ([dbo].[tblBaibao] inner join [dbo].[tblTheloai] on [FK_iTheloaiID] = [PK_iTheloai])
inner join [dbo].[tblUser] on [iUserDang] = [PK_iUserID]
where [FK_iTheloaiID] = @ma
end
GO
/****** Object:  StoredProcedure [dbo].[select_Baibao_by_user]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[select_Baibao_by_user]
@ma int
as
if(@ma=0)
begin
select [PK_iBaivietID],[sTieude],[sNoidung],[bDuyet],[iLanxem],[dNgaydang],[sTenTheloai],[sMota],[urlAnh]
from [dbo].[tblBaibao] inner join [dbo].[tblTheloai] on [FK_iTheloaiID] = [PK_iTheloai]
end
else
begin
select [PK_iBaivietID],[sTieude],[sNoidung],[bDuyet],[iLanxem],[dNgaydang],[sTenTheloai],[sMota],[urlAnh]
from [dbo].[tblBaibao] inner join [dbo].[tblTheloai] on [FK_iTheloaiID] = [PK_iTheloai]
where [iUserDang] = @ma
end
GO
/****** Object:  StoredProcedure [dbo].[select_Baibao_daduyet]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[select_Baibao_daduyet]
as
select [PK_iBaivietID],[sTieude],[sNoidung],[bDuyet],[iLanxem],[dNgaydang],[FK_iTheloaiID],[sTenTheloai],[sMota],[urlAnh]
from [dbo].[tblBaibao] inner join [dbo].[tblTheloai] on [FK_iTheloaiID] = [PK_iTheloai]
GO
/****** Object:  StoredProcedure [dbo].[select_nhomquyen_by_user]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[select_nhomquyen_by_user]
@ma int
as
if(@ma=0)
begin
select [PK_iNhomquyenID],[sTenNhomquyen] from [dbo].[tblNhomQuyen]
end
else 
begin
select [PK_iNhomquyenID],[sTenNhomquyen] from ([dbo].[tblUser] inner join [dbo].[tblUser_Nhomquyen] on [PK_iUserID] = [FK_iUserID])
inner join [dbo].[tblNhomQuyen] on [FK_iNhomquyenID] = [PK_iNhomquyenID] where [PK_iUserID] = @ma
end
GO
/****** Object:  StoredProcedure [dbo].[select_Theloai_ByPK]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[select_Theloai_ByPK]
@ma int
as
if(@ma=0)
begin
select *from tblTheloai
end
else
begin 
select*from tblTheloai where [PK_iTheloai] = @ma
end
GO
/****** Object:  StoredProcedure [dbo].[select_unq_by_uID]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_unq_by_uID]
@ma int
as
select* from tblUser_Nhomquyen where [FK_iUserID] = @ma
GO
/****** Object:  StoredProcedure [dbo].[select_Users_by_ID]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[select_Users_by_ID]
@ma int
as
if(@ma=0)
begin
select*from tblUser where bTrangthai = 1
end
else
begin
select*from tblUser where PK_iUserID = @ma and bTrangthai = 1
end
GO
/****** Object:  StoredProcedure [dbo].[update_Baibao]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[update_Baibao]
@tieude nvarchar(200),
@noidung nvarchar(max),
@matl int,
@mota nvarchar(max),
@urlanh varchar(max),
@ma int
as
update [dbo].[tblBaibao] set [sTieude] = @tieude, [sNoidung] = @noidung, [FK_iTheloaiID] = @matl,
[sMota] = @mota, [urlAnh] = @urlanh where [PK_iBaivietID] = @ma

GO
/****** Object:  StoredProcedure [dbo].[update_Baibao2]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_Baibao2]
@tieude nvarchar(200),
@noidung nvarchar(max),
@matl int,
@mota nvarchar(max),
@ma int
as
update [dbo].[tblBaibao] set [sTieude] = @tieude, [sNoidung] = @noidung, [FK_iTheloaiID] = @matl,
[sMota] = @mota where [PK_iBaivietID] = @ma

GO
/****** Object:  StoredProcedure [dbo].[update_soluotxem]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_soluotxem]
@ma int
as
update [dbo].[tblBaibao] set [iLanxem] = ([iLanxem]+1) where [PK_iBaivietID] = @ma
GO
/****** Object:  StoredProcedure [dbo].[update_User_nhomquyen]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_User_nhomquyen]
@mauser int,
@manq int,
@manqm int
as
update [dbo].[tblUser_Nhomquyen] set [FK_iNhomquyenID] = @manqm where [FK_iUserID] = @mauser and [FK_iNhomquyenID] = @manq
GO
/****** Object:  StoredProcedure [dbo].[update_Users]    Script Date: 4/20/2019 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[update_Users]
@ma int,
@hoten nvarchar(50),
@gt bit,
@ns datetime
as
update [dbo].[tblUser] set [sHoten] = @hoten,[bGioitinh] = @gt,[dNgaysinh] = @ns where [PK_iUserID] = @ma
GO
USE [master]
GO
ALTER DATABASE [web_nang_cao] SET  READ_WRITE 
GO


USE [master]
GO

WHILE EXISTS(select NULL from sys.databases where name='QLHS')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'QLHS') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [QLHS]
END
GO

/* Collation = SQL_Latin1_General_CP1_CI_AS */
CREATE DATABASE [QLHS]
GO


USE [QLHS]
GO

/****** Object:  Table [dbo].[tblHocSinh]    Script Date: 04/21/18 12:20:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblHocSinh](
	[mahs] [int] NOT NULL,
	[hoten] [nvarchar](50) NOT NULL,
	[gioitinh] [nchar](10) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[lop] [nchar](10) NOT NULL,
	[ngaysinh] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tblHocSinh] PRIMARY KEY CLUSTERED 
(
	[mahs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [QLHS]
GO

INSERT INTO [dbo].[tblHocSinh]
           ([mahs]
           ,[hoten]
           ,[gioitinh]
           ,[diachi]
           ,[lop]
           ,[ngaysinh])
     VALUES
           ('18521001'
           ,N'Nguyễn Nam'
           ,N'Nam'
           ,N'Tp Hồ Chí Minh'
           ,'11A1'           
		   ,convert(datetime,'2/27/2000 00:00:00',101))

GO







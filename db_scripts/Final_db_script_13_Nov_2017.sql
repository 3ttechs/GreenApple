USE [master]
GO
/****** Object:  Database [SC]    Script Date: 11/13/2017 9:32:08 AM ******/
CREATE DATABASE [SC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SC', FILENAME = N'D:\RDSDBDATA\DATA\SC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'SC_log', FILENAME = N'D:\RDSDBDATA\DATA\SC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SC] SET ARITHABORT OFF 
GO
ALTER DATABASE [SC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SC] SET RECOVERY FULL 
GO
ALTER DATABASE [SC] SET  MULTI_USER 
GO
ALTER DATABASE [SC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SC] SET QUERY_STORE = OFF
GO
USE [SC]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SC]
GO
/****** Object:  User [smartclinic]    Script Date: 11/13/2017 9:32:15 AM ******/
CREATE USER [smartclinic] FOR LOGIN [smartclinic] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [smartclinic]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 11/13/2017 9:32:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[AttID] [int] IDENTITY(1,1) NOT NULL,
	[DID] [int] NOT NULL,
	[AttName] [varchar](100) NOT NULL,
	[AttFileName] [varchar](1000) NOT NULL,
	[AttFileType] [varchar](15) NOT NULL,
	[attDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[AttID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnosis](
	[DID] [int] IDENTITY(1,1) NOT NULL,
	[SloID] [int] NOT NULL,
	[Illness] [varchar](300) NOT NULL,
	[DoctorComments] [varchar](2000) NULL,
	[Prescription] [varchar](2000) NULL,
	[DiscussionTemplate] [xml] NULL,
	[PostAction] [varchar](2000) NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[DID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DocID] [int] IDENTITY(1,1) NOT NULL,
	[DocName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[LocName] [varchar](50) NOT NULL,
	[LocAddress] [varchar](1000) NULL,
	[LocPhone1] [varchar](15) NULL,
	[LocPhone2] [varchar](15) NULL,
	[LocEmail] [varchar](50) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatID] [int] IDENTITY(1,1) NOT NULL,
	[UsrID] [int] NOT NULL,
	[PatName] [varchar](50) NOT NULL,
	[PatShortName] [varchar](10) NULL,
	[GuardianName] [varchar](50) NULL,
	[Occupation] [varchar](50) NULL,
	[GuardianOccupation] [varchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Sex] [bit] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SesID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[LocID] [int] NOT NULL,
	[SessionStart] [datetime] NOT NULL,
	[SessionEnd] [datetime] NOT NULL,
	[Recurring] [bit] NOT NULL,
	[MaxSlot] [int] NOT NULL,
	[AvailableSlot] [int] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SloID] [int] IDENTITY(1,1) NOT NULL,
	[SesID] [int] NOT NULL,
	[DocID] [int] NOT NULL,
	[PatID] [int] NOT NULL,
	[SlotNO] [int] NOT NULL,
	[BillNo] [varchar](40) NULL,
	[Amount] [float] NULL,
	[Status] [text] NULL,
 CONSTRAINT [PK_Consultation] PRIMARY KEY CLUSTERED 
(
	[SloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAdmin]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAdmin](
	[UsrID] [int] IDENTITY(1,1) NOT NULL,
	[UsrType] [char](1) NOT NULL,
	[DocID] [int] NOT NULL,
	[usrName] [varchar](50) NOT NULL,
	[UsrPwd] [varchar](20) NOT NULL,
	[UsrAddress] [varchar](1000) NULL,
	[UsrPhone1] [varchar](15) NOT NULL,
	[UsrPhone2] [varchar](15) NOT NULL,
	[UsrEmail] [varchar](50) NULL,
 CONSTRAINT [PK_UserAdmin] PRIMARY KEY CLUSTERED 
(
	[UsrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attachment]  WITH CHECK ADD  CONSTRAINT [FK_Attachment_Diagnosis] FOREIGN KEY([DID])
REFERENCES [dbo].[Diagnosis] ([DID])
GO
ALTER TABLE [dbo].[Attachment] CHECK CONSTRAINT [FK_Attachment_Diagnosis]
GO
ALTER TABLE [dbo].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Slot] FOREIGN KEY([SloID])
REFERENCES [dbo].[Slot] ([SloID])
GO
ALTER TABLE [dbo].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Slot]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_UserAdmin] FOREIGN KEY([UsrID])
REFERENCES [dbo].[UserAdmin] ([UsrID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_UserAdmin]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Doctor] FOREIGN KEY([DocID])
REFERENCES [dbo].[Doctor] ([DocID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Doctor]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Location] FOREIGN KEY([LocID])
REFERENCES [dbo].[Location] ([LocID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Location]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Doctor] FOREIGN KEY([DocID])
REFERENCES [dbo].[Doctor] ([DocID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Doctor]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Patient] FOREIGN KEY([PatID])
REFERENCES [dbo].[Patient] ([PatID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Patient]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Session] FOREIGN KEY([SesID])
REFERENCES [dbo].[Session] ([SesID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Session]
GO
ALTER TABLE [dbo].[UserAdmin]  WITH CHECK ADD  CONSTRAINT [FK_UserAdmin_Doctor] FOREIGN KEY([DocID])
REFERENCES [dbo].[Doctor] ([DocID])
GO
ALTER TABLE [dbo].[UserAdmin] CHECK CONSTRAINT [FK_UserAdmin_Doctor]
GO
/****** Object:  StoredProcedure [dbo].[AddDiagnosis]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDiagnosis]
@SloID int,
@Illness varchar(300),
@DoctorComments varchar(2000),
@Prescription varchar(2000),
@DiscussionTemplate xml = null,
@PostAction varchar(200)

AS
BEGIN

INSERT INTO Diagnosis
(SloID,
Illness,
DoctorComments,
Prescription,
DiscussionTemplate,
PostAction)
values (
@SloID,
@Illness,
@DoctorComments,
@Prescription,
@DiscussionTemplate,
@PostAction
) 

  SELECT SCOPE_IDENTITY() as DID
  RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[AddPatient]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPatient]
	@UsrID int, 
	@PatName varchar(50), 
	@PatShortName varchar(50), 
	@GuardianName varchar(50), 
	@Occupation varchar(100), 
	@GuardianOccupation varchar(100), 
	@DateOfBirth date, 
	@Sex bit
AS
BEGIN
INSERT INTO [Patient]
( UsrID, PatName, PatShortName, GuardianName, Occupation, GuardianOccupation, DateOfBirth, Sex)
VALUES
( @UsrID, @PatName, @PatShortName, @GuardianName, @Occupation, @GuardianOccupation, @DateOfBirth, @Sex)

  SELECT SCOPE_IDENTITY() as PatID
  RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[AddSession]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddSession] 
@DocID int,
@LocID int,
@SessionStart datetime,
@SessionEnd datetime,
@Recurring bit,
@MaxSlot int,
@AvailableSlot int

AS
BEGIN
  INSERT INTO [Session] (DocID, LocID, SessionStart, SessionEnd, Recurring, MaxSlot, AvailableSlot)
    VALUES (@DocID, @LocID, @SessionStart, @SessionEnd, @Recurring, @MaxSlot, @AvailableSlot)

  SELECT SCOPE_IDENTITY() as SesID



  RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[AddSlot]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddSlot]
@SesID int,
@DocID int,
@PatID int,
@SlotNO int,

@BillNo varchar(40),
@Amount float,
@Status varchar(40)

AS
BEGIN


INSERT INTO Slot 
( SesID, DocID, PatID, SlotNO, BillNo, Amount, Status  ) 

VALUES (  @SesID ,@DocID ,@PatID ,@SlotNO ,@BillNo, @Amount, @Status)

  SELECT SCOPE_IDENTITY() as SloID
  RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[AddUserAdmin]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddUserAdmin]
	@UsrType char(1) ='P', 
	@DocID int, 
	@usrName varchar(40), 
	@UsrPwd varchar(10), 
	@UsrAddress varchar(1000), 
	@UsrPhone1 varchar(15), 
	@UsrPhone2 varchar(15),
	@UsrEmail varchar(100)
AS
BEGIN

 
INSERT INTO [UserAdmin]
(UsrType, DocID, usrName, UsrPwd, UsrAddress, UsrPhone1, UsrPhone2, UsrEmail)

VALUES
( @UsrType, @DocID, @usrName, @UsrPwd, @UsrAddress, @UsrPhone1, @UsrPhone2, @UsrEmail)

  SELECT SCOPE_IDENTITY() as UsrID
  RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[CheckUserExists]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckUserExists]
	@UsrName varchar(40),
	@DocID int
as

 
SELECT 
UserAdmin.UsrID,
UserAdmin.UsrType, 
UserAdmin.DocID, 
UserAdmin.usrName, 
UserAdmin.UsrPwd, 
UserAdmin.UsrAddress, 
UserAdmin.UsrPhone1, 
UserAdmin.UsrPhone2, 
UserAdmin.UsrEmail

 FROM 
	UserAdmin with(nolock)

WHERE 
	UserAdmin.UsrName= @UsrName and UserAdmin.DocID= @DocID
GO
/****** Object:  StoredProcedure [dbo].[Dashboard]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Dashboard]

@DocID int
as


SELECT * FROM
(
	SELECT  COUNT(*) As NumPatientsToday
	FROM 
		Slot with(nolock)
		inner join Session with(nolock) on Slot.SesID=Session.SesID
	WHERE 
		Slot.DocID = @DocID and CONVERT(date,Session.SessionStart)= CONVERT(date,GETDATE())
) t1,
(
	SELECT count(*) As NumPatientsBookedToday
	FROM 
		Slot with(nolock)
		inner join Session with(nolock) on Slot.SesID=Session.SesID
	WHERE 
		Slot.DocID = @DocID and CONVERT(date,Session.SessionStart)= CONVERT(date,GETDATE()) and Slot.Status LIKE 'booked'

) t2,
(
	SELECT count(*) As NumPatientsArrivedToday
	FROM 
		Slot with(nolock)
		inner join Session with(nolock) on Slot.SesID=Session.SesID
	WHERE 
		Slot.DocID = @DocID and CONVERT(date,Session.SessionStart)= CONVERT(date,GETDATE()) and Slot.Status LIKE 'arrived'

) t3,
(
	SELECT count(*) As NumPatientsConsultedToday
	FROM 
		Slot with(nolock)
		inner join Session with(nolock) on Slot.SesID=Session.SesID
	WHERE 
		Slot.DocID = @DocID and CONVERT(date,Session.SessionStart)= CONVERT(date,GETDATE()) and Slot.Status LIKE 'consulted'

) t4 ,
(


	SELECT count(*) As NumSessionsToday
	FROM 
		Session with(nolock)
	WHERE 
		Session.DocID = @DocID and CONVERT(date,Session.SessionStart)= CONVERT(date,GETDATE()) 

) t5,

(
	SELECT count(*) As NumSessionsThisMonth
	FROM 
		Session with(nolock)
	WHERE 
		Session.DocID = @DocID and DATEPART(mm,Session.SessionStart)= DATEPART(mm,GETDATE()) 
) t6
GO
/****** Object:  StoredProcedure [dbo].[DeleteDiagnosis]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDiagnosis]
@DID int
as

DELETE Diagnosis
WHERE DID = @DID



GO
/****** Object:  StoredProcedure [dbo].[DeletePatient]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute DeletePatient @PatID
*/

CREATE PROCEDURE [dbo].[DeletePatient]
	@PatID int
as
DELETE FROM [Patient] 
WHERE PatID = @PatID


GO
/****** Object:  StoredProcedure [dbo].[DeleteSession]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute DeleteSession @SesID
*/
create PROCEDURE [dbo].[DeleteSession]
	@SesID int
as

	DELETE FROM 
	Session 
	WHERE 
	SesID=@SesID;


GO
/****** Object:  StoredProcedure [dbo].[DeleteSlot]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteSlot]
@SloID int
as

DELETE 	Slot 
WHERE SloID= @SloID

 



GO
/****** Object:  StoredProcedure [dbo].[DeleteUserAdmin]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUserAdmin]
	@UsrID int
as

 
DELETE  [UserAdmin]
WHERE UsrID = @UsrID


GO
/****** Object:  StoredProcedure [dbo].[GetAllDoctors]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllDoctors]
as
SELECT 
	[Doctor].DocID, 
	[Doctor].DocName
FROM 
	[Doctor]
GO
/****** Object:  StoredProcedure [dbo].[GetAllLocations]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllLocations]
/* @DocID int */
as
SELECT 
	LocID,
	LocName
FROM 
	Location
GO
/****** Object:  StoredProcedure [dbo].[GetAllPatients]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute GetAllPatients 
*/
CREATE PROCEDURE [dbo].[GetAllPatients]
as
SELECT 
	[Patient].PatID, 
	[Patient].UsrID, 
	[Patient].PatName, 
	[Patient].PatShortName 
FROM 
	[Patient]


GO
/****** Object:  StoredProcedure [dbo].[GetDiagnosis]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetDiagnosis]
@SloID int
as

SELECT 
DID,
SloID,
Illness,
DoctorComments,
Prescription,
DiscussionTemplate,
PostAction
FROM Diagnosis 
WHERE 
Diagnosis.SloID= @SloID

 



GO
/****** Object:  StoredProcedure [dbo].[GetDoctor]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDoctor]
@DocID int=0
as
BEGIN

if @DocID=0
	begin
		SELECT Doctor.DocName FROM Doctor with(nolock) 
	end
else
	begin
		SELECT Doctor.DocName FROM Doctor with(nolock) WHERE Doctor.DocID= @DocID
	end
END
GO
/****** Object:  StoredProcedure [dbo].[GetLocation]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocation]
@DocID int = 0 
as

BEGIN
if @DocID=0
	begin
		SELECT LocID, LocName, LocAddress, LocPhone1, LocPhone2, LocEmail FROM Location with(nolock)
	end
else
	begin
		SELECT LocID, LocName, LocAddress, LocPhone1, LocPhone2, LocEmail FROM Location with(nolock) WHERE Location.DocID=@DocID
	end
END
GO
/****** Object:  StoredProcedure [dbo].[GetNextSlotNo]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetNextSlotNo]
	@SesID int
as

 
select 
	[Session].MaxSlot - [Session].AvailableSlot +1 as NextSlot
	from 
	[Session] with(nolock)

WHERE 
	Session.SesID= @SesID 
GO
/****** Object:  StoredProcedure [dbo].[GetPatient]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute GetPatient @PatID
*/

CREATE PROCEDURE [dbo].[GetPatient]
	@PatID int=0
as

BEGIN

if @PatID=0
	begin
		SELECT  
			[UserAdmin].UsrType, 
			[UserAdmin].DocID, 
			[UserAdmin].usrName, 
			[UserAdmin].UsrPwd, 
			[UserAdmin].UsrAddress, 
			[UserAdmin].UsrPhone1, 
			[UserAdmin].UsrPhone2, 
			[UserAdmin].UsrEmail,
			[Patient].PatID, 
			[Patient].UsrID, 
			[Patient].PatName, 
			[Patient].PatShortName, 
			[Patient].GuardianName, 
			[Patient].Occupation, 
			[Patient].GuardianOccupation, 
			[Patient].DateOfBirth, 
			[Patient].Sex
		FROM 
			[Patient] with (nolock)
			inner join [UserAdmin] with (nolock) on [Patient].UsrID=[UserAdmin].UsrID
	end
else
	begin
		SELECT  
			[UserAdmin].UsrType, 
			[UserAdmin].DocID, 
			[UserAdmin].usrName, 
			[UserAdmin].UsrPwd, 
			[UserAdmin].UsrAddress, 
			[UserAdmin].UsrPhone1, 
			[UserAdmin].UsrPhone2, 
			[UserAdmin].UsrEmail,
			[Patient].PatID, 
			[Patient].UsrID, 
			[Patient].PatName, 
			[Patient].PatShortName, 
			[Patient].GuardianName, 
			[Patient].Occupation, 
			[Patient].GuardianOccupation, 
			[Patient].DateOfBirth, 
			[Patient].Sex
		FROM 
			[Patient] with (nolock)
			inner join [UserAdmin] with (nolock) on [Patient].UsrID=[UserAdmin].UsrID
		WHERE  
			[Patient].PatID= @PatID
	end
END




GO
/****** Object:  StoredProcedure [dbo].[GetPatientList]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute [GetPatientList] @DocID
*/

CREATE PROCEDURE [dbo].[GetPatientList]
	@DocID int
as
SELECT  
	[Patient].PatID, 
	[Patient].UsrID, 
	[Patient].PatName, 
	[Patient].PatShortName, 
	[Patient].Sex, 
	[Patient].DateOfBirth, 
	[UserAdmin].UsrAddress, 
	[UserAdmin].UsrPhone1, 
	[UserAdmin].UsrEmail

FROM 
	[Patient] with (nolock)
	inner join [UserAdmin] with (nolock) on [Patient].UsrID=[UserAdmin].UsrID
WHERE  
	[UserAdmin].DocID= @DocID
GO
/****** Object:  StoredProcedure [dbo].[GetPatientSession]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPatientSession]
	@PatID int,
	@DocID int
as

 
SELECT 
Location.LocName,
Session.SessionStart, 
Slot.SloID,
Slot.SlotNO,
Slot.BillNo,
Slot.Amount,
Slot.Status


 FROM 
	Slot with(nolock)
	inner join Session with(nolock) on Slot.SesID=Session.SesID
	inner join Location with(nolock) on Session.LocID=Location.LocID
WHERE 
	Slot.PatID= @PatID AND
	Slot.DocID = @DocID

order by SessionStart


GO
/****** Object:  StoredProcedure [dbo].[GetPatientSlot]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPatientSlot]
	@SesID int,
	@DocID int
as

 
SELECT 
	Patient.PatID,
Patient.UsrID,
Patient.PatName,
Patient.PatShortName,
Patient.GuardianName,
Patient.Occupation,
Patient.GuardianOccupation,
Patient.DateOfBirth,
Patient.Sex,
UserAdmin.UsrType,
UserAdmin.DocID,
UserAdmin.usrName,
UserAdmin.UsrPwd,
UserAdmin.UsrAddress,
UserAdmin.UsrPhone1,
UserAdmin.UsrPhone2,
UserAdmin.UsrEmail,
Slot.SloID,
Slot.SesID,
Slot.DocID,
Slot.PatID,
Slot.SlotNO,
Slot.BillNo,
Slot.Amount,
Slot.Status

 FROM 
	Patient with(nolock)
	inner join UserAdmin with(nolock) on Patient.UsrID=UserAdmin.UsrID
	inner join Slot with(nolock) on Patient.PatID = Slot.PatID
WHERE 
	Slot.SesID= @SesID AND
	Slot.DocID = @DocID




GO
/****** Object:  StoredProcedure [dbo].[GetPatientSlotList]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPatientSlotList]
	@PatID int,
	@DocID int
as

 
SELECT 
Slot.SloID,
Slot.SesID,
Slot.DocID,
Slot.PatID,
Slot.SlotNO,
Slot.BillNo,
Slot.Amount,
Slot.Status,
Session.SessionStart

 FROM 
	Slot with(nolock)
	inner join Session with(nolock) on Slot.SesID=Session.SesID

WHERE 
	Slot.PatID= @PatID AND
	Slot.DocID = @DocID
GO
/****** Object:  StoredProcedure [dbo].[GetSession]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute GetSession @DocID
*/
CREATE PROCEDURE [dbo].[GetSession]
	@DocID int=0
as
BEGIN

if @DocID=0
	begin
		select 
			[Session].SesID, 
			[Session].DocID, 
			[Session].LocID, 
			[Session].SessionStart, 
			[Session].SessionEnd, 
			[Session].Recurring, 
			[Session].MaxSlot, 
			[Session].AvailableSlot,
			[Location].LocName
			from 
			[Session] with(nolock)
			inner join  [Location] with(nolock) on Location.LocID=Session.LocID 

			ORDER BY SessionStart
	end
else
	begin
		select 
			[Session].SesID, 
			[Session].DocID, 
			[Session].LocID, 
			[Session].SessionStart, 
			[Session].SessionEnd, 
			[Session].Recurring, 
			[Session].MaxSlot, 
			[Session].AvailableSlot,
			[Location].LocName
			from 
			[Session] with(nolock)
			inner join  [Location] with(nolock) on Location.LocID=Session.LocID 
			where

			[Session].DocID = @DocID 


			ORDER BY SessionStart
	end
END




GO
/****** Object:  StoredProcedure [dbo].[GetUserAdmin]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetUserAdmin]  
	@UserID int=0
AS
BEGIN

if @UserID=0
	begin
		select DocID,UsrType,UsrEmail,usrName,UsrPwd,UsrAddress,UsrPhone1,UsrPhone2 from UserAdmin 
	end
else
	begin
		select DocID,UsrType,UsrEmail,usrName,UsrPwd,UsrAddress,UsrPhone1,UsrPhone2 from UserAdmin where UsrID=@UserID;
	end
END




GO
/****** Object:  StoredProcedure [dbo].[GetUserPatientList]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetUserPatientList]
	@UsrID int,
	@DocID int
as

 
SELECT 
Patient.PatID,
Patient.UsrID,
Patient.PatName,
Patient.PatShortName,
Patient.GuardianName,
Patient.Occupation,
Patient.GuardianOccupation,
Patient.DateOfBirth,
Patient.Sex

 FROM 
	Patient with(nolock)

WHERE 
	Patient.UsrID= @UsrID 
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login]  
	@usrName varchar(40), 
	@UsrPwd varchar(10),
	@DocID int
AS
BEGIN
/*
if @UserID=0
	begin
		select DocID,UsrType,UsrEmail,usrName,UsrPwd,UsrAddress,UsrPhone1,UsrPhone2 from UserAdmin 
	end
else
	begin
		select DocID,UsrType,UsrEmail,usrName,UsrPwd,UsrAddress,UsrPhone1,UsrPhone2 from UserAdmin where UsrID=@UserID;
	end
*/
select UsrID,DocID,UsrType,UsrEmail,usrName,UsrPwd,UsrAddress,UsrPhone1,UsrPhone2 from UserAdmin where usrName=@usrName AND UsrPwd=@UsrPwd AND DocID=@DocID;
END

GO
/****** Object:  StoredProcedure [dbo].[Login2]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login2]  
	@usrName varchar(40), 
	@UsrPwd varchar(10),
	@UsrType char(1)
AS
BEGIN
/*
if @UserID=0
	begin
		select DocID,UsrType,UsrEmail,usrName,UsrPwd,UsrAddress,UsrPhone1,UsrPhone2 from UserAdmin 
	end
else
	begin
		select DocID,UsrType,UsrEmail,usrName,UsrPwd,UsrAddress,UsrPhone1,UsrPhone2 from UserAdmin where UsrID=@UserID;
	end
*/
select UsrID,DocID,UsrType,UsrEmail,usrName,UsrPwd,UsrAddress,UsrPhone1,UsrPhone2 from UserAdmin where usrName=@usrName AND UsrPwd=@UsrPwd AND usrtype=@UsrType;
END

GO
/****** Object:  StoredProcedure [dbo].[Queue]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Queue]

@DocID int
as

SELECT 
 Slot.SlotNO,
 Patient.PatName As PatientsToday,
 Slot.Status
 FROM 
	Slot with(nolock)
	inner join Session with(nolock) on Slot.SesID=Session.SesID
	inner join Patient with(nolock) on Slot.PatID=Patient.PatID

WHERE 
	Slot.DocID = @DocID
	and CONVERT(date,Session.SessionStart)= CONVERT(date,GETDATE()  ) 
GO
/****** Object:  StoredProcedure [dbo].[SetUserAdmin]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SetUserAdmin]  
	@UsrType varchar(10),
	@DocID int=1,
	@usrName varchar(10),
	@UsrPwd varchar(10),
	@UsrAddress varchar(10),
	@UsrPhone1 varchar(10),
	@UsrPhone2 varchar(10),
	@UsrEmail varchar(10)
AS
BEGIN


	begin
		insert into UserAdmin (UsrType,DocID,usrName,UsrPwd,UsrAddress,UsrPhone1,UsrPhone2,UsrEmail) values
(@UsrType,@DocID,@usrName,@UsrPwd,@UsrAddress,@UsrPhone1,@UsrPhone2,@UsrEmail)	
	end

END




GO
/****** Object:  StoredProcedure [dbo].[UpdateDiagnosis]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDiagnosis]
@SloID int,
@Illness varchar(300),
@DoctorComments varchar(2000),
@Prescription varchar(2000),
@DiscussionTemplate xml = null,
@PostAction varchar(200)
as

update Diagnosis
set Illness =@Illness,
DoctorComments = @DoctorComments,
Prescription = @Prescription,
DiscussionTemplate =@DiscussionTemplate,
PostAction = @PostAction
WHERE SloID =@SloID


GO
/****** Object:  StoredProcedure [dbo].[UpdatePatient]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute UpdatePatient @PatID,  @UsrID, @PatName, @PatShortName, @GuardianName, @Occupation, @GuardianOccupation, @DateOfBirth, @Sex
*/

CREATE PROCEDURE [dbo].[UpdatePatient]
	@PatID int,
	@UsrID int, 
	@PatName varchar(50), 
	@PatShortName varchar(50), 
	@GuardianName varchar(50), 
	@Occupation varchar(100), 
	@GuardianOccupation varchar(100), 
	@DateOfBirth date, 
	@Sex bit
as
UPDATE [Patient]
SET
	UsrID = @UsrID,
	PatName = @PatName,
	PatShortName = @PatShortName,
	GuardianName = @GuardianName,
	Occupation = @Occupation,
	GuardianOccupation = @GuardianOccupation,
	DateOfBirth = @DateOfBirth,
	Sex = @Sex
WHERE 
	PatID= @PatID


GO
/****** Object:  StoredProcedure [dbo].[UpdateSession]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute UpdateSession @SesID
*/
create PROCEDURE [dbo].[UpdateSession]
	@SesID int
as
UPDATE 
	Session 
SET 
	AvailableSlot = AvailableSlot - 1 
WHERE 
	SesID=@SesID;


GO
/****** Object:  StoredProcedure [dbo].[UpdateSessionIncrementCounter]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSessionIncrementCounter]
	@SesID int
as
UPDATE 
	Session 
SET 
	AvailableSlot = AvailableSlot + 1 
WHERE 
	SesID=@SesID;
GO
/****** Object:  StoredProcedure [dbo].[UpdateSlot]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateSlot]
@SloID int,
@SesID int,
@DocID int,
@PatID int,
@SlotNO int,

@BillNo varchar(40),
@Amount float,
@Status varchar(40)
as

UPDATE 
	Slot 
SET  SesID = @SesID,
DocID =@DocID,
PatID = @PatID,
SlotNO = @SlotNO,

BillNo = @BillNo,
Amount = @Amount,
Status = @Status
WHERE SloID= @SloID

 



GO
/****** Object:  StoredProcedure [dbo].[UpdateUserAdmin]    Script Date: 11/13/2017 9:32:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserAdmin]
	@UsrID int,
	@UsrType char(1) ='P', 
	@DocID int, 
	@usrName varchar(40), 
	@UsrPwd varchar(10), 
	@UsrAddress varchar(1000), 
	@UsrPhone1 varchar(15), 
	@UsrPhone2 varchar(15),
	@UsrEmail varchar(100)
as

 
UPDATE  [UserAdmin]
SET UsrType =@UsrType, 
DocID =@DocID, 
usrName = @usrName, 
UsrPwd = @UsrPwd,
UsrAddress = @UsrAddress,
UsrPhone1 = @UsrPhone1,
UsrPhone2 = @UsrPhone2,
UsrEmail = @UsrEmail
WHERE UsrID = @UsrID





GO
USE [master]
GO
ALTER DATABASE [SC] SET  READ_WRITE 
GO

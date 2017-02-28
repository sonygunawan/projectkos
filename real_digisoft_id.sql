USE [digisoftid_db]
GO
ALTER TABLE [dbo].[tblTrKosHarga] DROP CONSTRAINT [FK_tblTrKosHarga_tblTempatKos]
GO
ALTER TABLE [dbo].[tblTrKosHarga] DROP CONSTRAINT [FK_tblTrKosHarga_tblSatuanHarga]
GO
ALTER TABLE [dbo].[tblMembership] DROP CONSTRAINT [FK_tblMembership_tblUser]
GO
ALTER TABLE [dbo].[tblFormKos] DROP CONSTRAINT [DF_tblFormKos_JmlFavorit]
GO
ALTER TABLE [dbo].[tblFormKos] DROP CONSTRAINT [DF_tblFormKos_JmlView]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblUser]
GO
/****** Object:  Table [dbo].[tblTrKosHarga]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblTrKosHarga]
GO
/****** Object:  Table [dbo].[tblTrFormKosLingkungan]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblTrFormKosLingkungan]
GO
/****** Object:  Table [dbo].[tblTrFormKosHarga]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblTrFormKosHarga]
GO
/****** Object:  Table [dbo].[tblTrFormKosFasilitas]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblTrFormKosFasilitas]
GO
/****** Object:  Table [dbo].[tblTrFasilitas]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblTrFasilitas]
GO
/****** Object:  Table [dbo].[tblTempatKos]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblTempatKos]
GO
/****** Object:  Table [dbo].[tblSatuanHarga]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblSatuanHarga]
GO
/****** Object:  Table [dbo].[tblMsTipeUser]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblMsTipeUser]
GO
/****** Object:  Table [dbo].[tblMsTipeKos]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblMsTipeKos]
GO
/****** Object:  Table [dbo].[tblMsPaymentBulan]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblMsPaymentBulan]
GO
/****** Object:  Table [dbo].[tblMsLingkungan]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblMsLingkungan]
GO
/****** Object:  Table [dbo].[tblMsFasilitas]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblMsFasilitas]
GO
/****** Object:  Table [dbo].[tblMembership]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblMembership]
GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblImage]
GO
/****** Object:  Table [dbo].[tblFormKos]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblFormKos]
GO
/****** Object:  Table [dbo].[tblBanner]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblBanner]
GO
/****** Object:  Table [dbo].[tblArea]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP TABLE [dbo].[tblArea]
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosLingkungan]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_InsertFormKosLingkungan]
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosHarga]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_InsertFormKosHarga]
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosFasilitas]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_InsertFormKosFasilitas]
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKos]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_InsertFormKos]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetMaxFormKos]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetMaxFormKos]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosLingkunganOnlyByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetKosLingkunganOnlyByFormID]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosLingkunganByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetKosLingkunganByFormID]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosHargaByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetKosHargaByFormID]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosFasilitasOnlyByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetKosFasilitasOnlyByFormID]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosFasilitasByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetKosFasilitasByFormID]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllTipeKos]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetAllTipeKos]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllPaymentBulan]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetAllPaymentBulan]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllLingkungan]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetAllLingkungan]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKosByLocation]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetAllFormKosByLocation]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKos]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetAllFormKos]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFasilitas]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetAllFasilitas]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllBanner]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetAllBanner]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllArea]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_GetAllArea]
GO
/****** Object:  StoredProcedure [dbo].[LIK_DoSignIn]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_DoSignIn]
GO
/****** Object:  StoredProcedure [dbo].[LIK_DoRegister]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[LIK_DoRegister]
GO
/****** Object:  StoredProcedure [dbo].[JPDP_User_Update]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[JPDP_User_Update]
GO
/****** Object:  StoredProcedure [dbo].[JPDP_User_GetAll]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[JPDP_User_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[JPDP_User_Delete]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[JPDP_User_Delete]
GO
/****** Object:  StoredProcedure [dbo].[JPDP_User_Add]    Script Date: 2/27/2017 7:38:59 AM ******/
DROP PROCEDURE [dbo].[JPDP_User_Add]
GO
/****** Object:  StoredProcedure [dbo].[JPDP_User_Add]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[JPDP_User_Add] 	
@Username varchar(500),
@Password varchar(500),
@Name varchar(500),
@Email varchar(500),
@Phone varchar(500),
@AuditUsername varchar(50)
AS
BEGIN
	INSERT INTO MsUser (Username,Password,Name,Email,Phone,AuditUsername,AuditActivity,AuditTime)
	VALUES(@Username,@Password,@Name,@Email,@Phone,@AuditUsername,'I',GETDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[JPDP_User_Delete]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 
-- Description: 
-- =============================================
--JPDP_User_Delete 
CREATE PROCEDURE [dbo].[JPDP_User_Delete] 	
@Username varchar(500),
@AuditUsername varchar(50)
AS
BEGIN
	UPDATE MsUser SET AuditActivity='D', AuditTime=GETDATE(), AuditUsername = @AuditUsername
		WHERE Username = @Username
END

GO
/****** Object:  StoredProcedure [dbo].[JPDP_User_GetAll]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		 
-- Create date: 
-- Description: 
-- =============================================
--JPDP_User_GetAll 'useremail'
CREATE PROCEDURE [dbo].[JPDP_User_GetAll] 	
@Username varchar(500)
AS
BEGIN
IF @Username = ''
BEGIN
	SELECT Username,Password,Name,Email,Phone,AuditUsername 
		FROM MsUser
		WHERE AuditActivity<>'D'
END
ELSE
BEGIN
	SELECT Username,Password,Name,Email,Phone,AuditUsername
		FROM MsUser
	WHERE Username like '%'+ @Username +'%' And AuditActivity<>'D'
END
END

GO
/****** Object:  StoredProcedure [dbo].[JPDP_User_Update]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JPDP_User_Update] 	
@Username varchar(500),
@Password varchar(500),
@Name varchar(500),
@Email varchar(500),
@Phone varchar(500),
@AuditUsername varchar(50)
AS
BEGIN
	UPDATE MsUser SET Password = @Password, Name = @Name, Email = @Email, Phone = @Phone,
	 AuditTime=GETDATE(),AuditUsername = @AuditUsername, AuditActivity = 'U'
		WHERE Username = @Username
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_DoRegister]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_DoRegister] 
(                
	@UserName varchar(50),
	@Email varchar(500),
	@Password varchar(128)
)  
AS
BEGIN
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblUser( UserName,LastActivityDate)
	VALUES( @UserName,GETDATE())

	DECLARE @UserID bigint
	SELECT @UserID = ID FROM tblUser WITH (NOLOCK) 
		WHERE UserName = @UserName

	DECLARE @IsApproved bit
    SET @IsApproved = 1

	DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0
	
	DECLARE @CreateDate datetime
	SET @CreateDate = GETDATE()
	
    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
	
    DECLARE @LastPasswordChangedDate  datetime
    SET @LastPasswordChangedDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

	INSERT INTO tblMembership 
		( UserID,
	      Email,
		  Password,
		  PasswordFormat,
		  PasswordSalt,
		  TipeUser,
		  Aktif,
		  IsApproved,
		  IsLockedout,
		  CreateDate,
		  LastLoginDate,
		  LastPasswordChangedDate,
		  LastChangeAktifDate,
		  LastLockedoutDate,
		  FailedPasswordAttemptCount )
	VALUES ( @UserID,
		     @Email,
			 @Password,
			 1,
			 '1',
			 2,
			 1,
			 @IsApproved,
			 @IsLockedOut,
			 @CreateDate,
			 @CreateDate,
			 @LastPasswordChangedDate,
			 @CreateDate,
			 @LastLockoutDate,
			 @FailedPasswordAttemptCount )

	--COMMIT TRAN
	--commit transaction
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_DoSignIn]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_DoSignIn] --'adminsystem@lihatkos.com','abcde!!12345'
(                
	@Email varchar(500),
	@Password varchar(128)
)  
AS
BEGIN
	
	SELECT B.ID, A.Email, B.UserName, A.Password, B.LastActivityDate FROM tblMembership A WITH (NOLOCK)
		LEFT JOIN tblUser B WITH (NOLOCK)
		 ON A.UserID = B.ID
	WHERE LOWER(Email) = LOWER(@Email) AND Password = @Password
		AND A.Aktif = 1 AND A.IsApproved = 1 AND A.IsLockedout = 0
		AND FailedPasswordAttemptCount <= 5

END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllArea]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllArea] 	
AS
BEGIN
	SELECT ID,Kode,Nama,Deskripsi
		FROM tblArea
		ORDER BY Kode
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllBanner]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllBanner] 	
AS
BEGIN
	SELECT FilePath 
		FROM tblBanner
		ORDER BY Prioritas
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFasilitas]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllFasilitas] 	
AS
BEGIN
	SELECT ID, Kode, NamaFasilitas
		FROM tblMsFasilitas
		ORDER BY ID		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKos]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_GetAllFormKos '10'
CREATE PROCEDURE [dbo].[LIK_GetAllFormKos] 	
--Ini ambil semua FormKos termasuk yg belum approve
(
	@ID BIGINT = 0
)
AS
BEGIN

	SELECT A.ID, A.Kode, A.Nama, A.Deskripsi, A.ImageID, A.Alamat, A.AreaID, d.Nama AS NamaArea, A.Altitude, A.Longitude, A.NamaPemilik, A.AlamatPemilik, A.KontakPemilik,
	A.NamaPengelola, A.AlamatPengelola, A.KontakPengelola, A.MinimumBayarMonth, A.MinimumBayarDesc, A.JmlKamar, A.LuasKamar , A.TipeKosID, E.Nama AS NamaTipeKos, A.JmlKamarKosong, A.PetID,
	A.Keterangan, A.UserID,
	B.Harga, C.Nama AS SatuanHarga,
	A.Status, A.AuditTime, A.JmlView, A.JmlFavorit
	FROM tblFormKos A 
	LEFT JOIN tblTrFormKosHarga B
		ON A.ID = B.FormKosID AND B.SatuanHargaID = 3
	LEFT JOIN tblArea D ON a.AreaID = D.ID
	LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID
	LEFT JOIN tblMsTipeKos E ON A.TipeKosID = E.ID
	WHERE A.ID = (CASE WHEN @ID = 0 THEN A.ID ELSE @ID END)
END



GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKosByLocation]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_GetAllFormKosByLocation   -6.302251, 106.5940051
CREATE PROCEDURE [dbo].[LIK_GetAllFormKosByLocation] 
-- Harus sudah approve semua	
(                
	@Latitude decimal(9,6),
	@Longitude decimal(9,6)
)  
AS
BEGIN
	DECLARE @h geography;
	SET @h = geography::STGeomFromText('POINT(-'+ CAST(@Longitude AS VARCHAR) +' '+ CAST(@Latitude AS VARCHAR)+')', 4326);  

	SELECT A.ID, A.Kode, A.Nama, A.ImageID, A.Alamat, B.Harga, C.Nama AS SatuanHarga, A.Altitude, A.Longitude, @h.STDistance(geography::STGeomFromText('POINT(-' + CAST(A.Longitude AS VARCHAR) + ' '+ CAST(A.Altitude AS VARCHAR) + ')', 4326)) AS Distance
	FROM tblFormKos A 
	LEFT JOIN tblTrFormKosHarga B
		ON A.ID = B.FormKosID AND B.SatuanHargaID = 3
	LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID
	WHERE A.Status = 1 AND
		  @h.STDistance(geography::STGeomFromText('POINT(-' + CAST(A.Longitude AS VARCHAR) + ' '+ CAST(A.Altitude AS VARCHAR) + ')', 4326))
		  < 5000 -- radius 5km

END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllLingkungan]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllLingkungan] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsLingkungan
		ORDER BY ID		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllPaymentBulan]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllPaymentBulan] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsPaymentBulan
		ORDER BY ID		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllTipeKos]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllTipeKos] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsTipeKos
		ORDER BY ID		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosFasilitasByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetKosFasilitasByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	SELECT B.FormKosID, B.FormKosFasilitasID, A.Kode, A.NamaFasilitas, ISNULL(B.Status,0) Status  FROM tblMsFasilitas A 
	LEFT JOIN tblTrFormKosFasilitas B ON A.ID = B.FormKosFasilitasID 
	WHERE B.FormKosID = (CASE WHEN @FormID = 0 THEN B.FormKosID ELSE @FormID END)
	
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosFasilitasOnlyByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetKosFasilitasOnlyByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	--SELECT B.FormKosID, B.FormKosFasilitasID, A.Kode, A.NamaFasilitas, ISNULL(B.Status,0) Status  FROM tblMsFasilitas A 
	--LEFT JOIN tblTrFormKosFasilitas B ON A.ID = B.FormKosFasilitasID 
	--WHERE B.FormKosID = (CASE WHEN @FormID = 0 THEN B.FormKosID ELSE @FormID END)
	SELECT A.FormKosID, A.FormKosFasilitasID, B.Kode, B.NamaFasilitas, ISNULL(A.Status,0) Status FROM tblTrFormKosFasilitas A 
	LEFT JOIN tblMsFasilitas B ON A.FormKosFasilitasID = B.ID
	WHERE A.FormKosID = (CASE WHEN @FormID = 0 THEN A.FormKosID ELSE @FormID END)
	AND A.Status = 1
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosHargaByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetKosHargaByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	SELECT FormKosID, SatuanHargaID, Harga, Deskripsi
	FROM tblTrFormKosHarga A
	WHERE A.FormKosID = (CASE WHEN @FormID = 0 THEN A.FormKosID ELSE @FormID END)
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosLingkunganByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LIK_GetKosLingkunganByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	SELECT B.FormKosID, B.FormKosLingkunganID, A.Kode, A.Nama AS NamaLingkungan, ISNULL(B.Status,0) Status  FROM tblMsLingkungan A 
	LEFT JOIN tblTrFormKosLingkungan B ON A.ID = B.FormKosLingkunganID 
	WHERE B.FormKosID = (CASE WHEN @FormID = 0 THEN B.FormKosID ELSE @FormID END)
	
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosLingkunganOnlyByFormID]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LIK_GetKosLingkunganOnlyByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	--SELECT B.FormKosID, B.FormKosLingkunganID, A.Kode, A.Nama AS NamaLingkungan, ISNULL(B.Status,0) Status  FROM tblMsLingkungan A 
	--LEFT JOIN tblTrFormKosLingkungan B ON A.ID = B.FormKosLingkunganID 
	--WHERE B.FormKosID = (CASE WHEN @FormID = 0 THEN B.FormKosID ELSE @FormID END)
	SELECT A.FormKosID, A.FormKosLingkunganID, B.Kode, B.Nama AS NamaLingkungan, ISNULL(A.Status,0) Status FROM tblTrFormKosLingkungan A 
	LEFT JOIN tblMsLingkungan B ON A.FormKosLingkunganID = B.ID
	WHERE A.FormKosID = (CASE WHEN @FormID = 0 THEN A.FormKosID ELSE @FormID END)
	AND A.Status = 1
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetMaxFormKos]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetMaxFormKos] 	
AS
BEGIN
	DECLARE @prefix varchar(10)
	SET @prefix = 'FK-'
	IF ((SELECT Max(Kode)
		FROM tblFormKos) IS NOT NULL)
	BEGIN
		DECLARE @maxCode bigint
		SET @maxCode = (SELECT CONVERT(bigint, RIGHT(MAX(KODE),7)) FROM tblFormKos)
		SELECT @prefix+ right('0000000'+convert(varchar(7), @maxCode + 1), 7) as Kode
		
	END
	ELSE
	BEGIN
		SELECT @prefix+ right('0000000'+convert(varchar(7), 1), 7) as Kode
		--SELECT @prefix + '0000001'
	END
		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKos]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_InsertFormKos] 
(                
	@Kode varchar(50),
	@Nama varchar(250),
	@Deskripsi text,
	@Alamat text,
	@AreaID int,
	@Altitude decimal(9,6),
	@Longitude decimal(9,6),
	@ImageID bigint, --input dulu
	@NamaPemilik varchar(250),
	@AlamatPemilik text,
	@KontakPemilik varchar(50),
	@NamaPengelola varchar(250),
	@AlamatPengelola text,
	@KontakPengelola varchar(50),
	@MinimumBayarMonth int,
	@MinimumBayarDesc text,
	@JmlKamar int,
	@LuasKamar decimal(9,4),
	@TipeKosID int,
	@JmlKamarKosong int,
	@PetID bit,
	--@FormKosFasilitasID int,
	--@FormKosLingkunganID int,
	@Keterangan text,
	@UserID bigint
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblFormKos 
		( Kode,
		  Nama,
		  Deskripsi,
		  Alamat,
		  AreaID,
		  Altitude,
		  Longitude,
		  ImageID,
		  NamaPemilik,
		  AlamatPemilik,
		  KontakPemilik,
		  NamaPengelola,
		  AlamatPengelola,
		  KontakPengelola,
		  MinimumBayarMonth,
		  MinimumBayarDesc,
		  JmlKamar,
		  LuasKamar,
		  TipeKosID,
		  JmlKamarKosong,
		  PetID,
		  --FormKosFasilitasID,
		  --FormKosLingkunganID,
		  Keterangan,
		  UserID,
		  Status,
		  AuditTime,
		  JmlView,
		  JmlFavorit )
	VALUES ( @Kode,
			 @Nama,
			 @Deskripsi,
			 @Alamat,
			 @AreaID,
			 @Altitude,
			 @Longitude,
			 @ImageID,
			 @NamaPemilik,
			 @AlamatPemilik,
			 @KontakPemilik,
			 @NamaPengelola,
			 @AlamatPengelola,
			 @KontakPengelola,
			 @MinimumBayarMonth,
			 @MinimumBayarDesc,
			 @JmlKamar,
			 @LuasKamar,
			 @TipeKosID,
			 @JmlKamarKosong,
			 @PetID,
			 --@FormKosFasilitasID,
			 --@FormKosLingkunganID,
			 @Keterangan,
			 @UserID,
			 0, --Status
			 getdate(), --AuditTime
			 0, --JmlView
			 0 -- JmlFavorit
			 )
	 Declare @ID int                                    
	 SET @ID = (SELECT ID FROM tblFormKos WHERE Kode = @Kode ) 

	 RETURN @ID
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosFasilitas]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_InsertFormKosFasilitas] 
(   
	@FormKosID bigint,
	@FormKosFasilitasID int,
	@Status int
)  
AS
BEGIN
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblTrFormKosFasilitas 
		( FormKosID,
		  FormKosFasilitasID,
		  Status )
	VALUES ( @FormKosID,
			 @FormKosFasilitasID,
			 @Status ) 
			
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosHarga]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_InsertFormKosHarga 7,4,12000000,''
CREATE PROCEDURE [dbo].[LIK_InsertFormKosHarga] 
(   
	@FormKosID bigint,
	@SatuanHargaID int,
	@Harga decimal,
	@Deskripsi text
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblTrFormKosHarga 
		( FormKosID,
		  SatuanHargaID,
		  Harga,
		  Deskripsi )
	VALUES ( @FormKosID,
			 @SatuanHargaID,
			 @Harga,
			 @Deskripsi ) 
			
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosLingkungan]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_InsertFormKosLingkungan] 
(   
	@FormKosID bigint,
	@FormKosLingkunganID int,
	@Status int
)  
AS
BEGIN
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblTrFormKosLingkungan 
		( FormKosID,
		  FormKosLingkunganID,
		  Status )
	VALUES ( @FormKosID,
			 @FormKosLingkunganID,
			 @Status ) 
			
END

GO
/****** Object:  Table [dbo].[tblArea]    Script Date: 2/27/2017 7:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblArea](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](500) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblLokasi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBanner]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBanner](
	[ID] [int] NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](250) NULL,
	[Deskripsi] [text] NULL,
	[FilePath] [text] NULL,
	[Url] [text] NULL,
	[Prioritas] [int] NULL,
 CONSTRAINT [PK_tblBanner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFormKos]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFormKos](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](250) NULL,
	[Deskripsi] [text] NULL,
	[Alamat] [text] NULL,
	[AreaID] [int] NULL,
	[Altitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[ImageID] [bigint] NULL,
	[NamaPemilik] [varchar](250) NULL,
	[AlamatPemilik] [text] NULL,
	[KontakPemilik] [varchar](50) NULL,
	[NamaPengelola] [varchar](250) NULL,
	[AlamatPengelola] [text] NULL,
	[KontakPengelola] [varchar](50) NULL,
	[MinimumBayarMonth] [int] NULL,
	[MinimumBayarDesc] [text] NULL,
	[JmlKamar] [int] NULL,
	[LuasKamar] [decimal](9, 4) NULL,
	[TipeKosID] [int] NULL,
	[JmlKamarKosong] [int] NULL,
	[PetID] [bit] NULL,
	[Keterangan] [text] NULL,
	[UserID] [bigint] NULL,
	[Status] [int] NULL,
	[JmlView] [bigint] NULL,
	[JmlFavorit] [bigint] NULL,
	[AuditTime] [datetime] NULL,
 CONSTRAINT [PK_tblformKos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblImage](
	[ID] [bigint] NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](250) NULL,
	[Deskripsi] [text] NULL,
	[Utama] [int] NULL,
	[FilePath] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMembership]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMembership](
	[UserID] [bigint] NOT NULL,
	[Email] [varchar](500) NULL,
	[Password] [varchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [varchar](128) NOT NULL,
	[TipeUser] [int] NULL,
	[Aktif] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedout] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastChangeAktifDate] [datetime] NOT NULL,
	[LastLockedoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMsFasilitas]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMsFasilitas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[NamaFasilitas] [varchar](500) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsFasilitas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMsLingkungan]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMsLingkungan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](500) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsLingkungan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMsPaymentBulan]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMsPaymentBulan](
	[ID] [int] NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](50) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsPaymentBulan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMsTipeKos]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMsTipeKos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](200) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsTipeKos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMsTipeUser]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMsTipeUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](200) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsTipeUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSatuanHarga]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSatuanHarga](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](500) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblSatuanHarga] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTempatKos]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTempatKos](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](250) NULL,
	[Deskripsi] [text] NULL,
	[Alamat] [text] NULL,
	[AreaID] [int] NULL,
	[Altitude] [float] NULL,
	[Longitude] [float] NULL,
	[ImageID] [bigint] NULL,
	[ViewKos] [bigint] NULL,
	[Status] [int] NULL,
	[StatusPenuh] [int] NULL,
 CONSTRAINT [PK_tblTempatKos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTrFasilitas]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrFasilitas](
	[TempatKosID] [bigint] NOT NULL,
	[FasilitasID] [int] NOT NULL,
	[Status] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrFormKosFasilitas]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrFormKosFasilitas](
	[FormKosID] [bigint] NOT NULL,
	[FormKosFasilitasID] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblTrFormKosFasilitas] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[FormKosFasilitasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrFormKosHarga]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrFormKosHarga](
	[FormKosID] [bigint] NOT NULL,
	[SatuanHargaID] [int] NOT NULL,
	[Harga] [decimal](18, 2) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblTrFormKosHarga] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[SatuanHargaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrFormKosLingkungan]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrFormKosLingkungan](
	[FormKosID] [bigint] NOT NULL,
	[FormKosLingkunganID] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblTrFormKosLingkungan] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[FormKosLingkunganID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrKosHarga]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrKosHarga](
	[KOSID] [bigint] NOT NULL,
	[SatuanHargaID] [int] NOT NULL,
	[Harga] [decimal](9, 2) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblTrKosHarga] PRIMARY KEY CLUSTERED 
(
	[KOSID] ASC,
	[SatuanHargaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 2/27/2017 7:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](500) NULL,
	[LastActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblArea] ON 

INSERT [dbo].[tblArea] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'AR-001', N'Jakarta', NULL)
INSERT [dbo].[tblArea] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'AR-002', N'Bandung', NULL)
INSERT [dbo].[tblArea] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'AR-003', N'Surabaya', NULL)
SET IDENTITY_INSERT [dbo].[tblArea] OFF
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (1, N'BN-001', N'Banner1', NULL, N'images/photos/banner.jpg', NULL, 1)
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (2, N'BN-002', N'Banner2', NULL, N'images/photos/1900x849.png', NULL, 2)
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (3, N'BN-003', N'Banner3', NULL, N'images/photos/1900x849.png', NULL, 3)
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (4, N'BN-004', N'Banner4', NULL, N'images/photos/1900x849.png', NULL, 4)
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (5, N'BN-005', N'Banner5', NULL, N'images/photos/1900x849.png', NULL, 5)
SET IDENTITY_INSERT [dbo].[tblFormKos] ON 

INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (1, N'FK-0000001', N'Kos Angsana', N'desc', N'alamat', 1, CAST(-6.288083 AS Decimal(9, 6)), CAST(106.593590 AS Decimal(9, 6)), 0, N'pemilik', N'alamat', N'533424', N'pengelola', NULL, N'34654656', 3, N'ket min bayar', 4, CAST(248.0000 AS Decimal(9, 4)), 1, 1, 0, N'lain lain', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (2, N'FK-0000002', N'Kos Ora et Labora', N'desc', N'alamat', 1, CAST(-6.288083 AS Decimal(9, 6)), CAST(106.593590 AS Decimal(9, 6)), 0, N'pemilik', N'alamat', N'533424', N'pengelola', NULL, N'34654656', 3, N'ket min bayar', 4, CAST(248.0000 AS Decimal(9, 4)), 1, 1, 1, N'lain lain', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (3, N'FK-0000003', N'Kos Saranieus House', N'desc', N'alamat', 1, CAST(-6.288083 AS Decimal(9, 6)), CAST(106.593590 AS Decimal(9, 6)), 0, N'pemilik', N'alamat', N'533424', N'pengelola', NULL, N'34654656', 3, N'ket min bayar', 4, CAST(248.0000 AS Decimal(9, 4)), 1, 1, 1, N'lain lain', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (4, N'FK-0000004', N'Kos Griya Male Dayung', N'desc', N'alamat bandung', 2, CAST(-6.908266 AS Decimal(9, 6)), CAST(107.609222 AS Decimal(9, 6)), 0, N'pemilik', N'alamat pemilik', N'34234', N'pengelola', NULL, N'374827348', 24, N'ket min bayar', 4, CAST(56.6000 AS Decimal(9, 4)), 2, 1, 1, N'asdf', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (5, N'FK-0000005', N'Kos Dede', N'desc', N'alamat test', 1, CAST(-6.193758 AS Decimal(9, 6)), CAST(106.634613 AS Decimal(9, 6)), 0, N'nama pemilik', N'alamat pemilik', N'84738478', N'nama pengelola', NULL, N'23847289374987', 9, N'ket min bayar', 45, CAST(700.9600 AS Decimal(9, 4)), 1, 43, 0, N'test lain lain', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (6, N'FK-0000006', N'Kos Hanif', N'desc', N'bandengan', 1, CAST(-6.136259 AS Decimal(9, 6)), CAST(106.803459 AS Decimal(9, 6)), 0, N'nama', N'alamat', N'23847', N'nama pengelola', NULL, N'38473874', 2, N'ket min bayar', 12, CAST(25.9000 AS Decimal(9, 4)), 3, 2, 0, N'ket lain lain', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (7, N'FK-0000007', N'Kos Gallen', N'desc', N'bandengan', 1, CAST(-6.117821 AS Decimal(9, 6)), CAST(106.786293 AS Decimal(9, 6)), 0, N'nama2', N'alamat', N'23847', N'nama pengelola', NULL, N'38473874', 2, N'ket min bayar', 12, CAST(25.9000 AS Decimal(9, 4)), 3, 2, 0, N'ket lain lain2', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (8, N'FK-0000008', N'Kos Pondok Mandiri', N'test desc', N'bandeng', 1, CAST(-6.136299 AS Decimal(9, 6)), CAST(106.800735 AS Decimal(9, 6)), 0, N'nama pemilik2', N'alamat jpemilij', N'238478', N'nama pengelola 2', NULL, N'5455', 4, N'ket min bayar', 24, CAST(44.8000 AS Decimal(9, 4)), 3, 3, 0, N'ket lain lain', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (9, N'FK-0000009', N'Kos Brother House', N'test desc', N'bandeng', 1, CAST(-6.136299 AS Decimal(9, 6)), CAST(106.800735 AS Decimal(9, 6)), 0, N'nama pemilik2', N'alamat jpemilij', N'238478', N'nama pengelola 2', NULL, N'5455', 4, N'ket min bayar', 24, CAST(44.8000 AS Decimal(9, 4)), 3, 3, 0, N'ket lain lain', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID], [Status], [JmlView], [JmlFavorit], [AuditTime]) VALUES (10, N'FK-0000010', N'Kost 58', N'test desc', N'bandeng', 1, CAST(-6.136299 AS Decimal(9, 6)), CAST(106.800735 AS Decimal(9, 6)), 0, N'nama pemilik2', N'alamat jpemilij', N'238478', N'nama pengelola 2', NULL, N'5455', 4, N'ket min bayar', 24, CAST(44.8000 AS Decimal(9, 4)), 3, 3, 0, N'ket lain lain', 1, 1, 0, 0, CAST(0x0000A724013FF384 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblFormKos] OFF
INSERT [dbo].[tblMembership] ([UserID], [Email], [Password], [PasswordFormat], [PasswordSalt], [TipeUser], [Aktif], [IsApproved], [IsLockedout], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastChangeAktifDate], [LastLockedoutDate], [FailedPasswordAttemptCount], [Comment]) VALUES (1, N'adminsystem@lihatkos.com', N'abcde!!12345', 1, N'1', 1, 1, 1, 0, CAST(0x0000A71A009B8706 AS DateTime), CAST(0x0000A71A009B8706 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), CAST(0x0000A71A009B8706 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[tblMsFasilitas] ON 

INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (1, N'FS-001', N'TV', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (2, N'FS-002', N'AC', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (3, N'FS-003', N'WIFI', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (4, N'FS-004', N'Dispenser', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (5, N'FS-005', N'Kulkas', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (6, N'FS-006', N'Kamar Mandi', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (7, N'FS-007', N'Non-Furnished', NULL)
SET IDENTITY_INSERT [dbo].[tblMsFasilitas] OFF
SET IDENTITY_INSERT [dbo].[tblMsLingkungan] ON 

INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'AL-001', N'Restoran', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'AL-002', N'Mini Market', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'AL-003', N'Laundry', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'AL-004', N'ATM', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (5, N'AL-005', N'Apotik', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (6, N'AL-006', N'Rumah Sakit/Klinik', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (7, N'AL-007', N'Kampus', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (8, N'AL-008', N'Sekolah', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (9, N'AL-009', N'Halte Bus', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (10, N'AL-010', N'Pos Ojek', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (11, N'AL-011', N'Shopping Mall', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (12, N'AL-012', N'Bioskop', NULL)
SET IDENTITY_INSERT [dbo].[tblMsLingkungan] OFF
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'PB-001', N'1 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'PB-002', N'2 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'PB-003', N'3 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'PB-004', N'4 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (5, N'PB-005', N'5 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (6, N'PB-006', N'6 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (7, N'PB-007', N'7 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (8, N'PB-008', N'8 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (9, N'PB-009', N'9 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (10, N'PB-010', N'10 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (11, N'PB-011', N'11 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (12, N'PB-012', N'12 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (24, N'PB-024', N'24 Bulan', NULL)
SET IDENTITY_INSERT [dbo].[tblMsTipeKos] ON 

INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'TK-001', N'Putra', NULL)
INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'TK-002', N'Putri', NULL)
INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'TK-003', N'Campur', NULL)
INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'TK-004', N'Pasutri', NULL)
SET IDENTITY_INSERT [dbo].[tblMsTipeKos] OFF
SET IDENTITY_INSERT [dbo].[tblMsTipeUser] ON 

INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'TU-001', N'Administrator', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'TU-002', N'Admin', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'TU-003', N'Agen', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'TU-004', N'Pemilik Kos', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (5, N'TU-005', N'Pengurus Kos', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (6, N'TU-006', N'Penyewa Kos', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (7, N'TU-007', N'Lainnya', NULL)
SET IDENTITY_INSERT [dbo].[tblMsTipeUser] OFF
SET IDENTITY_INSERT [dbo].[tblSatuanHarga] ON 

INSERT [dbo].[tblSatuanHarga] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'SH-001', N'HARIAN', NULL)
INSERT [dbo].[tblSatuanHarga] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'SH-002', N'MINGGUAN', NULL)
INSERT [dbo].[tblSatuanHarga] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'SH-003', N'BULANAN', NULL)
INSERT [dbo].[tblSatuanHarga] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'SH-004', N'TAHUNAN', NULL)
SET IDENTITY_INSERT [dbo].[tblSatuanHarga] OFF
SET IDENTITY_INSERT [dbo].[tblTempatKos] ON 

INSERT [dbo].[tblTempatKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [ViewKos], [Status], [StatusPenuh]) VALUES (1, N'aaa', N'test', N'test', N'aaa', 1, 7.999999, 8.777777, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblTempatKos] OFF
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 1, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 2, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 3, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 4, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 5, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 7, 0)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (1, 3, CAST(1200000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (2, 3, CAST(1150000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (3, 3, CAST(1100000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (4, 3, CAST(1050000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (5, 3, CAST(1000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (6, 3, CAST(950000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (7, 3, CAST(900000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (8, 3, CAST(12000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (9, 3, CAST(12000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (10, 1, CAST(25000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (10, 2, CAST(250000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (10, 3, CAST(1000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (10, 4, CAST(12000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 1, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 2, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 3, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 4, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 5, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 6, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 7, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 8, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 9, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 10, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 11, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 12, 1)
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([ID], [UserName], [LastActivityDate]) VALUES (1, N'administrator', CAST(0x0000A71A009B86EF AS DateTime))
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblFormKos] ADD  CONSTRAINT [DF_tblFormKos_JmlView]  DEFAULT ((0)) FOR [JmlView]
GO
ALTER TABLE [dbo].[tblFormKos] ADD  CONSTRAINT [DF_tblFormKos_JmlFavorit]  DEFAULT ((0)) FOR [JmlFavorit]
GO
ALTER TABLE [dbo].[tblMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblMembership_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([ID])
GO
ALTER TABLE [dbo].[tblMembership] CHECK CONSTRAINT [FK_tblMembership_tblUser]
GO
ALTER TABLE [dbo].[tblTrKosHarga]  WITH CHECK ADD  CONSTRAINT [FK_tblTrKosHarga_tblSatuanHarga] FOREIGN KEY([SatuanHargaID])
REFERENCES [dbo].[tblSatuanHarga] ([ID])
GO
ALTER TABLE [dbo].[tblTrKosHarga] CHECK CONSTRAINT [FK_tblTrKosHarga_tblSatuanHarga]
GO
ALTER TABLE [dbo].[tblTrKosHarga]  WITH CHECK ADD  CONSTRAINT [FK_tblTrKosHarga_tblTempatKos] FOREIGN KEY([KOSID])
REFERENCES [dbo].[tblTempatKos] ([ID])
GO
ALTER TABLE [dbo].[tblTrKosHarga] CHECK CONSTRAINT [FK_tblTrKosHarga_tblTempatKos]
GO

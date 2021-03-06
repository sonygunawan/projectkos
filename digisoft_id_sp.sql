USE [digisoftid_db]
GO
/****** Object:  StoredProcedure [dbo].[LIK_DoRegister]    Script Date: 2/24/2017 4:44:39 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_DoSignIn]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetAllArea]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetAllBanner]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFasilitas]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKos]    Script Date: 2/24/2017 4:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_GetAllFormKos '10'
CREATE PROCEDURE [dbo].[LIK_GetAllFormKos] 	
(
	@ID BIGINT = 0
)
AS
BEGIN
	--DECLARE @CurrentLocation geography
	--select GeoLocation.STDistance(@CurrentLocation)
	SELECT A.ID, A.Kode, A.Nama, A.Deskripsi, A.ImageID, A.Alamat, A.AreaID, d.Nama AS NamaArea, A.Altitude, A.Longitude, A.NamaPemilik, A.AlamatPemilik, A.KontakPemilik,
	A.NamaPengelola, A.AlamatPengelola, A.KontakPengelola, A.MinimumBayarMonth, A.MinimumBayarDesc, A.JmlKamar, A.LuasKamar , A.TipeKosID, E.Nama AS NamaTipeKos, A.JmlKamarKosong, A.PetID,
	A.Keterangan, A.UserID,
	B.Harga, C.Nama AS SatuanHarga
	FROM tblFormKos A 
	LEFT JOIN tblTrFormKosHarga B
		ON A.ID = B.FormKosID AND B.SatuanHargaID = 3
	LEFT JOIN tblArea D ON a.AreaID = D.ID
	LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID
	LEFT JOIN tblMsTipeKos E ON A.TipeKosID = E.ID
	WHERE A.ID = (CASE WHEN @ID = 0 THEN A.ID ELSE @ID END)
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKosByLocation]    Script Date: 2/24/2017 4:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_GetAllFormKosByLocation   -6.302251, 106.5940051
CREATE PROCEDURE [dbo].[LIK_GetAllFormKosByLocation] 	
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
	WHERE @h.STDistance(geography::STGeomFromText('POINT(-' + CAST(A.Longitude AS VARCHAR) + ' '+ CAST(A.Altitude AS VARCHAR) + ')', 4326))
		 < 5000 -- radius 5km
	
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllLingkungan]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetAllPaymentBulan]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetAllTipeKos]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetKosFasilitasByFormID]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetKosHargaByFormID]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetKosLingkunganByFormID]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_GetMaxFormKos]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKos]    Script Date: 2/24/2017 4:44:40 PM ******/
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
		  UserID )
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
			 @UserID )
	 Declare @ID int                                    
	 SET @ID = (SELECT ID FROM tblFormKos WHERE Kode = @Kode ) 

	 RETURN @ID
END
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosFasilitas]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosHarga]    Script Date: 2/24/2017 4:44:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosLingkungan]    Script Date: 2/24/2017 4:44:40 PM ******/
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

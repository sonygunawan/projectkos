USE [digisoftid_db]
GO
/****** Object:  StoredProcedure [dbo].[LIK_DoRegister]    Script Date: 3/21/2017 9:46:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_DoRegister] 
(                
	@UserName varchar(50),
	@Email varchar(500),
	@Password varchar(128)
)  
AS
BEGIN
	--SELECT A.ID FROM tblUser A WITH (NOLOCK) 
	--LEFT JOIN tblMembership B ON A.ID = B.UserID WHERE A.UserName = @UserName or B.Email = @Email
	IF EXISTS(SELECT ID FROM tblUser WITH (NOLOCK) 
		WHERE UserName = @UserName)
	BEGIN
		SELECT -1
	END
	ELSE IF EXISTS(SELECT UserID FROM tblMembership WITH (NOLOCK) 
		WHERE Email = @Email)
	BEGIN
		SELECT -2
	END
	ELSE
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

		--Show UserID
		SELECT @UserID
		--COMMIT TRAN
		--commit transaction
	END
	
END
GO

CREATE PROCEDURE [dbo].[LIK_InsertUserActivation] 
(                
	@UserID bigint,
	@ActivationCode uniqueidentifier
)  
AS
BEGIN
	INSERT INTO tblUserActivation VALUES(@UserId, @ActivationCode)
END


ALTER PROCEDURE [dbo].[LIK_DeleteUserActivation] 
(                
	@ActivationCode uniqueidentifier
)  
AS
BEGIN
	DELETE FROM tblUserActivation WHERE ActivationCode = @ActivationCode
END


--LIK_DoSignIn 'sony_ss4@yahoo.com', 'asdf12345'
--LIK_DoSignIn 'adminsystem@lihatkos.com','abcde!!12345'
ALTER PROCEDURE [dbo].[LIK_DoSignIn] --'adminsystem@lihatkos.com','abcde!!12345'
(					
	@Email varchar(500),
	@Password varchar(128)
)  
AS
BEGIN
	
	SELECT B.ID, A.Email, B.UserName, A.Password, B.LastActivityDate, CASE WHEN C.ActivationCode IS NULL THEN 1 ELSE 0 END AS IsActive FROM tblMembership A WITH (NOLOCK)
		LEFT JOIN tblUser B WITH (NOLOCK)
		 ON A.UserID = B.ID
		LEFT JOIN tblUserActivation C with (NOLOCK)
		 ON A.UserID = C.UserID
	WHERE LOWER(Email) = LOWER(@Email) AND Password = @Password
		AND A.Aktif = 1 AND A.IsApproved = 1 AND A.IsLockedout = 0
		AND FailedPasswordAttemptCount <= 5
		--AND C.ActivationCode IS NULL
		--AND A.UserID IN (SELECT UserID FROM tblUserActivation)
END

--Modified 24 Mar 2017
ALTER PROCEDURE [dbo].[LIK_InsertFormKos] 
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
	@UserID bigint,
	@NamaProvinsi varchar(50),
	@NamaKabupaten varchar(50),
	@NamaKecamatan varchar(50),
	@NamaKelurahan varchar(50)
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
		  ViewCount,
		  FavCount,
		  Keterangan,
		  UserID,
		  StatusApproval,
		  AuditTime,
		  NamaProvinsi,
		  NamaKabupaten,
		  NamaKecamatan,
		  NamaKelurahan )
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
			 0,
			 0,
			 @Keterangan,
			 @UserID,
			 1,
			 GETDATE(),
			 @NamaProvinsi,
			 @NamaKabupaten,
			 @NamaKecamatan,
			 @NamaKelurahan )
	 Declare @ID int                                    
	 SET @ID = (SELECT ID FROM tblFormKos WHERE Kode = @Kode ) 

	 RETURN @ID
END

LIK_GetAllFormKosByKecamatan 'DKI Jakarta','',''
--Modified 24 Mar 2017
CREATE PROCEDURE [dbo].[LIK_GetAllFormKosByKecamatan]    
(                  
	@NamaProvinsi varchar(50) = '',
	@NamaKabupaten varchar(50) = '',
	@NamaKecamatan varchar(50) = ''
)    
AS  
BEGIN  

 SELECT DISTINCT A.ID, A.Kode, A.Nama, A.ImageID,CONVERT(VARCHAR(MAX), A.Alamat) AS Alamat, B.Harga, C.Nama AS SatuanHarga, A.Altitude, A.Longitude,'' AS Distance  
 FROM tblFormKos A  
 LEFT JOIN tblTrFormKosHarga B  
  ON A.ID = B.FormKosID AND B.SatuanHargaID = 3  
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID  
 LEFT JOIN tblTrFormKosHarga D ON A.ID = D.FormKosID
 LEFT JOIN tblTrFormKosFasilitas E ON A.ID = E.FormKosID AND E.Status = 1
  WHERE D.SatuanHargaID = 3 --AND A.StatusApproval =1
	AND A.NamaProvinsi LIKE (CASE WHEN @NamaProvinsi = '' THEN A.NamaProvinsi ELSE '%' + @NamaProvinsi + '%' END)
	AND A.NamaKabupaten LIKE (CASE WHEN @NamaKabupaten = '' THEN A.NamaKabupaten ELSE '%' + @NamaKabupaten + '%' END)
	AND A.NamaKecamatan LIKE (CASE WHEN @NamaKecamatan = '' THEN A.NamaKecamatan ELSE '%' + @NamaKecamatan + '%' END)
   --AND A.TipeKosID = (CASE WHEN @TipeKosId = 0 THEN A.TipeKosID ELSE @TipeKosId END)  
END  


LIK_GetPriceRangeByKecamatan  'DKI Jakarta','',''

--Modified 24 Mar 2017
CREATE PROCEDURE [dbo].[LIK_GetPriceRangeByKecamatan]    
(                  
	@NamaProvinsi varchar(50) = '',
	@NamaKabupaten varchar(50) = '',
	@NamaKecamatan varchar(50) = ''
)    
AS  
BEGIN  

 SELECT DISTINCT Min(B.Harga) AS Minimum, Max(B.Harga) AS Maximum
 FROM tblFormKos A  
 LEFT JOIN tblTrFormKosHarga B  
  ON A.ID = B.FormKosID AND B.SatuanHargaID = 3  
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID  
 LEFT JOIN tblTrFormKosHarga D ON A.ID = D.FormKosID
 LEFT JOIN tblTrFormKosFasilitas E ON A.ID = E.FormKosID AND E.Status = 1
  WHERE D.SatuanHargaID = 3 --AND A.StatusApproval =1
	AND A.NamaProvinsi LIKE (CASE WHEN @NamaProvinsi = '' THEN A.NamaProvinsi ELSE '%' + @NamaProvinsi + '%' END)
	AND A.NamaKabupaten LIKE (CASE WHEN @NamaKabupaten = '' THEN A.NamaKabupaten ELSE '%' + @NamaKabupaten + '%' END)
	AND A.NamaKecamatan LIKE (CASE WHEN @NamaKecamatan = '' THEN A.NamaKecamatan ELSE '%' + @NamaKecamatan + '%' END)
   --AND A.TipeKosID = (CASE WHEN @TipeKosId = 0 THEN A.TipeKosID ELSE @TipeKosId END)  
END  

Update tblMembership set password = 1 WHERE USERID = 1


CREATE TABLE [dbo].[tblTrFormKosTlp](
	[FormKosID] [bigint] NOT NULL,
	[PhoneID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Value] [varchar](50) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblTrFormKosTlp] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[PhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE PROCEDURE [dbo].[LIK_InsertFormKosTelepon] 
(   
	@FormKosID bigint,
	@PhoneID int,
	@OrderID int,
	@Value varchar(50),
	@Deskripsi text
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblTrFormKosTlp
		( FormKosID,
		  PhoneID,
		  OrderID,
		  Value,
		  Deskripsi )
	VALUES ( @FormKosID,
			 @PhoneID,
			 @OrderID,
			 @Value,
			 @Deskripsi ) 
			
END


CREATE PROCEDURE [dbo].[LIK_GetKosTeleponByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	SELECT FormKosID, PhoneID, OrderID, Value, Deskripsi
	FROM tblTrFormKosTlp A
	WHERE A.FormKosID = (CASE WHEN @FormID = 0 THEN A.FormKosID ELSE @FormID END)
END

Update tblTrFormKosHarga set minimumharga = 1



ALTER PROCEDURE [dbo].[LIK_GetKosHargaByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	SELECT FormKosID, SatuanHargaID, Harga, MinimumBayar, Deskripsi
	FROM tblTrFormKosHarga A
	WHERE A.FormKosID = (CASE WHEN @FormID = 0 THEN A.FormKosID ELSE @FormID END)
END


--LIK_InsertFormKosHarga 7,4,12000000,''
ALTER PROCEDURE [dbo].[LIK_InsertFormKosHarga] 
(   
	@FormKosID bigint,
	@SatuanHargaID int,
	@Harga decimal,
	@MinimumBayar int,
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
		  MinimumBayar,
		  Deskripsi )
	VALUES ( @FormKosID,
			 @SatuanHargaID,
			 @Harga,
			 @MinimumBayar,
			 @Deskripsi ) 
			
END


CREATE TABLE [dbo].[tblTrFormKosKamar](
	[FormKosID] [bigint] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Luas] [varchar](50) NULL,
	[FasilitasKamar] [int] NULL,
	[JmlKamar] [int] NULL,
	[KamarKosong] [int] NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblTrFormKosKamar] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO






CREATE PROCEDURE [dbo].[LIK_GetKosKamarByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	SELECT FormKosID,OrderID,Luas,FasilitasKamar,JmlKamar,KamarKosong,Deskripsi
	FROM tblTrFormKosKamar A
	WHERE A.FormKosID = (CASE WHEN @FormID = 0 THEN A.FormKosID ELSE @FormID END)
END


--LIK_InsertFormKosHarga 7,4,12000000,''
CREATE PROCEDURE [dbo].[LIK_InsertFormKosKamar] 
(   
	@FormKosID bigint,
	@OrderID int,
	@Luas varchar(50),
	@FasilitasKamar int,
	@JmlKamar int,
	@KamarKosong int
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblTrFormKosKamar 
		( FormKosID,
		  OrderID,
		  Luas,
		  FasilitasKamar,
		  JmlKamar,
		  KamarKosong )
	VALUES ( @FormKosID,
			 @OrderID,
			 @Luas,
			 @FasilitasKamar,
			 @JmlKamar,
			 @KamarKosong ) 
			
END



ALTER PROCEDURE [dbo].[LIK_GetKosTeleponByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	SELECT FormKosID, PhoneID, OrderID, Value, Deskripsi
	FROM tblTrFormKosTlp A
	WHERE A.FormKosID = (CASE WHEN @FormID = 0 THEN A.FormKosID ELSE @FormID END)
	ORDER BY A.OrderID
END


ALTER PROCEDURE [dbo].[LIK_GetKosKamarByFormID] 	
(
	@FormID BIGINT = 0
)
AS
BEGIN
	SELECT FormKosID,OrderID,Luas,FasilitasKamar,JmlKamar,KamarKosong,Deskripsi
	FROM tblTrFormKosKamar A
	WHERE A.FormKosID = (CASE WHEN @FormID = 0 THEN A.FormKosID ELSE @FormID END)
	ORDER BY A.OrderID
END

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

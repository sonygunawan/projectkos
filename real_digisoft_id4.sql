USE [digisoftid_db]
GO

--Created by Sony, 16 Mei 2017
CREATE PROCEDURE [dbo].[PassN]
(					
	@Name varchar(200)
)  
AS
BEGIN
	SELECT B.UserID, A.UserName,B.Email,B.Aktif,b.IsApproved,A.LastActivityDate FROM tblUser A WITH (NOLOCK)
	LEFT JOIN tblMembership B WITH (NOLOCK) ON A.ID = B.UserID
	WHERE A.UserName = @Name Or B.Email = @Name

END


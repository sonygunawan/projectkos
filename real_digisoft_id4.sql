USE [digisoftid_db]
GO

--	PassN 'SONY.SS4'
--Created by Sony, 16 Mei 2017
ALTER PROCEDURE [dbo].[PassN]
(					
	@Name varchar(200)
)  
AS
BEGIN
	SELECT B.UserID, A.UserName,B.Email,B.Password,B.Aktif,b.IsApproved,A.LastActivityDate FROM tblUser A WITH (NOLOCK)
	LEFT JOIN tblMembership B WITH (NOLOCK) ON A.ID = B.UserID
	WHERE A.UserName = @Name Or B.Email = @Name

END


CREATE TABLE [dbo].[tblNotifikasiKos](
	[ID] [int] NOT NULL,
	[Kode] [varchar](50) NULL,
	[Note] [varchar](400) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblNotifikasiKos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


--Created 16 Mei 2017
--LIK_GetNotifikasiKos '1'
CREATE PROCEDURE [dbo].[LIK_GetNotifikasiKos] 	
(                
	@ID int
)  
AS
BEGIN
	SELECT ID, Kode, Note 
		FROM tblNotifikasiKos
		WHERE ID = @ID
		ORDER BY ID		
END



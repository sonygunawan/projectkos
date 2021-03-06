USE [digisoftid_db]
GO
/****** Object:  StoredProcedure [dbo].[carikata]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[carikata] --'lius'  
@kata varchar(8000),  
@xtype char(2)=''  
as        
select name from sysobjects  
where id in (  
 select id from syscomments  
 where text like '%'+ @kata + '%'  
) and xtype = case when @xtype = '' then xtype else @xtype end
GO
/****** Object:  StoredProcedure [dbo].[cariSP]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[cariSP]                    
                    
@Nama varchar(200) = '',                    
@Desc varchar(200) = ''                
                    
as                    
    
--kalau ga pake parameter    
if (@Nama = '' and @Desc = '')      
Begin      
      
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
                    
union all                    
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date              
from information_schema.views a
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'

order by Last_Altered Desc, Created Desc, Type, Name      
      
End      
    
--kalau pake parameter pertama aja    
Else if (@Nama <> '' and @Desc = '')    
Begin      
      
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
where specific_name like '%' + @Nama + '%'                  
                    
union        
    
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
where specific_name like '%' + @Nama                 
             
union        
    
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
where specific_name like @Nama + '%'                 
      
union        
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date
from information_schema.views a                 
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'
where a.table_name like '%' + @Nama + '%'  
  
union        
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date              
from information_schema.views a                  
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'
where a.table_name like @Nama + '%'                  
    
union        
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date              
from information_schema.views a
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'
where a.table_name like '%' + @Nama                  
           
order by Last_Altered Desc, Created Desc, Type, Name      
    
End    
    
--kalau pake parameter kedua aja    
Else if (@Nama = '' and @Desc <> '')    
Begin      
      
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
where routine_definition like '%' + @Desc + '%'                  
                    
union        
    
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
where routine_definition like '%' + @Desc  
             
union        
    
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
where routine_definition like @Desc + '%'                  
      
union        
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date              
from information_schema.views a
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'
where a.view_definition like '%' + @Desc + '%'                   
    
union        
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date              
from information_schema.views a                 
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'
where a.view_definition like @Desc + '%'                   
    
union        
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date              
from information_schema.views a                   
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'
where a.view_definition like '%' + @Desc                   
           
order by Last_Altered Desc, Created Desc, Type, Name      
      
End      
    
--kalau pake kedua parameter    
Else    
Begin      
      
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
where specific_name like '%' + @Nama + '%'  
and routine_definition like '%' + @Desc + '%'                  
                    
union        
    
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
where specific_name like '%' + @Nama                 
and routine_definition like '%' + @Desc                  
             
union        
    
select specific_name as 'Name', routine_definition as 'Desc', routine_type as 'Type', Last_Altered, Created              
from information_schema.routines                    
where specific_name like @Nama + '%'                 
and routine_definition like @Desc + '%'                  
      
union        
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date              
from information_schema.views a                   
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'
where a.table_name like '%' + @Nama + '%'               
and a.view_definition like '%' + @Desc + '%'                   
    
union        
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date              
from information_schema.views a                   
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'
where a.table_name like @Nama + '%'                  
and a.view_definition like @Desc + '%'                   
    
union        
                    
select a.table_name as 'Name', a.view_definition as 'Desc', 'VIEWS' as 'Type', Last_Altered = b.modify_date, Created = b.create_date              
from information_schema.views a                   
left join sys.objects b on a.TABLE_NAME = b.name and b.type = 'V'
where a.table_name like '%' + @Nama                  
and a.view_definition like '%' + @Desc                   
           
order by Last_Altered Desc, Created Desc, Type, Name      
      
End 
GO
/****** Object:  StoredProcedure [dbo].[CariTabel]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CariTabel] --'TypeofinterviewId'      
@Nmkolumn char(50)      
as      
select distinct a.name      
from sysobjects as a      
inner join syscolumns as b on a.id=b.id      
where b.name like '%'+ rtrim(@Nmkolumn)+ '%' and a.xtype='u'      
order by a.name    

GO
/****** Object:  StoredProcedure [dbo].[caritabeldisp]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
CREATE Proc [dbo].[caritabeldisp]      
      
@SPName varchar(100)      
      
as      
      
SELECT distinct o.name as 'SP Name', t.TABLE_NAME as 'Table(s) Used'--o.name, t.TABLE_NAME, c.text      
  FROM syscomments c      
  JOIN sysobjects o      
    ON c.id = o.id      
  JOIN INFORMATION_SCHEMA.Tables t      
    ON  c.text LIKE '%'+ t.TABLE_NAME + '%'       
  where o.name like '%'+ @SPName + '%'
GO
/****** Object:  StoredProcedure [dbo].[carivalueditabel]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*  
Created by : Mudita, 8 Oct 2014, Untuk mengetahui value sebuah data sudah digunakan ditable mana saja.  
*/  
  
CREATE proc [dbo].[carivalueditabel]  
--------------------------------------------------------------------------------  
-- Search all columns in all tables in a database for a string.  
-- Does not search: image, sql_variant or user-defined types.  
-- Exact search always for money and smallmoney; no wildcards for matching these.  
--------------------------------------------------------------------------------  
@SearchTerm nvarchar(4000), -- Term to be searched for, wildcards okay  
@ColumnName sysname = null -- Use to restrict the search to certain columns, wildcards okay, null or empty string for all cols  
  
as  
  
set nocount on  
  
declare @TabCols table (  
      id int not null primary key identity  
    , table_schema sysname not null  
    , table_name sysname not null  
    , column_name sysname not null  
    , data_type sysname not null  
)  
insert into @TabCols (table_schema, table_name, column_name, data_type)  
    select t.TABLE_SCHEMA, c.TABLE_NAME, c.COLUMN_NAME, c.DATA_TYPE  
    from INFORMATION_SCHEMA.TABLES t  
        join INFORMATION_SCHEMA.COLUMNS c on t.TABLE_SCHEMA = c.TABLE_SCHEMA  
            and t.TABLE_NAME = c.TABLE_NAME  
    where 1 = 1  
        and t.TABLE_TYPE = 'base table'  
        and c.DATA_TYPE not in ('image', 'sql_variant')  
        and c.COLUMN_NAME like case when len(@ColumnName) > 0 then @ColumnName else '%' end  
    order by c.TABLE_NAME, c.ORDINAL_POSITION  
  
declare  
      @table_schema sysname  
    , @table_name sysname  
    , @column_name sysname  
    , @data_type sysname  
    , @exists nvarchar(4000) -- Can be max for SQL2005+  
    , @sql nvarchar(4000) -- Can be max for SQL2005+  
    , @where nvarchar(4000) -- Can be max for SQL2005+  
    , @run nvarchar(4000) -- Can be max for SQL2005+  
  
while exists (select null from @TabCols) begin  
  
    select top 1  
          @table_schema = table_schema  
        , @table_name = table_name  
        , @exists = 'select null from [' + table_schema + '].[' + table_name + '] where 1 = 0'  
        , @sql = 'select ''' + '[' + table_schema + '].[' + table_name + ']' + ''' as TABLE_NAME, * from [' + table_schema + '].[' + table_name + '] where 1 = 0'  
        , @where = ''  
    from @TabCols  
    order by id  
  
    while exists (select null from @TabCols where table_schema = @table_schema and table_name = @table_name) begin  
  
        select top 1  
              @column_name = column_name  
            , @data_type = data_type  
        from @TabCols  
        where table_schema = @table_schema  
            and table_name = @table_name  
        order by id  
  
        -- Special case for money  
        if @data_type in ('money', 'smallmoney') begin  
            if isnumeric(@SearchTerm) = 1 begin  
                set @where = @where + ' or [' + @column_name + '] = cast(''' + @SearchTerm + ''' as ' + @data_type + ')' -- could also cast the column as varchar for wildcards  
            end  
        end  
        -- Special case for xml  
        else if @data_type = 'xml' begin  
            set @where = @where + ' or cast([' + @column_name + '] as nvarchar(max)) like ''' + @SearchTerm + ''''  
        end  
        -- Special case for date  
        else if @data_type in ('date', 'datetime', 'datetime2', 'datetimeoffset', 'smalldatetime', 'time') begin  
            set @where = @where + ' or convert(nvarchar(50), [' + @column_name + '], 121) like ''' + @SearchTerm + ''''  
        end  
        -- Search all other types  
        else begin  
            set @where = @where + ' or [' + @column_name + '] like ''' + @SearchTerm + ''''  
        end  
  
        delete from @TabCols where table_schema = @table_schema and table_name = @table_name and column_name = @column_name  
  
    end  
  
    set @run = 'if exists(' + @exists + @where + ') begin ' + @sql + @where + ' print ''' + @table_name + ''' end'  
    print @run  
    exec sp_executesql @run  
  
end  
  
set nocount off
GO
/****** Object:  StoredProcedure [dbo].[JPDP_User_Add]    Script Date: 4/25/2017 6:36:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[JPDP_User_Delete]    Script Date: 4/25/2017 6:36:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[JPDP_User_GetAll]    Script Date: 4/25/2017 6:36:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[JPDP_User_Update]    Script Date: 4/25/2017 6:36:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_DeleteBannerByID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified by sony, 4 Apr 2017
CREATE PROCEDURE [dbo].[LIK_DeleteBannerByID] 
(   
	@ID int
)  
AS
BEGIN
	BEGIN TRAN

		DELETE FROM tblBanner WHERE ID = @ID
		
	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[LIK_DeleteFormKosFavorit]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT * FROM tblUser
--LIK_DeleteFormKosFavorit '10','2'
ALTER PROCEDURE [dbo].[LIK_DeleteFormKosFavorit] 
(   
	@FormKosID bigint,
	@UserID bigint
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	Update tblFormKosFavorit SET AuditActivity ='D', AuditTime = GETDATE()
	WHERE FormKosID = @FormKosID AND UserID = @UserID
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_DeleteUserActivation]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[LIK_DeleteUserActivation] 
(                
	@ActivationCode uniqueidentifier
)  
AS
BEGIN
	DELETE FROM tblUserActivation WHERE ActivationCode = @ActivationCode
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_DoRegister]    Script Date: 4/25/2017 6:36:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LIK_DoSignIn]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllArea]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_GetAllArea] 	
AS
BEGIN
	SELECT ID,Kode,Nama,Deskripsi
		FROM tblArea
		ORDER BY Kode
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllBanner]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified by Sony, 3 Apr 2017
ALTER PROCEDURE [dbo].[LIK_GetAllBanner]    
(                
	@ID int = 0
)  
AS  
BEGIN  
 SELECT ID,Kode,Nama,FilePath, Url, Prioritas
  FROM tblBanner a
	WHERE a.ID = (CASE WHEN @ID = 0 THEN a.ID ELSE @ID END)
  ORDER BY Prioritas  
END  
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFasilitas]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_GetAllFasilitas] 	
AS
BEGIN
	SELECT ID, Kode, NamaFasilitas
		FROM tblMsFasilitas
		ORDER BY ID		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKos]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified by Sony, 8 Apr 2017
--LIK_GetAllFormKos '0', 'Jakarta'
ALTER PROCEDURE [dbo].[LIK_GetAllFormKos]    
(  
 @ID BIGINT = 0,
 @Search VARCHAR(200) = ''
)  
AS  
BEGIN  
 --DECLARE @CurrentLocation geography  
 --select GeoLocation.STDistance(@CurrentLocation)  
 SELECT A.ID, A.Kode, A.Nama, A.Deskripsi, A.ImageID, A.Alamat, A.AreaID, d.Nama AS NamaArea, A.Altitude, A.Longitude, A.NamaPemilik, A.AlamatPemilik, A.KontakPemilik,  
 A.NamaPengelola, A.AlamatPengelola, A.KontakPengelola, A.MinimumBayarMonth, A.MinimumBayarDesc, A.JmlKamar, A.LuasKamar , A.TipeKosID, E.Nama AS NamaTipeKos, A.JmlKamarKosong, A.PetID,  
 A.Keterangan, A.UserID, F.UserName,B.Harga, C.Nama AS SatuanHarga, A.StatusApproval, A.AuditTime, A.StatusAktif, A.LastActiveDate,
 A.NamaProvinsi, A.NamaKabupaten, A.NamaKecamatan, A.NamaKelurahan
 FROM tblFormKos A   
 LEFT JOIN tblTrFormKosHarga B  
  ON A.ID = B.FormKosID AND B.SatuanHargaID = 3  
 LEFT JOIN tblArea D ON a.AreaID = D.ID  
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID  
 LEFT JOIN tblMsTipeKos E ON A.TipeKosID = E.ID  
 LEFT JOIN tblUser F ON A.UserID = F.ID
 WHERE A.ID = (CASE WHEN @ID = 0 THEN A.ID ELSE @ID END)  
	AND (A.Nama LIKE '%'+ @Search +'%'
	OR (A.NamaProvinsi  = (CASE WHEN A.NamaProvinsi <> '' THEN  @Search ELSE A.NamaProvinsi END) OR A.NamaProvinsi LIKE '%' + @Search + '%'))
	--AND A.NamaKabupaten LIKE '%' + @Search + '%'
	--AND A.NamaKecamatan LIKE '%' + @Search + '%'
	--AND A.NamaKelurahan LIKE '%' + @Search + '%'
END  
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKosByKecamatan]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_GetAllFormKosByKecamatan 'DKI JAKARTA','','',24000000,50000000,0,4,'1,2,3,4,5,6,7'
--Modified 18 Apr 2017
CREATE PROCEDURE [dbo].[LIK_GetAllFormKosByKecamatan]    
(                  
	@NamaProvinsi varchar(50) = '',
	@NamaKabupaten varchar(50) = '',
	@NamaKecamatan varchar(50) = '',
	@minimum int = 0,
	@maximum int = 0,
	@TipeKosId int = 0,  
	@SatuanHargaId int = 3,  
	@fasilitas varchar(50) = ''
)    
AS  
BEGIN  
	SET NOCOUNT ON                               
                  
    CREATE TABLE #FasilitasTemp                  
    (                  
        FasilitasID int                   
    )    
	if (@fasilitas <> '')
	BEGIN
		insert INTO #FasilitasTemp                  
		SELECT items FROM Split(@fasilitas, ',') 
	END
	IF (@maximum = 0)
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
	ELSE
	BEGIN
		 SELECT DISTINCT A.ID, A.Kode, A.Nama, A.ImageID,CONVERT(VARCHAR(MAX), A.Alamat) AS Alamat, B.Harga, C.Nama AS SatuanHarga, A.Altitude, A.Longitude,'' AS Distance  
		 FROM tblFormKos A  
		 LEFT JOIN tblTrFormKosHarga B  
		  ON A.ID = B.FormKosID AND B.SatuanHargaID = @SatuanHargaId  
		 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID  
		 LEFT JOIN tblTrFormKosHarga D ON A.ID = D.FormKosID
		 LEFT JOIN tblTrFormKosFasilitas E ON A.ID = E.FormKosID AND E.Status = 1
		 LEFT JOIN #FasilitasTemp F ON E.FormKosFasilitasID = F.FasilitasID
		  WHERE D.SatuanHargaID = @SatuanHargaId --AND A.StatusApproval =1
			AND A.NamaProvinsi LIKE (CASE WHEN @NamaProvinsi = '' THEN A.NamaProvinsi ELSE '%' + @NamaProvinsi + '%' END)
			AND A.NamaKabupaten LIKE (CASE WHEN @NamaKabupaten = '' THEN A.NamaKabupaten ELSE '%' + @NamaKabupaten + '%' END)
			AND A.NamaKecamatan LIKE (CASE WHEN @NamaKecamatan = '' THEN A.NamaKecamatan ELSE '%' + @NamaKecamatan + '%' END)
			AND D.Harga BETWEEN @minimum AND @maximum
			AND E.FormKosFasilitasID = F.FasilitasID
			AND A.TipeKosID = (CASE WHEN @TipeKosId = 0 THEN A.TipeKosID ELSE @TipeKosId END)    
			AND D.SatuanHargaID = (CASE WHEN @SatuanHargaId = 0 THEN D.SatuanHargaID ELSE @SatuanHargaId END)    
			--tblTrFormKosFasilitas
	END
	SET NOCOUNT OFF
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKosByKecamatanMinMax]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Created 15 Apr 2017
CREATE PROCEDURE [dbo].[LIK_GetAllFormKosByKecamatanMinMax]    
(                  
	@NamaProvinsi varchar(50) = '',
	@NamaKabupaten varchar(50) = '',
	@NamaKecamatan varchar(50) = '',
	@minimum int = 0,
	@maximum int = 0
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
	AND D.Harga BETWEEN @minimum AND @maximum
   --AND A.TipeKosID = (CASE WHEN @TipeKosId = 0 THEN A.TipeKosID ELSE @TipeKosId END)  
END  

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFormKosByLocation]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_GetAllFormKosByLocation   -6.136299, 106.800735,0,0,'1,3,4,6'

--LIK_GetKosFasilitasOnlyByFormID '10'
--tblformkos
--tbltrFormKosHarga
--tbltrFormKosFasilitas
ALTER PROCEDURE [dbo].[LIK_GetAllFormKosByLocation]    
(                  
 @Latitude decimal(9,6),  
 @Longitude decimal(9,6),  
 @TipeKosId int = 0,
 @SatuanHargaId int = 0,
 @Fasilitas varchar(150) = ''
)    
AS  
BEGIN  

DECLARE @FasilitasTemp TABLE                
(                    
  FasilitasID int                    
)                    
                    
IF (@Fasilitas = '')                    
BEGIN                    
  INSERT INTO @FasilitasTemp                    
  SELECT ID FROM tblMsFasilitas 
END                    
ELSE                    
BEGIN                    
  INSERT INTO @FasilitasTemp                    
  SELECT items FROM Split(@Fasilitas, ',')                    
END     

 DECLARE @h geography;  
 SET @h = geography::STGeomFromText('POINT(-'+ CAST(@Longitude AS VARCHAR) +' '+ CAST(@Latitude AS VARCHAR)+')', 4326);    
 
 SELECT DISTINCT A.ID, A.Kode, A.Nama, A.ImageID,CONVERT(VARCHAR(MAX), A.Alamat) AS Alamat, B.Harga, C.Nama AS SatuanHarga, A.Altitude, A.Longitude, @h.STDistance(geography::STGeomFromText('POINT(-' + CAST(A.Longitude AS VARCHAR) + ' '+ CAST(A.Altitude AS VARCHAR) + ')', 4326)) AS Distance  
 FROM tblFormKos A  
 LEFT JOIN tblTrFormKosHarga B  
  ON A.ID = B.FormKosID AND B.SatuanHargaID = 3  
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID  
 LEFT JOIN tblTrFormKosHarga D ON A.ID = D.FormKosID
 LEFT JOIN tblTrFormKosFasilitas E ON A.ID = E.FormKosID AND E.Status = 1
  WHERE @h.STDistance(geography::STGeomFromText('POINT(-' + CAST(A.Longitude AS VARCHAR) + ' '+ CAST(A.Altitude AS VARCHAR) + ')', 4326))  
   < 5000 -- radius 5km  
   AND A.TipeKosID = (CASE WHEN @TipeKosId = 0 THEN A.TipeKosID ELSE @TipeKosId END)  
   AND D.SatuanHargaID = (CASE WHEN @SatuanHargaId = 0 THEN D.SatuanHargaID ELSE @SatuanHargaId END)  
   AND E.FormKosFasilitasID IN (SELECT FasilitasID FROM @FasilitasTemp)
END  

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllKabupaten]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllKabupaten] 	
(
	@IDProvinsi int = 0
)
AS
BEGIN
	SELECT IDKabupaten,Nama,IDProvinsi FROM kabupaten A
	WHERE A.IDProvinsi = @IDProvinsi--(CASE WHEN @IDProvinsi = 0 THEN A.IDProvinsi ELSE @IDProvinsi END)  

END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllKecamatan]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllKecamatan] 	
(
	@IDKabupaten int = 0
)
AS
BEGIN
	SELECT IDKecamatan,Nama,IDKabupaten FROM kecamatan A
	WHERE A.IDKabupaten = @IDKabupaten --(CASE WHEN @IDKabupaten = 0 THEN A.IDKabupaten ELSE @IDKabupaten END)  

END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllLingkungan]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_GetAllLingkungan] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsLingkungan
		ORDER BY ID		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllPaymentBulan]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_GetAllPaymentBulan] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsPaymentBulan
		ORDER BY ID		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllProvinsi]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllProvinsi] 	
(
	@IDProvinsi int = 0
)
AS
BEGIN
	SELECT IDProvinsi, Nama FROM provinsi A
	WHERE A.IDProvinsi = (CASE WHEN @IDProvinsi = 0 THEN A.IDProvinsi ELSE @IDProvinsi END)  

END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllSatuanHarga]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_GetAllSatuanHarga] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblSatuanHarga
		ORDER BY ID		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllTipeKos]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_GetAllTipeKos] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsTipeKos
		ORDER BY ID		
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllTipeUser]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified by Sony, 6 Apr 2017
CREATE PROCEDURE [dbo].[LIK_GetAllTipeUser] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsTipeUser
		ORDER BY ID		
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetFormKosFavorit]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT * FROM tblUser
--LIK_InsertFormKosFavorit '10','2'
ALTER PROCEDURE [dbo].[LIK_GetFormKosFavorit] 
(   
	@FormKosID bigint,
	@UserID bigint
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	SELECT FormKosID, UserID, AuditActivity FROM tblFormKosFavorit 
	WHERE FormKosID = @FormKosID AND UserID = @UserID
		AND AuditActivity <>'D'
	
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetHighestFormKosByArea]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--UPDATE TBLFORMKOS SET AUDITTIME = '2017-02-10' WHERE ID =10

--LIK_GetAllFormKosByLocation   -6.136299, 106.800735,0,0,'1,3,4,6'  
  
--LIK_GetKosFasilitasOnlyByFormID '10'  
--tblformkos  
--tbltrFormKosHarga  
--tbltrFormKosFasilitas  
--LIK_GetMyFavoriteForm '1'
--LIK_GetHighestFormKosByArea '1'
ALTER PROCEDURE [dbo].[LIK_GetHighestFormKosByArea]      
(                    
 @AreaID int   
)      
AS    
BEGIN    
 SELECT TOP 1 'Latest' AS ScoreH, A.ID, A.Kode, A.Nama, A.ImageID,CONVERT(VARCHAR(MAX), A.Alamat) AS Alamat, B.Harga, C.Nama AS SatuanHarga, A.Altitude, A.Longitude, A.FavCount
 FROM tblFormKos A    
 LEFT JOIN tblTrFormKosHarga B    
  ON A.ID = B.FormKosID AND B.SatuanHargaID = 3    
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID    
 WHERE A.AreaID = @AreaID
 ORDER BY A.AuditTime DESC
  
 SELECT TOP 1 'Favorit' AS ScoreH, A.ID, A.Kode, A.Nama, A.ImageID,CONVERT(VARCHAR(MAX), A.Alamat) AS Alamat, B.Harga, C.Nama AS SatuanHarga, A.Altitude, A.Longitude, COUNT(D.UserID) FavCount
 FROM tblFormKos A    
 LEFT JOIN tblTrFormKosHarga B    
  ON A.ID = B.FormKosID AND B.SatuanHargaID = 3    
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID    
 INNER JOIN tblFormKosFavorit D ON A.ID = D.FormKosID AND D.AuditActivity <> 'D'
 WHERE A.AreaID = @AreaID
 GROUP BY  A.ID, A.Kode, A.Nama, A.ImageID, B.Harga, CONVERT(VARCHAR(MAX), A.Alamat), C.Nama, A.Altitude, A.Longitude
 ORDER BY COUNT(D.UserID) DESC

 SELECT TOP 1 'Banyak dilihat' AS ScoreH, A.ID, A.Kode, A.Nama, A.ImageID,CONVERT(VARCHAR(MAX), A.Alamat) AS Alamat, B.Harga, C.Nama AS SatuanHarga, A.Altitude, A.Longitude, A.FavCount
 FROM tblFormKos A    
 LEFT JOIN tblTrFormKosHarga B    
  ON A.ID = B.FormKosID AND B.SatuanHargaID = 3    
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID    
 WHERE A.AreaID = @AreaID
 ORDER BY A.ViewCount DESC
END 

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosDefaultPhotoByFormID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetKosDefaultPhotoByFormID] 	
(
	@FormKosID BIGINT = 0
)
AS
BEGIN
	SELECT FormKosID,FilePath,AuditActivity,AuditTime
	FROM tblTrFormKosDefaultPhoto A
	WHERE A.FormKosID = (CASE WHEN @FormKosID = 0 THEN A.FormKosID ELSE @FormKosID END)
		AND A.AuditActivity <> 'D'
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosFasilitasByFormID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_GetKosFasilitasByFormID] 	
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
/****** Object:  StoredProcedure [dbo].[LIK_GetKosFasilitasOnlyByFormID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[LIK_GetKosFasilitasOnlyByFormID] 	
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
/****** Object:  StoredProcedure [dbo].[LIK_GetKosHargaByFormID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosKamarByFormID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	ORDER BY A.OrderID
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetKosLingkunganByFormID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[LIK_GetKosLingkunganByFormID] 	
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
/****** Object:  StoredProcedure [dbo].[LIK_GetKosLingkunganOnlyByFormID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[LIK_GetKosLingkunganOnlyByFormID] 	
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
/****** Object:  StoredProcedure [dbo].[LIK_GetKosTeleponByFormID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LIK_GetKosTeleponByFormID] 	
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
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetMaxBanner]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified by sony, 5 apr 2017
CREATE PROCEDURE [dbo].[LIK_GetMaxBanner] 	
AS
BEGIN
	DECLARE @prefix varchar(10)
	SET @prefix = 'BN-'
	IF ((SELECT Max(Kode)
		FROM tblBanner) IS NOT NULL)
	BEGIN
		DECLARE @maxCode bigint
		SET @maxCode = (SELECT CONVERT(bigint, RIGHT(MAX(KODE),3)) FROM tblBanner)
		DECLARE @prioritas int
		SET @prioritas = (SELECT MAX(Prioritas) FROM tblBanner)
		SELECT @maxCode + 1 AS ID, @prefix+ right('00'+convert(varchar(3), @maxCode + 1), 3) as Kode, @prioritas + 1 AS Prioritas
		
	END
	ELSE
	BEGIN
		SELECT Convert(bigint,1) AS ID , @prefix+ right('00'+convert(varchar(3), 1),3) as Kode
		--SELECT @prefix + '0000001'
	END
		
END
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetMaxFormKos]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_GetMaxFormKos] 	
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
/****** Object:  StoredProcedure [dbo].[LIK_GetMyFavoriteForm]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_GetAllFormKosByLocation   -6.136299, 106.800735,0,0,'1,3,4,6'  
  
--LIK_GetKosFasilitasOnlyByFormID '10'  
--tblformkos  
--tbltrFormKosHarga  
--tbltrFormKosFasilitas  
--LIK_GetMyFavoriteForm '2'
ALTER PROCEDURE [dbo].[LIK_GetMyFavoriteForm]      
(                    
 @UserID bigint   
)      
AS    
BEGIN    
  
 SELECT TOP 3 A.ID, A.Kode, A.Nama, A.ImageID,CONVERT(VARCHAR(MAX), A.Alamat) AS Alamat, B.Harga, C.Nama AS SatuanHarga, A.Altitude, A.Longitude
 FROM tblFormKos A    
 LEFT JOIN tblTrFormKosHarga B    
  ON A.ID = B.FormKosID AND B.SatuanHargaID = 3    
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID    
 INNER JOIN tblFormKosFavorit D ON A.ID = D.FormKosID AND D.AuditActivity <> 'D'
 WHERE D.UserID = @UserID 
 ORDER BY D.AUDITTIME DESC
END 

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetPriceRangeByKecamatan]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified 18 Apr 2017
CREATE PROCEDURE [dbo].[LIK_GetPriceRangeByKecamatan]    
(                  
	@NamaProvinsi varchar(50) = '',
	@NamaKabupaten varchar(50) = '',
	@NamaKecamatan varchar(50) = '',
	@SatuanHargaID int = 3
)    
AS  
BEGIN  

 SELECT DISTINCT Min(B.Harga) AS Minimum, Max(B.Harga) AS Maximum
 FROM tblFormKos A  
 LEFT JOIN tblTrFormKosHarga B  
  ON A.ID = B.FormKosID AND B.SatuanHargaID = @SatuanHargaID  
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID  
 LEFT JOIN tblTrFormKosHarga D ON A.ID = D.FormKosID
 LEFT JOIN tblTrFormKosFasilitas E ON A.ID = E.FormKosID AND E.Status = 1
  WHERE D.SatuanHargaID = @SatuanHargaID --AND A.StatusApproval =1
	AND A.NamaProvinsi LIKE (CASE WHEN @NamaProvinsi = '' THEN A.NamaProvinsi ELSE '%' + @NamaProvinsi + '%' END)
	AND A.NamaKabupaten LIKE (CASE WHEN @NamaKabupaten = '' THEN A.NamaKabupaten ELSE '%' + @NamaKabupaten + '%' END)
	AND A.NamaKecamatan LIKE (CASE WHEN @NamaKecamatan = '' THEN A.NamaKecamatan ELSE '%' + @NamaKecamatan + '%' END)
   --AND A.TipeKosID = (CASE WHEN @TipeKosId = 0 THEN A.TipeKosID ELSE @TipeKosId END)  
END  


GO
/****** Object:  StoredProcedure [dbo].[LIK_GetUser]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified by Sony, 6 Apr 2017
ALTER PROCEDURE [dbo].[LIK_GetUser] --'adminsystem@lihatkos.com','abcde!!12345'
(                
	@UserID bigint
)  
AS
BEGIN
	
	SELECT B.ID, A.Email, B.UserName, A.Password,  A.TipeUser AS TipeUserID, C.Nama AS TipeUser,B.LastActivityDate,
		A.Aktif, A.LastChangeAktifDate FROM tblMembership A WITH (NOLOCK)
		LEFT JOIN tblUser B WITH (NOLOCK)
		 ON A.UserID = B.ID
		LEFT JOIN tblMSTipeUser C WITH (NOLOCK)
		 ON A.TipeUser = C.ID
	WHERE a.UserID = (CASE WHEN @UserID = 0 THEN a.UserID ELSE @UserID END)
	--WHERE A.ID = (CASE WHEN @ID = 0 THEN A.ID ELSE @ID END)
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosFasilitas]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_InsertFormKosFasilitas] 
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
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosFavorit]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_GetFormKosFavorit '10','1'
--tblFormKosFavorit
--tbluser
--LIK_InsertFormKosFavorit '10','1'
ALTER PROCEDURE [dbo].[LIK_InsertFormKosFavorit]   
(     
 @FormKosID bigint,  
 @UserID bigint  
)    
AS  
BEGIN  
 --SELECT * FROM tblArea  
 --BEGIN TRAN  
 --begin transaction  
 IF EXISTS (SELECT FormKosID,UserID FROM tblFormKosFavorit WHERE FormKosID = @FormKosID AND UserID = @UserID)  
 BEGIN   
  UPDATE tblFormKosFavorit SET AuditActivity ='U', AuditTime = GETDATE()  
  WHERE FormKosID = @FormKosID AND UserID = @UserID  

  SELECT 0
 END  
 ELSE  
 BEGIN  
  INSERT INTO tblFormKosFavorit (FormKosID,UserID,AuditTime,AuditActivity)  
  VALUES(@FormKosID,@UserID,GETDATE(),'I')  

  SELECT 1
 END  
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosHarga]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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


GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosKamar]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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

GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosLingkungan]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIK_InsertFormKosLingkungan] 
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
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosTelepon]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertUserActivation]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
GO
/****** Object:  StoredProcedure [dbo].[LIK_UpdateBannerByID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_UpdateBannerByID] 
(   
	@ID int,
	@Kode varchar(50),
	@Nama varchar(250),
	@FilePath text,
	@Url text,
	@Prioritas int
)  
AS
BEGIN
	if NOT EXISTS(SELECT ID, Kode FROM tblBanner WHERE ID = @ID)
	BEGIN
		DECLARE @IDMax int
		SELECT @IDMax = max(ID) + 1 FROM tblBanner

		INSERT INTO tblBanner 
			( ID,
			  Kode,
			  Nama,
			  FilePath,
			  Url,
			  Prioritas )
		VALUES ( @IDMax,
				 @Kode,
				 @Nama,
				 @FilePath,
				 @Url,
				 @Prioritas ) 
	END	
	ELSE
	BEGIN
		UPDATE tblBanner SET FilePath = @FilePath, Url = @Url
			WHERE ID = @ID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_UpdateDefaultPhotoByFormID]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_UpdateDefaultPhotoByFormID] 
(   
	@FormKosID bigint,
	@FilePath text
)  
AS
BEGIN
	if NOT EXISTS(SELECT FilePath FROM tblTrFormKosDefaultPhoto WHERE FormKosID = @FormKosID AND AuditActivity <> 'D')
	BEGIN
		INSERT INTO tblTrFormKosDefaultPhoto 
			( FormKosID,
			  FilePath,
			  AuditActivity,
			  AuditTime )
		VALUES ( @FormKosID,
				 @FilePath,
				 'I',
				 GETDATE() ) 
	END	
	ELSE
	BEGIN
		UPDATE tblTrFormKosDefaultPhoto SET FilePath = @FilePath, AuditActivity = 'U', AuditTime = GETDATE()
			WHERE FormKosID = @FormKosID
	END
END


GO
/****** Object:  StoredProcedure [dbo].[LIK_UpdateFormKosAktif]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified by Sony, 6 Apr 2017
--LIK_InsertFormKosView '10'
CREATE PROCEDURE [dbo].[LIK_UpdateFormKosAktif] 
(   
	@FormKosID bigint,
	@StatusAktif int,
	@AuditUserName varchar(50) = null
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	UPDATE tblFormKos SET AuditTime = GETDATE(),
		StatusAktif = @StatusAktif, 
		LastActiveDate = ( CASE WHEN @StatusAktif = 1 THEN GETDATE() ELSE LastActiveDate END),
		AuditUserName = @AuditUserName
		WHERE ID = @FormKosID
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_UpdateFormKosApproval]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified by Sony, 6 Apr 2017
--LIK_InsertFormKosView '10'
ALTER PROCEDURE [dbo].[LIK_UpdateFormKosApproval] 
(   
	@FormKosID bigint,
	@StatusApproval int,
	@AuditUserName varchar(50) = null
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	UPDATE tblFormKos SET StatusApproval = @StatusApproval, AuditTime = GETDATE(),
		StatusAktif = 1, LastActiveDate = GETDATE(), AuditUserName = @AuditUserName
		WHERE ID = @FormKosID
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_UpdateFormKosView]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_InsertFormKosView '10'
ALTER PROCEDURE [dbo].[LIK_UpdateFormKosView] 
(   
	@FormKosID bigint
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	UPDATE tblFormKos SET ViewCount += 1
		WHERE ID = @FormKosID
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_UpdateUser]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_UpdateUser] 
(   
	@ID int,
	@UserName varchar(500),
	@LastActivityDate datetime,
	@Email varchar(500),
	@TipeUser int
)  
AS
BEGIN
	BEGIN TRAN

	UPDATE tblUser
	SET UserName = @UserName, LastActivityDate = @LastActivityDate
	WHERE ID = @ID

	UPDATE tblMembership 
	SET Email = @Email, TipeUser = @TipeUser
	WHERE UserID = @ID

	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_UpdateUserAktif]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified by Sony, 6 Apr 2017
CREATE PROCEDURE [dbo].[LIK_UpdateUserAktif] 
(   
	@ID int,
	@Aktif int
)  
AS
BEGIN
	BEGIN TRAN

	UPDATE tblMembership 
	SET Aktif = @Aktif, LastChangeAktifDate = GETDATE()
	WHERE UserID = @ID

	COMMIT
END

GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Split](@String varchar(8000), @Delimiter char(1))       
returns @temptable TABLE (items varchar(8000))       
as       
begin       
    declare @idx int       
    declare @slice varchar(8000)       
      
    select @idx = 1       
        if len(@String)<1 or @String is null  return       
      
    while @idx!= 0       
    begin       
        set @idx = charindex(@Delimiter,@String)       
        if @idx!=0       
            set @slice = left(@String,@idx - 1)       
        else       
            set @slice = @String       
          
        if(len(@slice)>0)  
            insert into @temptable(Items) values(@slice)       
  
        set @String = right(@String,len(@String) - @idx)       
        if len(@String) = 0 break       
    end   
return       
end   

GO
/****** Object:  Table [dbo].[tblArea]    Script Date: 4/25/2017 6:36:30 AM ******/
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
/****** Object:  Table [dbo].[tblBanner]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblFormKos]    Script Date: 4/25/2017 6:36:31 AM ******/
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
	[ViewCount] [bigint] NOT NULL,
	[FavCount] [bigint] NOT NULL,
	[UserID] [bigint] NULL,
	[AuditTime] [datetime] NULL,
	[StatusApproval] [int] NULL,
	[NamaProvinsi] [varchar](50) NULL,
	[NamaKabupaten] [varchar](50) NULL,
	[NamaKecamatan] [varchar](50) NULL,
	[NamaKelurahan] [varchar](50) NULL,
	[AuditUserName] [varchar](50) NULL,
	[StatusAktif] [int] NULL,
	[LastActiveDate] [datetime] NULL,
 CONSTRAINT [PK_tblformKos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFormKosFavorit]    Script Date: 4/25/2017 6:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFormKosFavorit](
	[FormKosID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[AuditTime] [datetime] NULL,
	[AuditActivity] [char](1) NOT NULL,
 CONSTRAINT [PK_tblFormKosFavorit] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblMembership]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblMsFasilitas]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblMsLingkungan]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblMsPaymentBulan]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblMsTipeKos]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblMsTipeUser]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblSatuanHarga]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblTempatKos]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblTrFasilitas]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblTrFormKosDefaultPhoto]    Script Date: 4/25/2017 6:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTrFormKosDefaultPhoto](
	[FormKosID] [bigint] NOT NULL,
	[FilePath] [text] NULL,
	[AuditActivity] [char](1) NULL,
	[AuditTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTrFormKosFasilitas]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblTrFormKosHarga]    Script Date: 4/25/2017 6:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrFormKosHarga](
	[FormKosID] [bigint] NOT NULL,
	[SatuanHargaID] [int] NOT NULL,
	[Harga] [decimal](18, 2) NULL,
	[MinimumBayar] [int] NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblTrFormKosHarga] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[SatuanHargaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrFormKosKamar]    Script Date: 4/25/2017 6:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTrFormKosLingkungan]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblTrFormKosTlp]    Script Date: 4/25/2017 6:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTrFormKosTlp](
	[FormKosID] [bigint] NOT NULL,
	[PhoneID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Value] [varchar](50) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblTrFormKosTlp] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[PhoneID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTrKosHarga]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 4/25/2017 6:36:31 AM ******/
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
/****** Object:  Table [dbo].[tblUserActivation]    Script Date: 4/25/2017 6:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserActivation](
	[UserID] [bigint] NOT NULL,
	[ActivationCode] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblUserActivation] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (1, N'FK-0000001', N'nama 1', N'desc', N'alamat', 1, CAST(-6.288083 AS Decimal(9, 6)), CAST(106.593590 AS Decimal(9, 6)), 0, N'pemilik', N'alamat', N'533424', N'pengelola', NULL, N'34654656', 3, N'ket min bayar', 4, CAST(248.0000 AS Decimal(9, 4)), 1, 1, 0, N'lain lain', 0, 0, 1, CAST(0x0000A74D009FCE64 AS DateTime), 1, N'', N'', N'', N'', N'admin', 1, CAST(0x0000A74D009FCE64 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (2, N'FK-0000002', N'nama 2', N'desc', N'alamat', 1, CAST(-6.288083 AS Decimal(9, 6)), CAST(106.593590 AS Decimal(9, 6)), 0, N'pemilik', N'alamat', N'533424', N'pengelola', NULL, N'34654656', 3, N'ket min bayar', 4, CAST(248.0000 AS Decimal(9, 4)), 1, 1, 1, N'lain lain', 0, 0, 1, CAST(0x0000A73300195CB9 AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (3, N'FK-0000003', N'nama 3', N'desc', N'alamat', 1, CAST(-6.288083 AS Decimal(9, 6)), CAST(106.593590 AS Decimal(9, 6)), 0, N'pemilik', N'alamat', N'533424', N'pengelola', NULL, N'34654656', 3, N'ket min bayar', 4, CAST(248.0000 AS Decimal(9, 4)), 1, 1, 1, N'lain lain', 0, 0, 1, CAST(0x0000A70F00000000 AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (4, N'FK-0000004', N'nama 4', N'desc', N'alamat bandung', 2, CAST(-6.908266 AS Decimal(9, 6)), CAST(107.609222 AS Decimal(9, 6)), 0, N'pemilik', N'alamat pemilik', N'34234', N'pengelola', NULL, N'374827348', 24, N'ket min bayar', 4, CAST(56.6000 AS Decimal(9, 4)), 2, 1, 1, N'asdf', 0, 0, 1, CAST(0x0000A71000000000 AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (5, N'FK-0000005', N'nama 5', N'desc', N'alamat test', 1, CAST(-6.193758 AS Decimal(9, 6)), CAST(106.634613 AS Decimal(9, 6)), 0, N'nama pemilik', N'alamat pemilik', N'84738478', N'nama pengelola', NULL, N'23847289374987', 9, N'ket min bayar', 45, CAST(700.9600 AS Decimal(9, 4)), 1, 43, 0, N'test lain lain', 0, 0, 1, CAST(0x0000A71100000000 AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (6, N'FK-0000006', N'test name 1', N'desc', N'bandengan', 1, CAST(-6.136259 AS Decimal(9, 6)), CAST(106.803459 AS Decimal(9, 6)), 0, N'nama', N'alamat', N'23847', N'nama pengelola', NULL, N'38473874', 2, N'ket min bayar', 12, CAST(25.9000 AS Decimal(9, 4)), 3, 2, 0, N'ket lain lain', 0, 0, 1, CAST(0x0000A71200000000 AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (7, N'FK-0000007', N'test name 2', N'desc', N'bandengan', 1, CAST(-6.117821 AS Decimal(9, 6)), CAST(106.786293 AS Decimal(9, 6)), 0, N'nama2', N'alamat', N'23847', N'nama pengelola', NULL, N'38473874', 2, N'ket min bayar', 12, CAST(25.9000 AS Decimal(9, 4)), 3, 2, 0, N'ket lain lain2', 0, 0, 1, CAST(0x0000A71300000000 AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (8, N'FK-0000008', N'nama 6', N'test desc', N'bandeng', 1, CAST(-6.136299 AS Decimal(9, 6)), CAST(106.800735 AS Decimal(9, 6)), 0, N'nama pemilik2', N'alamat jpemilij', N'238478', N'nama pengelola 2', NULL, N'5455', 4, N'ket min bayar', 24, CAST(44.8000 AS Decimal(9, 4)), 3, 3, 0, N'ket lain lain', 0, 0, 1, CAST(0x0000A71400000000 AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (9, N'FK-0000009', N'nama 7', N'test desc', N'bandeng', 1, CAST(-6.136299 AS Decimal(9, 6)), CAST(106.800735 AS Decimal(9, 6)), 0, N'nama pemilik2', N'alamat jpemilij', N'238478', N'nama pengelola 2', NULL, N'5455', 4, N'ket min bayar', 24, CAST(44.8000 AS Decimal(9, 4)), 3, 3, 0, N'ket lain lain', 1, 0, 1, CAST(0x0000A74D00844539 AS DateTime), 1, N'', N'', N'', N'', N'admin', 1, CAST(0x0000A74D00844539 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (10, N'FK-0000010', N'nama 8', N'test desc', N'bandeng', 1, CAST(-6.136299 AS Decimal(9, 6)), CAST(106.800735 AS Decimal(9, 6)), 0, N'nama pemilik2', N'alamat jpemilij', N'238478', N'nama pengelola 2', NULL, N'5455', 4, N'ket min bayar', 24, CAST(44.8000 AS Decimal(9, 4)), 3, 3, 0, N'ket lain lain', 18, 2, 1, CAST(0x0000A71600000000 AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (11, N'FK-0000011', N'nama kos 9', N'desc 3434', N'tebet barat ', 1, CAST(-6.240058 AS Decimal(9, 6)), CAST(106.851745 AS Decimal(9, 6)), 0, N'sony', N'alamat s343434', N'3432423434', N'sony', NULL, N'3434343', 5, N'dfdf', 35, CAST(25.0000 AS Decimal(9, 4)), 1, 3, 0, N'lain 343434', 26, 0, 1, CAST(0x0000A73200F14405 AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (12, N'FK-0000012', N'namakos 11', N'kos bunga', N'dekat binus ', 1, CAST(-6.201857 AS Decimal(9, 6)), CAST(106.781434 AS Decimal(9, 6)), 0, N'sony', N'blablabla', N'38448384', N'sony', NULL, N'839483748', 3, N'untuk penghuni pertama', 11, CAST(24.0000 AS Decimal(9, 4)), 3, 4, 0, N'tidak ada', 2, 0, 1, CAST(0x0000A73200F13A7B AS DateTime), 1, N'', N'', N'', N'', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (13, N'FK-0000013', N'Kos Pervert', N'Kos keren buat party', N'setiabudi', 1, CAST(-6.215158 AS Decimal(9, 6)), CAST(106.830156 AS Decimal(9, 6)), 0, N'Randy & Sony', N'PIK', N'082111111818', N'Randy', NULL, N'082111111818', 1, N'', 25, CAST(20.0000 AS Decimal(9, 4)), 3, 20, 0, N'', 2, 0, 3, CAST(0x0000A73300273F26 AS DateTime), 1, N'', N'', N'', N'', N'3', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (14, N'FK-0000014', N'Kos Waduk Pluit', N'blabla', N'Muara Baru Toko, Penjaringan, Kota Jakarta Utara, DKI Jakarta, Indonesia', 1, CAST(-6.129274 AS Decimal(9, 6)), CAST(106.787121 AS Decimal(9, 6)), 0, N'admin', NULL, NULL, NULL, NULL, NULL, 1, N'eijfijf', 22, CAST(50.0000 AS Decimal(9, 4)), 1, 20, 0, N'blabla', 0, 0, 1, CAST(0x0000A7410143D051 AS DateTime), 1, N'DKI Jakarta', N'Jakarta Utara', N'Penjaringan', N'Penjaringan', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (15, N'FK-0000015', N'Kos Waduk Ciputat', N'blabla', N'Rumah Sakit Buah Hati Ciputat, Serua Indah, Kota Tangerang Selatan, Banten, Indonesia', 1, CAST(-6.312737 AS Decimal(9, 6)), CAST(106.732795 AS Decimal(9, 6)), 0, N'admin', NULL, NULL, NULL, NULL, NULL, 1, N'eijfijf', 22, CAST(50.0000 AS Decimal(9, 4)), 1, 20, 0, N'blabla', 0, 0, 1, CAST(0x0000A74101446A64 AS DateTime), 1, N'Banten', N'Tangerang Selatan', N'Ciputat', N'Serua Indah', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (16, N'FK-0000016', N'Kos Waduk Cengkareng', N'blabla', N'Cengkareng Residence, Jalan Siantan Raya, Cengkareng Barat, Kota Jakarta Barat, DKI Jakarta, Indonesia', 1, CAST(-6.147073 AS Decimal(9, 6)), CAST(106.722788 AS Decimal(9, 6)), 0, N'admin', NULL, NULL, NULL, NULL, NULL, 1, N'eijfijf', 22, CAST(50.0000 AS Decimal(9, 4)), 1, 20, 0, N'blabla', 1, 0, 1, CAST(0x0000A7410144AF6B AS DateTime), 1, N'DKI Jakarta', N'Jakarta Barat', N'Cengkareng', N'Cengkareng Barat', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (17, N'FK-0000017', N'Kos Setiabudi 251', N'33jfjsiefj', N'Kost Setiabudi 251, Jalan Taman Setia Budi Timur, Setia Budi, Kota Jakarta Selatan, DKI Jakarta, Indonesia', 1, CAST(-6.209796 AS Decimal(9, 6)), CAST(106.827435 AS Decimal(9, 6)), 0, N'admin', NULL, NULL, NULL, NULL, NULL, 1, N'efef', 22, CAST(20.0000 AS Decimal(9, 4)), 1, 2, 0, N'efsf', 2, 0, 1, CAST(0x0000A741014B6481 AS DateTime), 1, N'DKI Jakarta', N'Jakarta Selatan', N'Kecamatan Setiabudi', N'Setia Budi', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (18, N'FK-0000018', N'Kos Macan Ciputat', N'asjifejifef', N'Jalan Ciputat Raya, Kebayoran Lama Utara, Kota Jakarta Selatan, DKI Jakarta, Indonesia', 1, CAST(-6.246077 AS Decimal(9, 6)), CAST(106.779995 AS Decimal(9, 6)), 0, N'admin', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(0.0000 AS Decimal(9, 4)), 1, 0, 0, N'fefef', 1, 0, 1, CAST(0x0000A74400EFA0DB AS DateTime), 1, N'DKI Jakarta', N'Jakarta Selatan', N'Kebayoran Lama', N'Kebayoran Lama Utara', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [ViewCount], [FavCount], [UserID], [AuditTime], [StatusApproval], [NamaProvinsi], [NamaKabupaten], [NamaKecamatan], [NamaKelurahan], [AuditUserName], [StatusAktif], [LastActiveDate]) VALUES (19, N'FK-0000019', N'Kos Binus 2', N'iejifjiejfie', N'Tanjung Duren Selatan, Kota Jakarta Barat, DKI Jakarta, Indonesia', 1, CAST(-6.178820 AS Decimal(9, 6)), CAST(106.789816 AS Decimal(9, 6)), 0, N'admin', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(0.0000 AS Decimal(9, 4)), 3, 0, 0, N'jeijifjeff', 5, 0, 1, CAST(0x0000A74400F33169 AS DateTime), 1, N'DKI Jakarta', N'Jakarta Barat', N'Grogol petamburan', N'Tanjung Duren Selatan', N'1', 1, CAST(0x0000A74D007E7AB7 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblFormKos] OFF
INSERT [dbo].[tblFormKosFavorit] ([FormKosID], [UserID], [AuditTime], [AuditActivity]) VALUES (9, 1, CAST(0x0000A72B010D524E AS DateTime), N'I')
INSERT [dbo].[tblFormKosFavorit] ([FormKosID], [UserID], [AuditTime], [AuditActivity]) VALUES (10, 1, NULL, N'I')
INSERT [dbo].[tblFormKosFavorit] ([FormKosID], [UserID], [AuditTime], [AuditActivity]) VALUES (10, 2, NULL, N'U')
INSERT [dbo].[tblMembership] ([UserID], [Email], [Password], [PasswordFormat], [PasswordSalt], [TipeUser], [Aktif], [IsApproved], [IsLockedout], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastChangeAktifDate], [LastLockedoutDate], [FailedPasswordAttemptCount], [Comment]) VALUES (1, N'adminsystem@lihatkos.com', N'1', 1, N'1', 1, 1, 1, 0, CAST(0x0000A71A009B8706 AS DateTime), CAST(0x0000A71A009B8706 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), CAST(0x0000A71A009B8706 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, NULL)
INSERT [dbo].[tblMembership] ([UserID], [Email], [Password], [PasswordFormat], [PasswordSalt], [TipeUser], [Aktif], [IsApproved], [IsLockedout], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastChangeAktifDate], [LastLockedoutDate], [FailedPasswordAttemptCount], [Comment]) VALUES (2, N'sony.ss4@gmail.com', N'asdf12345', 1, N'1', 2, 1, 1, 0, CAST(0x0000A72700AE7A8B AS DateTime), CAST(0x0000A72700AE7A8B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), CAST(0x0000A72700AE7A8B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, NULL)
INSERT [dbo].[tblMembership] ([UserID], [Email], [Password], [PasswordFormat], [PasswordSalt], [TipeUser], [Aktif], [IsApproved], [IsLockedout], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastChangeAktifDate], [LastLockedoutDate], [FailedPasswordAttemptCount], [Comment]) VALUES (3, N'rgunawan1@gmail.com', N'1234', 1, N'1', 2, 1, 1, 0, CAST(0x0000A7330015D55A AS DateTime), CAST(0x0000A7330015D55A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), CAST(0x0000A7330015D55A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, NULL)
INSERT [dbo].[tblMembership] ([UserID], [Email], [Password], [PasswordFormat], [PasswordSalt], [TipeUser], [Aktif], [IsApproved], [IsLockedout], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastChangeAktifDate], [LastLockedoutDate], [FailedPasswordAttemptCount], [Comment]) VALUES (4, N'chrisna.512@gmail.com', N'1234', 1, N'1', 2, 1, 1, 0, CAST(0x0000A73300173429 AS DateTime), CAST(0x0000A73300173429 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), CAST(0x0000A73300173429 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, NULL)
INSERT [dbo].[tblMembership] ([UserID], [Email], [Password], [PasswordFormat], [PasswordSalt], [TipeUser], [Aktif], [IsApproved], [IsLockedout], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastChangeAktifDate], [LastLockedoutDate], [FailedPasswordAttemptCount], [Comment]) VALUES (5, N'heldy.arifien@gmail.com', N'1234', 1, N'1', 2, 1, 1, 0, CAST(0x0000A73300175F29 AS DateTime), CAST(0x0000A73300175F29 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), CAST(0x0000A73300175F29 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, NULL)
INSERT [dbo].[tblMembership] ([UserID], [Email], [Password], [PasswordFormat], [PasswordSalt], [TipeUser], [Aktif], [IsApproved], [IsLockedout], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastChangeAktifDate], [LastLockedoutDate], [FailedPasswordAttemptCount], [Comment]) VALUES (6, N'ferawati.hioe@gmail.com', N'1234', 1, N'1', 2, 1, 1, 0, CAST(0x0000A7330020DDCD AS DateTime), CAST(0x0000A7330020DDCD AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), CAST(0x0000A7330020DDCD AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, NULL)
INSERT [dbo].[tblMembership] ([UserID], [Email], [Password], [PasswordFormat], [PasswordSalt], [TipeUser], [Aktif], [IsApproved], [IsLockedout], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastChangeAktifDate], [LastLockedoutDate], [FailedPasswordAttemptCount], [Comment]) VALUES (15, N'sony_ss4@yahoo.com', N'asdf12345', 1, N'1', 2, 1, 1, 0, CAST(0x0000A73E0124BCD4 AS DateTime), CAST(0x0000A73E0124BCD4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), CAST(0x0000A73E0124BCD4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, NULL)
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
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (7, N'AL-007', N'Pendidikan', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (9, N'AL-009', N'Halte Bus', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (10, N'AL-010', N'Pos Ojek', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (11, N'AL-011', N'Shopping Mall', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (12, N'AL-012', N'Bioskop', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (13, N'AL-013', N'Stasiun Kereta', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (14, N'AL-014', N'Gedung Kantor', NULL)
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

INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'TK-001', N'Pria', NULL)
INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'TK-002', N'Wanita', NULL)
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
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (0, 1, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (0, 2, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (0, 3, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (0, 4, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (0, 5, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (0, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (0, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 1, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 2, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 3, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 4, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 5, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (11, 1, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (11, 2, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (11, 3, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (11, 4, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (11, 5, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (11, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (11, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (12, 1, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (12, 2, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (12, 3, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (12, 4, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (12, 5, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (12, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (12, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (13, 1, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (13, 2, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (13, 3, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (13, 4, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (13, 5, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (13, 6, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (13, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (14, 1, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (14, 2, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (14, 3, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (14, 4, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (14, 5, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (14, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (14, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (15, 1, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (15, 2, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (15, 3, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (15, 4, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (15, 5, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (15, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (15, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (16, 1, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (16, 2, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (16, 3, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (16, 4, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (16, 5, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (16, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (16, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (17, 1, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (17, 2, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (17, 3, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (17, 4, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (17, 5, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (17, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (17, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (18, 1, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (18, 2, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (18, 3, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (18, 4, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (18, 5, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (18, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (18, 7, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (19, 1, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (19, 2, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (19, 3, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (19, 4, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (19, 5, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (19, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (19, 7, 0)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (0, 1, CAST(50000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (0, 2, CAST(300000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (0, 3, CAST(1000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (0, 4, CAST(13000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (1, 3, CAST(1200000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (2, 3, CAST(1150000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (3, 3, CAST(1100000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (4, 3, CAST(1050000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (5, 3, CAST(1000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (6, 3, CAST(950000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (7, 3, CAST(900000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (8, 3, CAST(12000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (9, 3, CAST(12000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (10, 1, CAST(25000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (10, 2, CAST(250000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (10, 3, CAST(1000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (10, 4, CAST(12000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (11, 1, CAST(40000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (11, 2, CAST(250000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (11, 3, CAST(1300000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (11, 4, CAST(14000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (12, 1, CAST(35000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (12, 2, CAST(200000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (12, 3, CAST(1150000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (12, 4, CAST(14500000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (13, 1, CAST(100000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (13, 2, CAST(500000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (13, 3, CAST(1500000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (13, 4, CAST(15000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (14, 1, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (14, 2, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (14, 3, CAST(2000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (14, 4, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (15, 1, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (15, 2, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (15, 3, CAST(2000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (15, 4, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (16, 1, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (16, 2, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (16, 3, CAST(2000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (16, 4, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (17, 1, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (17, 2, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (17, 3, CAST(3000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (17, 4, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (18, 1, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (18, 2, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (18, 3, CAST(1230000.00 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (18, 4, CAST(14000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (19, 1, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (19, 2, CAST(0.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (19, 3, CAST(1000000.00 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [MinimumBayar], [Deskripsi]) VALUES (19, 4, CAST(12000000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[tblTrFormKosKamar] ([FormKosID], [OrderID], [Luas], [FasilitasKamar], [JmlKamar], [KamarKosong], [Deskripsi]) VALUES (18, 0, N'24', 2, 4, 1, NULL)
INSERT [dbo].[tblTrFormKosKamar] ([FormKosID], [OrderID], [Luas], [FasilitasKamar], [JmlKamar], [KamarKosong], [Deskripsi]) VALUES (19, 1, N'12', 2, 5, 2, NULL)
INSERT [dbo].[tblTrFormKosKamar] ([FormKosID], [OrderID], [Luas], [FasilitasKamar], [JmlKamar], [KamarKosong], [Deskripsi]) VALUES (19, 2, N'15', 1, 4, 1, NULL)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 1, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 2, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 3, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 4, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 5, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 6, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 7, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 8, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 9, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 10, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 11, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (0, 12, 1)
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
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 1, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 2, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 3, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 4, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 5, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 6, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 7, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 8, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 9, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 10, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 11, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (11, 12, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 1, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 2, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 3, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 4, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 5, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 6, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 7, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 8, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 9, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 10, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 11, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (12, 12, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 1, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 2, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 3, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 4, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 5, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 6, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 7, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 9, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 10, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 11, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 12, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 13, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (13, 14, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 1, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 2, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 3, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 4, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 5, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 6, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 7, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 9, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 10, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 11, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 12, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 13, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (14, 14, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 1, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 2, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 3, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 4, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 5, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 6, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 7, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 9, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 10, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 11, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 12, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 13, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (15, 14, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 1, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 2, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 3, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 4, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 5, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 6, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 7, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 9, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 10, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 11, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 12, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 13, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (16, 14, 0)
GO
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 1, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 2, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 3, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 4, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 5, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 6, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 7, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 9, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 10, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 11, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 12, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 13, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (17, 14, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 1, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 2, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 3, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 4, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 5, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 6, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 7, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 9, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 10, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 11, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 12, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 13, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (18, 14, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 1, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 2, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 3, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 4, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 5, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 6, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 7, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 9, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 10, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 11, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 12, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 13, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (19, 14, 0)
INSERT [dbo].[tblTrFormKosTlp] ([FormKosID], [PhoneID], [OrderID], [Value], [Deskripsi]) VALUES (17, 2, 1, N'343444', NULL)
INSERT [dbo].[tblTrFormKosTlp] ([FormKosID], [PhoneID], [OrderID], [Value], [Deskripsi]) VALUES (18, 1, 2, N'44444', NULL)
INSERT [dbo].[tblTrFormKosTlp] ([FormKosID], [PhoneID], [OrderID], [Value], [Deskripsi]) VALUES (18, 2, 1, N'22222', NULL)
INSERT [dbo].[tblTrFormKosTlp] ([FormKosID], [PhoneID], [OrderID], [Value], [Deskripsi]) VALUES (19, 1, 2, N'55555', NULL)
INSERT [dbo].[tblTrFormKosTlp] ([FormKosID], [PhoneID], [OrderID], [Value], [Deskripsi]) VALUES (19, 2, 1, N'34344', NULL)
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([ID], [UserName], [LastActivityDate]) VALUES (1, N'administrator', CAST(0x0000A71A009B86EF AS DateTime))
INSERT [dbo].[tblUser] ([ID], [UserName], [LastActivityDate]) VALUES (2, N'sony.ss4', CAST(0x0000A72700AE7A89 AS DateTime))
INSERT [dbo].[tblUser] ([ID], [UserName], [LastActivityDate]) VALUES (3, N'Randy', CAST(0x0000A7330015D555 AS DateTime))
INSERT [dbo].[tblUser] ([ID], [UserName], [LastActivityDate]) VALUES (4, N'cepi', CAST(0x0000A73300173426 AS DateTime))
INSERT [dbo].[tblUser] ([ID], [UserName], [LastActivityDate]) VALUES (5, N'Heldy', CAST(0x0000A73300175F26 AS DateTime))
INSERT [dbo].[tblUser] ([ID], [UserName], [LastActivityDate]) VALUES (6, N'Fera', CAST(0x0000A7330020DDCB AS DateTime))
INSERT [dbo].[tblUser] ([ID], [UserName], [LastActivityDate]) VALUES (15, N'sonygunawan', CAST(0x0000A73E0124BCD4 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblUser] OFF
INSERT [dbo].[tblUserActivation] ([UserID], [ActivationCode]) VALUES (12, N'80d03044-8a9b-4b58-8ec5-050296954bd8')
ALTER TABLE [dbo].[tblFormKos] ADD  CONSTRAINT [DF_tblFormKos_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[tblFormKos] ADD  CONSTRAINT [DF_tblFormKos_FavCount]  DEFAULT ((0)) FOR [FavCount]
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




--Modified 25 Apr 2017
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
		  NamaKelurahan,
		  AuditUserName,
		  StatusAktif,
		  LastActiveDate )
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
			 @NamaKelurahan,
			 @UserID,
			 1,--StatusAktif
			 GETDATE())
	 Declare @ID int                                    
	 SET @ID = (SELECT ID FROM tblFormKos WHERE Kode = @Kode ) 

	 RETURN @ID
END

--UPDATE TBLFORMKOS SET AuditUserName = '1', StatusAktif =1, Lastactivedate=getdate()
LIK_GetKosFasilitasByFormID '1'



/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKos]    Script Date: 4/25/2017 6:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modified 26 Apr 2017
ALTER PROCEDURE [dbo].[LIK_UpdateFormKos] 
(                
	@ID bigint,
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
	@Keterangan text,
	@UserID bigint,
	@NamaProvinsi varchar(50),
	@NamaKabupaten varchar(50),
	@NamaKecamatan varchar(50),
	@NamaKelurahan varchar(50)
)  
AS
BEGIN
	--INSERT INTO tblFormKos 
	--	( Kode,
	--	  Nama,
	--	  Deskripsi,
	--	  Alamat,
	--	  AreaID,
	--	  Altitude,
	--	  Longitude,
	--	  ImageID,
	--	  NamaPemilik,
	--	  AlamatPemilik,
	--	  KontakPemilik,
	--	  NamaPengelola,
	--	  AlamatPengelola,
	--	  KontakPengelola,
	--	  MinimumBayarMonth,
	--	  MinimumBayarDesc,
	--	  JmlKamar,
	--	  LuasKamar,
	--	  TipeKosID,
	--	  JmlKamarKosong,
	--	  PetID,
	--	  --FormKosFasilitasID,
	--	  --FormKosLingkunganID,
	--	  ViewCount,
	--	  FavCount,
	--	  Keterangan,
	--	  UserID,
	--	  StatusApproval,
	--	  AuditTime,
	--	  NamaProvinsi,
	--	  NamaKabupaten,
	--	  NamaKecamatan,
	--	  NamaKelurahan )
	--VALUES ( @Kode,
	--		 @Nama,
	--		 @Deskripsi,
	--		 @Alamat,
	--		 @AreaID,
	--		 @Altitude,
	--		 @Longitude,
	--		 @ImageID,
	--		 @NamaPemilik,
	--		 @AlamatPemilik,
	--		 @KontakPemilik,
	--		 @NamaPengelola,
	--		 @AlamatPengelola,
	--		 @KontakPengelola,
	--		 @MinimumBayarMonth,
	--		 @MinimumBayarDesc,
	--		 @JmlKamar,
	--		 @LuasKamar,
	--		 @TipeKosID,
	--		 @JmlKamarKosong,
	--		 @PetID,
	--		 --@FormKosFasilitasID,
	--		 --@FormKosLingkunganID,
	--		 0,
	--		 0,
	--		 @Keterangan,
	--		 @UserID,
	--		 1,
	--		 GETDATE(),
	--		 @NamaProvinsi,
	--		 @NamaKabupaten,
	--		 @NamaKecamatan,
	--		 @NamaKelurahan )
	 Update tblFormKos 
		SET Nama = @Nama,
		    Deskripsi = @Deskripsi,
			Alamat = @Alamat,
			Altitude = @Altitude,
			Longitude = @Longitude,
			NamaPemilik = @NamaPemilik,
			TipeKosID = @TipeKosID,
			PetID = @PetID,
			Keterangan = @Keterangan,
			UserID = @UserID,
			AuditTime = GETDATE(),
			NamaProvinsi = @NamaProvinsi,
			NamaKabupaten = @NamaKabupaten,
			NamaKecamatan = @NamaKecamatan,
			NamaKelurahan = @NamaKelurahan,
			AuditUserName = @UserID
			--tblTrFormKosTlp
	 WHERE ID = @ID
	 --Declare @ID int                                    
	 --SET @ID = (SELECT ID FROM tblFormKos WHERE Kode = @Kode ) 

	 RETURN @ID
END

GO

--Created 26 Apr 2017
CREATE PROCEDURE [dbo].[LIK_DeleteKosHarga] 
(                
	@FormKosID bigint
)  
AS
BEGIN
	DELETE FROM tblTrFormKosHarga WHERE FormKosID = @FormKosID
END
GO

--Created 26 Apr 2017
CREATE PROCEDURE [dbo].[LIK_DeleteKosFasilitas] 
(                
	@FormKosID bigint
)  
AS
BEGIN
	DELETE FROM tblTrFormKosFasilitas WHERE FormKosID = @FormKosID
END
GO


--Created 26 Apr 2017
CREATE PROCEDURE [dbo].[LIK_DeleteKosLingkungan] 
(                
	@FormKosID bigint
)  
AS
BEGIN
	DELETE FROM tblTrFormKosLingkungan WHERE FormKosID = @FormKosID
END
GO

--Created 26 Apr 2017
CREATE PROCEDURE [dbo].[LIK_DeleteKosTlp] 
(                
	@FormKosID bigint
)  
AS
BEGIN
	DELETE FROM tblTrFormKosTlp WHERE FormKosID = @FormKosID
END
GO


--Created 26 Apr 2017
CREATE PROCEDURE [dbo].[LIK_DeleteKosKamar] 
(                
	@FormKosID bigint
)  
AS
BEGIN
	DELETE FROM tblTrFormKosKamar WHERE FormKosID = @FormKosID
END
GO

--Created 2 Mei 2017
CREATE TABLE [dbo].[tblSubjectContact](
	[ID] [int] NOT NULL,
	[Nama] [varchar](50) NULL,
 CONSTRAINT [PK_tblSubjectContact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--Created 2 Mei 2017
CREATE PROCEDURE [dbo].[LIK_GetAllSubjectContact] 	
AS
BEGIN
	SELECT ID, Nama
		FROM tblSubjectContact
		ORDER BY ID		
END

--Created 2 Mei 2017
ALTER PROCEDURE [dbo].[LIK_GetPageContent] 	
(                
	@ID int
)  
AS
BEGIN
	SELECT ID, PageTitle, PageContent
		FROM tblPageContent
		WHERE ID = @ID
		ORDER BY ID		
END

Data tblPageContent
3	Alamat	<strong>Abcd, Inc.</strong><br><br><br><abbr title="Phone">P:</abbr>(123) 456-7890

CREATE TABLE [dbo].[tblContactUsData](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SubjectID] [int] NULL,
	[Message] [varchar](1000) NULL,
	[UserID] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblContactUsData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--Created 2 Mei 2017
ALTER PROCEDURE [dbo].[LIK_InsertContactUs] 	
@SubjectID int,
@Message varchar(1000),
@UserID bigint,
@Status int = 0
AS
BEGIN
	INSERT INTO tblContactUsData (SubjectID,Message,UserID,Status)
	VALUES(@SubjectID,@Message,@UserID,@Status)
END


--Modified by Sony, 3 Mei 2017
ALTER PROCEDURE [dbo].[LIK_GetContactData] --'adminsystem@lihatkos.com','abcde!!12345'
(                
	@ID bigint = 0
)  
AS
BEGIN
	SELECT a.ID, a.SubjectID, a.Message, a.UserID, b.UserName, c.Email, d.Nama AS SubjectContact, a.Status FROM tblContactUsData a
	LEFT JOIN tblUser b ON a.UserID = b.ID
	LEFT JOIN tblMembership c ON a.UserID = c.UserID
	LEFT JOIN tblSubjectContact d ON a.SubjectID = d.ID
	WHERE a.ID = (CASE WHEN @ID = 0 THEN a.ID ELSE @ID END)
END


--Modified by Sony, 3 Mei 2017
CREATE PROCEDURE [dbo].[LIK_UpdateContactData] --'adminsystem@lihatkos.com','abcde!!12345'
(                
	@ID bigint,
	@Status int
)  
AS
BEGIN
	UPDATE tblContactUsData 
	SET Status = @Status WHERE ID = @ID
	
END



--Created 4 Mei 2017
CREATE PROCEDURE [dbo].[LIK_UpdatePageContent] 	
(                
	@ID int,
	@Content text
)  
AS
BEGIN
	UPDATE tblPageContent 
		SET PageContent = @Content
		WHERE ID =  @ID
END


--Created 15 Mei 2017
CREATE PROCEDURE [dbo].[LIK_GetTopListFormKos]      
AS    
BEGIN    
  
 SELECT TOP 6 A.ID, A.Kode, A.Nama, A.ImageID,CONVERT(VARCHAR(MAX), A.Alamat) AS Alamat, B.Harga, C.Nama AS SatuanHarga, A.Altitude, A.Longitude, COUNT(D.UserID) FavCount  
 FROM tblFormKos A      
 LEFT JOIN tblTrFormKosHarga B      
  ON A.ID = B.FormKosID AND B.SatuanHargaID = 3      
 LEFT JOIN tblSatuanHarga C ON B.SatuanHargaID = C.ID      
 INNER JOIN tblFormKosFavorit D ON A.ID = D.FormKosID AND D.AuditActivity <> 'D'  
 GROUP BY  A.ID, A.Kode, A.Nama, A.ImageID, B.Harga, CONVERT(VARCHAR(MAX), A.Alamat), C.Nama, A.Altitude, A.Longitude  
 ORDER BY COUNT(D.FormKosID) DESC  

END
USE [EF40]
GO

/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 01/16/2010 16:37:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteContact]
GO

/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 01/16/2010 16:37:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateContact]
GO

/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 01/16/2010 16:37:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertContact]
GO

/****** Object:  StoredProcedure [dbo].[UpdateContact]    Script Date: 01/16/2010 16:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateContact]
(
	@ContactID int,
	@NameStyle bit,
	@Title nvarchar(8),
	@FirstName nvarchar(50),
	@MiddleName nvarchar(50),
	@LastName nvarchar(50),
	@Suffix nvarchar(10),
	@EmailAddress nvarchar(50),
	@EmailPromotion int,
	@Phone nvarchar(25),
	@PasswordHash varchar(128),
	@PasswordSalt varchar(10),
	@rowguid uniqueidentifier,
	@ModifiedDate datetime
)
AS

	UPDATE [EF40].[dbo].[Contact]
	SET
		[NameStyle] = @NameStyle,
		[Title] = @Title,
		[FirstName] = @FirstName,
		[MiddleName] = @MiddleName,
		[LastName] = @LastName,
		[Suffix] = @Suffix,
		[EmailAddress] = @EmailAddress,
		[EmailPromotion] = @EmailPromotion,
		[Phone] = @Phone,
		[PasswordHash] = @PasswordHash,
		[PasswordSalt] = @PasswordSalt,
		[rowguid] = @rowguid,
		[ModifiedDate] = @ModifiedDate
	WHERE ContactID = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[InsertContact]    Script Date: 01/16/2010 16:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertContact]
(
	@NameStyle bit,
	@Title nvarchar(8),
	@FirstName nvarchar(50),
	@MiddleName nvarchar(50),
	@LastName nvarchar(50),
	@Suffix nvarchar(10),
	@EmailAddress nvarchar(50),
	@EmailPromotion int,
	@Phone nvarchar(25),
	@PasswordHash varchar(128),
	@PasswordSalt varchar(10),
	@rowguid uniqueidentifier,
	@ModifiedDate datetime
)
AS

	INSERT INTO [EF40].[dbo].[Contact]
	(
		[NameStyle],
		[Title],
		[FirstName],
		[MiddleName],
		[LastName],
		[Suffix],
		[EmailAddress],
		[EmailPromotion],
		[Phone],
		[PasswordHash],
		[PasswordSalt],
		[rowguid],
		[ModifiedDate]
	)
	VALUES
	(
		@NameStyle,
		@Title,
		@FirstName,
		@MiddleName,
		@LastName,
		@Suffix,
		@EmailAddress,
		@EmailPromotion,
		@Phone,
		@PasswordHash,
		@PasswordSalt,
		@rowguid,
		@ModifiedDate
	)
	
	SELECT SCOPE_IDENTITY() AS NewContactID WHERE @@ROWCOUNT > 0

GO
/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 01/16/2010 16:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteContact]
(
	@ContactID int
)
AS

	DELETE 
	FROM [EF40].[dbo].[Contact]
	WHERE ContactID = @ContactID
GO

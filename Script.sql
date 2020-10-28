
CREATE DATABASE Municipality

USE [Municipality]

GO

CREATE TABLE [dbo].[Municipalities](
	[MunicipalityId] int IDENTITY(1,1) NOT NULL,
	[Name] varchar(500) NOT NULL,
	[Date] datetime2(7)  NOT NULL,
	[IsActive] bit NOT NULL,
	[CreatedDate] datetime2(7) NOT NULL,
	[ModifiedDate] datetime2 NOT NULL,
 CONSTRAINT [PK_Municipalities] PRIMARY KEY CLUSTERED 
(
	[MunicipalityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Frequencies](
	[FrequencyId] int IDENTITY(1,1) NOT NULL,
	[Value] varchar(15) NOT NULL,
	[CreatedDate] datetime2(7) NOT NULL,
	[ModifiedDate] datetime2(7) NOT NULL,
        [Order] int NOT NULL
 CONSTRAINT [PK_Frequencies] PRIMARY KEY CLUSTERED 
(
	[FrequencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO

CREATE TABLE [dbo].[Taxes](
	[TaxId] int IDENTITY(1,1) NOT NULL,
	[TaxValue] varchar(50) NOT NULL,
	[MunicipalityId] int NOT NULL,
	[FrequencyId] int NOT NULL,
 CONSTRAINT [PK_Taxes] PRIMARY KEY CLUSTERED 
(
	[TaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Taxes]  WITH CHECK ADD  CONSTRAINT [FK_Taxes_Frequencies_FrequencyId] FOREIGN KEY([FrequencyId])
REFERENCES [dbo].[Frequencies] ([FrequencyId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Taxes] CHECK CONSTRAINT [FK_Taxes_Frequencies_FrequencyId]
GO

ALTER TABLE [dbo].[Taxes]  WITH CHECK ADD  CONSTRAINT [FK_Taxes_Municipalities_MunicipalityId] FOREIGN KEY([MunicipalityId])
REFERENCES [dbo].[Municipalities] ([MunicipalityId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Taxes] CHECK CONSTRAINT [FK_Taxes_Municipalities_MunicipalityId]
GO





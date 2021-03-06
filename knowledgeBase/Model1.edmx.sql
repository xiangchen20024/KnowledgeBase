
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/12/2022 14:02:32
-- Generated from EDMX file: D:\mangoProject\knowledgeBase\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [KnowledgeBase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserLikeKnowledgeBase_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserKnowledgeBase] DROP CONSTRAINT [FK_UserLikeKnowledgeBase_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserLikeKnowledgeBase_KnowledgeBase]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserKnowledgeBase] DROP CONSTRAINT [FK_UserLikeKnowledgeBase_KnowledgeBase];
GO
IF OBJECT_ID(N'[dbo].[FK_UserKnowledgeBase]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KnowledgeBases] DROP CONSTRAINT [FK_UserKnowledgeBase];
GO
IF OBJECT_ID(N'[dbo].[FK_KnowledgeTypeKnowledgeBase]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KnowledgeBases] DROP CONSTRAINT [FK_KnowledgeTypeKnowledgeBase];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUserComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserComments] DROP CONSTRAINT [FK_UserUserComment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCommentKnowledgeBase]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserComments] DROP CONSTRAINT [FK_UserCommentKnowledgeBase];
GO
IF OBJECT_ID(N'[dbo].[FK_UserComment_UserComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserComments] DROP CONSTRAINT [FK_UserComment_UserComment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[KnowledgeBases]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KnowledgeBases];
GO
IF OBJECT_ID(N'[dbo].[KnowledgeTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KnowledgeTypes];
GO
IF OBJECT_ID(N'[dbo].[UserComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserComments];
GO
IF OBJECT_ID(N'[dbo].[UserKnowledgeBase]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserKnowledgeBase];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'KnowledgeBases'
CREATE TABLE [dbo].[KnowledgeBases] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NULL,
    [Content] nvarchar(max)  NULL,
    [LikeNumber] int  NOT NULL,
    [User_Id] int  NOT NULL,
    [KnowledgeType_Id] int  NOT NULL
);
GO

-- Creating table 'KnowledgeTypes'
CREATE TABLE [dbo].[KnowledgeTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NULL
);
GO

-- Creating table 'UserComments'
CREATE TABLE [dbo].[UserComments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Comment] nvarchar(max)  NULL,
    [ParentCommentId] int  NULL,
    [User_Id] int  NOT NULL,
    [KnowledgeBases_Id] int  NOT NULL
);
GO

-- Creating table 'UserKnowledgeBase'
CREATE TABLE [dbo].[UserKnowledgeBase] (
    [LikeUsers_Id] int  NOT NULL,
    [LikeKnowledgeBases_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'KnowledgeBases'
ALTER TABLE [dbo].[KnowledgeBases]
ADD CONSTRAINT [PK_KnowledgeBases]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'KnowledgeTypes'
ALTER TABLE [dbo].[KnowledgeTypes]
ADD CONSTRAINT [PK_KnowledgeTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserComments'
ALTER TABLE [dbo].[UserComments]
ADD CONSTRAINT [PK_UserComments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LikeUsers_Id], [LikeKnowledgeBases_Id] in table 'UserKnowledgeBase'
ALTER TABLE [dbo].[UserKnowledgeBase]
ADD CONSTRAINT [PK_UserKnowledgeBase]
    PRIMARY KEY CLUSTERED ([LikeUsers_Id], [LikeKnowledgeBases_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LikeUsers_Id] in table 'UserKnowledgeBase'
ALTER TABLE [dbo].[UserKnowledgeBase]
ADD CONSTRAINT [FK_UserLikeKnowledgeBase_User]
    FOREIGN KEY ([LikeUsers_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [LikeKnowledgeBases_Id] in table 'UserKnowledgeBase'
ALTER TABLE [dbo].[UserKnowledgeBase]
ADD CONSTRAINT [FK_UserLikeKnowledgeBase_KnowledgeBase]
    FOREIGN KEY ([LikeKnowledgeBases_Id])
    REFERENCES [dbo].[KnowledgeBases]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLikeKnowledgeBase_KnowledgeBase'
CREATE INDEX [IX_FK_UserLikeKnowledgeBase_KnowledgeBase]
ON [dbo].[UserKnowledgeBase]
    ([LikeKnowledgeBases_Id]);
GO

-- Creating foreign key on [User_Id] in table 'KnowledgeBases'
ALTER TABLE [dbo].[KnowledgeBases]
ADD CONSTRAINT [FK_UserKnowledgeBase]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserKnowledgeBase'
CREATE INDEX [IX_FK_UserKnowledgeBase]
ON [dbo].[KnowledgeBases]
    ([User_Id]);
GO

-- Creating foreign key on [KnowledgeType_Id] in table 'KnowledgeBases'
ALTER TABLE [dbo].[KnowledgeBases]
ADD CONSTRAINT [FK_KnowledgeTypeKnowledgeBase]
    FOREIGN KEY ([KnowledgeType_Id])
    REFERENCES [dbo].[KnowledgeTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KnowledgeTypeKnowledgeBase'
CREATE INDEX [IX_FK_KnowledgeTypeKnowledgeBase]
ON [dbo].[KnowledgeBases]
    ([KnowledgeType_Id]);
GO

-- Creating foreign key on [User_Id] in table 'UserComments'
ALTER TABLE [dbo].[UserComments]
ADD CONSTRAINT [FK_UserUserComment]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserComment'
CREATE INDEX [IX_FK_UserUserComment]
ON [dbo].[UserComments]
    ([User_Id]);
GO

-- Creating foreign key on [KnowledgeBases_Id] in table 'UserComments'
ALTER TABLE [dbo].[UserComments]
ADD CONSTRAINT [FK_UserCommentKnowledgeBase]
    FOREIGN KEY ([KnowledgeBases_Id])
    REFERENCES [dbo].[KnowledgeBases]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCommentKnowledgeBase'
CREATE INDEX [IX_FK_UserCommentKnowledgeBase]
ON [dbo].[UserComments]
    ([KnowledgeBases_Id]);
GO

-- Creating foreign key on [ParentCommentId] in table 'UserComments'
ALTER TABLE [dbo].[UserComments]
ADD CONSTRAINT [FK_UserComment_UserComment]
    FOREIGN KEY ([ParentCommentId])
    REFERENCES [dbo].[UserComments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserComment_UserComment'
CREATE INDEX [IX_FK_UserComment_UserComment]
ON [dbo].[UserComments]
    ([ParentCommentId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
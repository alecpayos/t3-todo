/*
  Warnings:

  - You are about to drop the `Account` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Session` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `VerificationToken` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Account` DROP FOREIGN KEY `Account_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Session` DROP FOREIGN KEY `Session_userId_fkey`;

-- DropTable
DROP TABLE `Account`;

-- DropTable
DROP TABLE `Session`;

-- DropTable
DROP TABLE `User`;

-- DropTable
DROP TABLE `VerificationToken`;

-- CreateTable
CREATE TABLE `NextAuthAccount` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `provider` VARCHAR(191) NOT NULL,
    `providerAccountId` VARCHAR(191) NOT NULL,
    `refresh_token` VARCHAR(191) NULL,
    `access_token` VARCHAR(191) NULL,
    `expires_at` INTEGER NULL,
    `token_type` VARCHAR(191) NULL,
    `scope` VARCHAR(191) NULL,
    `id_token` VARCHAR(191) NULL,
    `session_state` VARCHAR(191) NULL,

    UNIQUE INDEX `NextAuthAccount_provider_providerAccountId_key`(`provider`, `providerAccountId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Users` (
    `id` VARCHAR(191) NOT NULL,
    `accountId` VARCHAR(191) NOT NULL,
    `authorizationId` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `syncPassword` VARCHAR(191) NOT NULL,
    `dashPassword` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `officesId` VARCHAR(191) NULL,

    UNIQUE INDEX `Users_username_email_syncPassword_dashPassword_key`(`username`, `email`, `syncPassword`, `dashPassword`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Accounts` (
    `id` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `birthDate` DATETIME(3) NULL,
    `countryCode` VARCHAR(191) NULL,
    `phoneNumber` VARCHAR(191) NULL,
    `timezone` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Authorizations` (
    `id` VARCHAR(191) NOT NULL,
    `google2faSecret` VARCHAR(191) NULL,
    `last2faAt` DATETIME(3) NULL,
    `lastIpAddress` VARCHAR(191) NULL,
    `lastLogin` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Patients` (
    `id` VARCHAR(191) NOT NULL,
    `dicomPatientId` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `birthDate` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Patients_dicomPatientId_key`(`dicomPatientId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Medias` (
    `id` VARCHAR(191) NOT NULL,
    `patientId` VARCHAR(191) NOT NULL,
    `studyInstanceUID` VARCHAR(191) NOT NULL,
    `path` VARCHAR(191) NULL,
    `type` VARCHAR(191) NULL,
    `meta` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Worklists` (
    `id` VARCHAR(191) NOT NULL,
    `officeId` VARCHAR(191) NOT NULL,
    `patientId` VARCHAR(191) NOT NULL,
    `mediaId` VARCHAR(191) NOT NULL,
    `dentistName` VARCHAR(191) NULL,
    `radiologistName` VARCHAR(191) NULL,
    `shareLink` VARCHAR(191) NULL,
    `dismissStatus` BOOLEAN NULL,
    `dismissReason` VARCHAR(191) NULL,
    `dismissAt` DATETIME(3) NULL,
    `processingStatus` VARCHAR(191) NULL,
    `reportImages` BOOLEAN NULL,
    `timezone` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Worklists_officeId_patientId_mediaId_key`(`officeId`, `patientId`, `mediaId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Offices` (
    `id` VARCHAR(191) NOT NULL,
    `manufacturerId` VARCHAR(191) NOT NULL,
    `acquisitionId` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `addressLineOne` VARCHAR(191) NOT NULL,
    `addressLineTwo` VARCHAR(191) NULL,
    `city` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NULL,
    `zicode` INTEGER NULL,
    `phone` VARCHAR(191) NULL,
    `primaryContactName` VARCHAR(191) NULL,
    `primaryContantEmail` VARCHAR(191) NULL,
    `technicalContactName` VARCHAR(191) NULL,
    `technicalContactEmail` VARCHAR(191) NULL,
    `technicalContactCompany` VARCHAR(191) NULL,
    `technicalContactPhone` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Offices_manufacturerId_acquisitionId_key`(`manufacturerId`, `acquisitionId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Manufacturers` (
    `id` VARCHAR(191) NOT NULL,
    `practiceManagementSoftware` VARCHAR(191) NULL,
    `manufacturer` VARCHAR(191) NULL,
    `imagingSoftware` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Acquisition` (
    `id` VARCHAR(191) NOT NULL,
    `style` VARCHAR(191) NULL,
    `machineHostname` VARCHAR(191) NULL,
    `machineMacAddress` VARCHAR(191) NULL,
    `machineRemoteAddress` VARCHAR(191) NULL,
    `machineLastAccess` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `NextAuthAccount` ADD CONSTRAINT `NextAuthAccount_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Users`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_accountId_fkey` FOREIGN KEY (`accountId`) REFERENCES `Accounts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_authorizationId_fkey` FOREIGN KEY (`authorizationId`) REFERENCES `Authorizations`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_officesId_fkey` FOREIGN KEY (`officesId`) REFERENCES `Offices`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Medias` ADD CONSTRAINT `Medias_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patients`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Worklists` ADD CONSTRAINT `Worklists_officeId_fkey` FOREIGN KEY (`officeId`) REFERENCES `Offices`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Worklists` ADD CONSTRAINT `Worklists_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patients`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Worklists` ADD CONSTRAINT `Worklists_mediaId_fkey` FOREIGN KEY (`mediaId`) REFERENCES `Medias`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Offices` ADD CONSTRAINT `Offices_manufacturerId_fkey` FOREIGN KEY (`manufacturerId`) REFERENCES `Manufacturers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Offices` ADD CONSTRAINT `Offices_acquisitionId_fkey` FOREIGN KEY (`acquisitionId`) REFERENCES `Acquisition`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.24


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema churchinfo
--

CREATE DATABASE IF NOT EXISTS churchinfo;
USE churchinfo;

--
-- Definition of table `autopayment_aut`
--

DROP TABLE IF EXISTS `autopayment_aut`;
CREATE TABLE `autopayment_aut` (
  `aut_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `aut_FamID` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `aut_EnableBankDraft` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aut_EnableCreditCard` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aut_NextPayDate` date DEFAULT NULL,
  `aut_FYID` mediumint(9) NOT NULL DEFAULT '9',
  `aut_Amount` decimal(6,2) NOT NULL DEFAULT '0.00',
  `aut_Interval` tinyint(3) NOT NULL DEFAULT '1',
  `aut_Fund` mediumint(6) NOT NULL DEFAULT '0',
  `aut_FirstName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_LastName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_Address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_Address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_City` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_State` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_Zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_Country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_Phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_CreditCard` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_ExpMonth` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_ExpYear` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_BankName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_Route` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_Account` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_DateLastEdited` datetime DEFAULT NULL,
  `aut_EditedBy` smallint(5) unsigned DEFAULT '0',
  `aut_Serial` mediumint(9) NOT NULL DEFAULT '1',
  `aut_CreditCardVanco` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aut_AccountVanco` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`aut_ID`),
  UNIQUE KEY `aut_ID` (`aut_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `autopayment_aut`
--

/*!40000 ALTER TABLE `autopayment_aut` DISABLE KEYS */;
/*!40000 ALTER TABLE `autopayment_aut` ENABLE KEYS */;


--
-- Definition of table `canvassdata_can`
--

DROP TABLE IF EXISTS `canvassdata_can`;
CREATE TABLE `canvassdata_can` (
  `can_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `can_famID` mediumint(9) NOT NULL DEFAULT '0',
  `can_Canvasser` mediumint(9) NOT NULL DEFAULT '0',
  `can_FYID` mediumint(9) DEFAULT NULL,
  `can_date` date DEFAULT NULL,
  `can_Positive` text COLLATE utf8_unicode_ci,
  `can_Critical` text COLLATE utf8_unicode_ci,
  `can_Insightful` text COLLATE utf8_unicode_ci,
  `can_Financial` text COLLATE utf8_unicode_ci,
  `can_Suggestion` text COLLATE utf8_unicode_ci,
  `can_NotInterested` tinyint(1) NOT NULL DEFAULT '0',
  `can_WhyNotInterested` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`can_ID`),
  UNIQUE KEY `can_ID` (`can_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `canvassdata_can`
--

/*!40000 ALTER TABLE `canvassdata_can` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvassdata_can` ENABLE KEYS */;


--
-- Definition of table `config_cfg`
--

DROP TABLE IF EXISTS `config_cfg`;
CREATE TABLE `config_cfg` (
  `cfg_id` int(11) NOT NULL DEFAULT '0',
  `cfg_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` text COLLATE utf8_unicode_ci,
  `cfg_type` enum('text','number','date','boolean','textarea') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `cfg_default` text COLLATE utf8_unicode_ci NOT NULL,
  `cfg_tooltip` text COLLATE utf8_unicode_ci NOT NULL,
  `cfg_section` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cfg_category` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cfg_id`),
  UNIQUE KEY `cfg_name` (`cfg_name`),
  KEY `cfg_id` (`cfg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `config_cfg`
--

/*!40000 ALTER TABLE `config_cfg` DISABLE KEYS */;
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (1,'sWEBCALENDARDB','','text','','WebCalendar database name','General',NULL),
 (2,'debug','1','boolean','1','Set debug mode\r\nThis may be helpful for when you\'re first setting up ChurchInfo, but you should\r\nprobably turn it off for maximum security otherwise.  If you are having trouble,\r\nplease enable this so that you\'ll know what the errors are.  This is especially\r\nimportant if you need to report a problem on the help forums.','General',NULL),
 (3,'sJPGRAPH_PATH','Include/jpgraph-1.13/src','text','Include/jpgraph-1.13/src','JPGraph library','General',NULL),
 (4,'sFPDF_PATH','Include/fpdf17','text','Include/fpdf17','FPDF library','General',NULL),
 (5,'sDirClassifications','1,2,4,5','text','1,2,4,5','Include only these classifications in the directory, comma seperated','General',NULL),
 (6,'sDirRoleHead','1,7','text','1,7','These are the family role numbers designated as head of house','General',NULL),
 (7,'sDirRoleSpouse','2','text','2','These are the family role numbers designated as spouse','General',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (8,'sDirRoleChild','3','text','3','These are the family role numbers designated as child','General',NULL),
 (9,'sSessionTimeout','3600','number','3600','Session timeout length in seconds\rSet to zero to disable session timeouts.','General',NULL),
 (10,'aFinanceQueries','28,30,31,32','text','28','Queries for which user must have finance permissions to use:','General',NULL),
 (11,'bCSVAdminOnly','1','boolean','1','Should only administrators have access to the CSV export system and directory report?','General',NULL),
 (12,'sDefault_Pass','password','text','password','Default password for new users and those with reset passwords','General',NULL),
 (13,'sMinPasswordLength','6','number','6','Minimum length a user may set their password to','General',NULL),
 (14,'sMinPasswordChange','4','number','4','Minimum amount that a new password must differ from the old one (# of characters changed)\rSet to zero to disable this feature','General',NULL),
 (15,'sDisallowedPasswords','churchinfo,password,god,jesus,church,christian','text','churchinfo,password,god,jesus,church,christian','A comma-seperated list of disallowed (too obvious) passwords.','General',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (16,'iMaxFailedLogins','50','number','50','Maximum number of failed logins to allow before a user account is locked.\rOnce the maximum has been reached, an administrator must re-enable the account.\rThis feature helps to protect against automated password guessing attacks.\rSet to zero to disable this feature.','General',NULL),
 (17,'bToolTipsOn','','boolean','','Turn on or off guided help (Tool Tips).\rThis feature is not complete.  Leave off for now.','General',NULL),
 (18,'iNavMethod','1','number','1','Interface navigation method\r1 = Javascript MenuBar (default)\r2 = Flat Sidebar (alternative for buggy browsers)','General',NULL),
 (19,'bFamListFirstNames','1','boolean','1','Show family member firstnames in Family Listing?','General',NULL),
 (20,'iPDFOutputType','1','number','1','PDF handling mode.\r1 = Save File dialog\r2 = Open in current browser window','General',NULL),
 (21,'sDefaultCity','','text','','Default City','General',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (22,'sDefaultState','','text','','Default State - Must be 2-letter abbreviation!','General',NULL),
 (23,'sDefaultCountry','United States','text','United States','Default Country','General',NULL),
 (24,'bEmailSend','','boolean','','If you wish to be able to send emails from within ChurchInfo. This requires\reither an SMTP server address to send from or sendmail installed in PHP.','General',NULL),
 (25,'sSendType','smtp','text','smtp','The method for sending email. Either \"smtp\" or \"sendmail\"','General',NULL),
 (26,'sToEmailAddress','','text','','Default account for receiving a copy of all emails','General',NULL),
 (27,'sSMTPHost','','text','','SMTP Server Address (mail.server.com:25)','General',NULL),
 (28,'sSMTPAuth','1','boolean','1','Does your SMTP server require auththentication (username/password)?','General',NULL),
 (29,'sSMTPUser','','text','','SMTP Username','General',NULL),
 (30,'sSMTPPass','','text','','SMTP Password','General',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (31,'sWordWrap','72','number','72','Word Wrap point. Default for most email programs is 72','General',NULL),
 (32,'bDefectiveBrowser','1','boolean','1','Are you using any non-standards-compliant \"broken\" browsers at this installation?\rIf so, enabling this will turn off the CSS tags that make the menubar stay\rat the top of the screen instead of scrolling with the rest of the page.\rIt will also turn off the use of nice, alpha-blended PNG images, which IE still\rdoes not properly handle.\rNOTICE: MS Internet Explorer is currently not standards-compliant enough for\rthese purposes.  Please use a quality web browser such as Netscape 7, Firefox, etc.\r','General',NULL),
 (33,'bShowFamilyData','1','boolean','1','Unavailable person info inherited from assigned family for display?\rThis option causes certain info from a person\'s assigned family record to be\rdisplayed IF the corresponding info has NOT been entered for that person. ','General',NULL),
 (34,'bOldVCardVersion','','boolean','','Use vCard 2.1 rather than vCard 3.0 standard.','General',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (35,'bEnableBackupUtility','','boolean','','This backup system only works on \"UNIX-style\" operating systems such as\rGNU/Linux, OSX and the BSD variants (NOT Windows).\rOf course, remember that only your web server needs to running a UNIX-style\rOS for this feature to work.','General',NULL),
 (36,'sGZIPname','gzip','text','gzip','','General',NULL),
 (37,'sZIPname','zip','text','zip','','General',NULL),
 (38,'sPGPname','gpg','text','gpg','','General',NULL),
 (39,'sLanguage','en_US','text','en_US','Internationalization (I18n) support\rUS English (en_US), Italian (it_IT), French (fr_FR), and German (de_DE)','General',NULL),
 (40,'iFYMonth','1','number','1','First month of the fiscal year','General',NULL),
 (41,'sXML_RPC_PATH','XML/RPC.php','text','XML/RPC.php','Path to RPC.php, required for Lat/Lon address lookup','General',NULL),
 (42,'sGeocoderID','','text','','User ID for rpc.geocoder.us','General',NULL),
 (43,'sGeocoderPW','','text','','Password for rpc.geocoder.us','General',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (44,'sGoogleMapKey','','text','','Google map API requires a unique key from http://maps.google.com/apis/maps/signup.html','General',NULL),
 (45,'nChurchLatitude','','number','','Latitude of the church, used to center the Google map','General',NULL),
 (46,'nChurchLongitude','','number','','Longitude of the church, used to center the Google map','General',NULL),
 (47,'bHidePersonAddress','1','boolean','1','Set true to disable entering addresses in Person Editor.  Set false to enable entering addresses in Person Editor.','General',NULL),
 (48,'bHideFriendDate','0','boolean','0','Set true to disable entering Friend Date in Person Editor.  Set false to enable entering Friend Date in Person Editor.','General',NULL),
 (49,'bHideFamilyNewsletter','0','boolean','0','Set true to disable management of newsletter subscriptions in the Family Editor.','General',NULL),
 (50,'bHideWeddingDate','0','boolean','0','Set true to disable entering Wedding Date in Family Editor.  Set false to enable entering Wedding Date in Family Editor.','General',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (51,'bHideLatLon','0','boolean','0','Set true to disable entering Latitude and Longitude in Family Editor.  Set false to enable entering Latitude and Longitude in Family Editor.  Lookups are still performed, just not displayed.','General',NULL),
 (52,'bUseDonationEnvelopes','0','boolean','0','Set true to enable use of donation envelopes','General',NULL),
 (53,'sHeader','','textarea','','Enter in HTML code which will be displayed as a header at the top of each page. Be sure to close your tags! Note: You must REFRESH YOUR BROWSER A SECOND TIME to view the new header.','General',NULL),
 (54,'sISTusername','username','text','username','Intelligent Search Technolgy, Ltd. CorrectAddress Username for https://www.intelligentsearch.com/Hosted/User','General',NULL),
 (55,'sISTpassword','','text','','Intelligent Search Technolgy, Ltd. CorrectAddress Password for https://www.intelligentsearch.com/Hosted/User','General',NULL),
 (56,'bUseGoogleGeocode','1','boolean','1','Set true to use the Google geocoder.  Set false to use rpc.geocoder.us.','General',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (57,'iChecksPerDepositForm','14','number','14','Number of checks for Deposit Slip Report','General',NULL),
 (58,'bUseScannedChecks','0','boolean','0','Set true to enable use of scanned checks','General',NULL),
 (61,'iEventPeriodStartHr','7','number','7','Church Event Valid Period Start Hour (0-23)','General',NULL),
 (62,'iEventPeriodEndHr','18','number','18','Church Event Valid Period End Hour (0-23, must be greater than iEventStartHr)','General',NULL),
 (63,'iEventPeriodIntervalMin','15','number','15','Event Period interval (in minutes)','General',NULL),
 (64,'sDistanceUnit','miles','text','miles','Unit used to measure distance, miles or km.','General',NULL),
 (65,'sTimeZone','America/New_York','text','America/New_York','Time zone- see http://php.net/manual/en/timezones.php for valid choices.','General',NULL),
 (66,'sGMapIcons','red-dot,green-dot,purple,yellow-dot,blue-dot,orange,yellow,green,blue,red,pink,lightblue','text','red-dot,green-dot,purple,yellow-dot,blue-dot,orange,yellow,green,blue,red,pink,lightblue','Names of markers for Google Maps in order of classification','General',NULL),
 (67,'cfgForceUppercaseZip','0','boolean','0','Make user-entered zip/postcodes UPPERCASE when saving to the database. Useful in the UK.','General',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (72,'bEnableNonDeductible','0','boolean','0','Enable non-deductible payments','General',NULL),
 (73,'sElectronicTransactionProcessor','Vanco','text','Vanco','Electronic Transaction Processor','General',NULL),
 (999,'bRegistered','0','boolean','0','ChurchInfo has been registered.  The ChurchInfo team uses registration information to track usage.  This information is kept confidential and never released or sold.  If this field is true the registration option in the admin menu changes to update registration.','General',NULL),
 (1001,'leftX','20','number','20','Left Margin (1 = 1/100th inch)','ChurchInfoReport',NULL),
 (1002,'incrementY','4','number','4','Line Thickness (1 = 1/100th inch','ChurchInfoReport',NULL),
 (1003,'sChurchName','Some Church','text','','Church Name','ChurchInfoReport',NULL),
 (1004,'sChurchAddress','100 Main St','text','','Church Address','ChurchInfoReport',NULL),
 (1005,'sChurchCity','Wall','text','','Church City','ChurchInfoReport',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (1006,'sChurchState','SD','text','','Church State','ChurchInfoReport',NULL),
 (1007,'sChurchZip','11111','text','','Church Zip','ChurchInfoReport',NULL),
 (1008,'sChurchPhone','123-456-7890','text','','Church Phone','ChurchInfoReport',NULL),
 (1009,'sChurchEmail','church@church.org','text','','Church Email','ChurchInfoReport',NULL),
 (1010,'sHomeAreaCode','111','text','','Home area code of the church','ChurchInfoReport',NULL),
 (1011,'sTaxReport1','This letter shows our record of your payments for','text','This letter shows our record of your payments for','Verbage for top line of tax report. Dates will be appended to the end of this line.','ChurchInfoReport',NULL),
 (1012,'sTaxReport2','Thank you for your help in making a difference. We greatly appreciate your gift!','text','Thank you for your help in making a difference. We greatly appreciate your gift!','Verbage for bottom line of tax report.','ChurchInfoReport',NULL),
 (1013,'sTaxReport3','If you have any questions or corrections to make to this report, please contact the church at the above number during business hours, 9am to 4pm, M-F.','text','If you have any questions or corrections to make to this report, please contact the church at the above number during business hours, 9am to 4pm, M-F.','Verbage for bottom line of tax report.','ChurchInfoReport',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (1014,'sTaxSigner','Elder Joe Smith','text','','Tax Report signer','ChurchInfoReport',NULL),
 (1015,'sReminder1','This letter shows our record of your pledge and payments for fiscal year','text','This letter shows our record of your pledge and payments for fiscal year','Verbage for the pledge reminder report','ChurchInfoReport',NULL),
 (1016,'sReminderSigner','Elder Joe Smith','text','','Pledge Reminder Signer','ChurchInfoReport',NULL),
 (1017,'sReminderNoPledge','Pledges: We do not have record of a pledge for from you for this fiscal year.','text','Pledges: We do not have record of a pledge for from you for this fiscal year.','Verbage for the pledge reminder report - No record of a pledge','ChurchInfoReport',NULL),
 (1018,'sReminderNoPayments','Payments: We do not have record of a pledge for from you for this fiscal year.','text','Payments: We do not have record of a pledge for from you for this fiscal year.','Verbage for the pledge reminder report - No record of payments','ChurchInfoReport',NULL),
 (1019,'sConfirm1','This letter shows the information we have in our database with respect to your family.  Please review, mark-up as necessary, and return this form to the church office.','text','This letter shows the information we have in our database with respect to your family.  Please review, mark-up as necessary, and return this form to the church office.','Verbage for the database information confirmation and correction report','ChurchInfoReport',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (1020,'sConfirm2','Thank you very much for helping us to update this information.  If you want on-line access to the church database please provide your email address and a desired password and we will send instructions.','text','Thank you very much for helping us to update this information.  If you want on-line access to the church database please provide your email address and a desired password and we will send instructions.','Verbage for the database information confirmation and correction report','ChurchInfoReport',NULL),
 (1021,'sConfirm3','Email _____________________________________ Password ________________','text','Email _____________________________________ Password ________________','Verbage for the database information confirmation and correction report','ChurchInfoReport',NULL),
 (1022,'sConfirm4','[  ] I no longer want to be associated with the church (check here to be removed from our records).','text','[  ] I no longer want to be associated with the church (check here to be removed from our records).','Verbage for the database information confirmation and correction report','ChurchInfoReport',NULL),
 (1023,'sConfirm5','','text','','Verbage for the database information confirmation and correction report','ChurchInfoReport',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (1024,'sConfirm6','','text','','Verbage for the database information confirmation and correction report','ChurchInfoReport',NULL),
 (1025,'sConfirmSigner','Elder Joe Smith','text','','Database information confirmation and correction report signer','ChurchInfoReport',NULL),
 (1026,'sPledgeSummary1','Summary of pledges and payments for the fiscal year','text','Summary of pledges and payments for the fiscal year','Verbage for the pledge summary report','ChurchInfoReport',NULL),
 (1027,'sPledgeSummary2','as of','text',' as of','Verbage for the pledge summary report','ChurchInfoReport',NULL),
 (1028,'sDirectoryDisclaimer1','Every effort was made to insure the accuracy of this directory.  If there are any errors or omissions, please contact the church office.This directory is for the use of the people of','text','Every effort was made to insure the accuracy of this directory.  If there are any errors or omissions, please contact the church office.\n\nThis directory is for the use of the people of','Verbage for the directory report','ChurchInfoReport',NULL),
 (1029,'sDirectoryDisclaimer2',', and the information contained in it may not be used for business or commercial purposes.','text',', and the information contained in it may not be used for business or commercial purposes.','Verbage for the directory report','ChurchInfoReport',NULL);
INSERT INTO `config_cfg` (`cfg_id`,`cfg_name`,`cfg_value`,`cfg_type`,`cfg_default`,`cfg_tooltip`,`cfg_section`,`cfg_category`) VALUES 
 (1030,'bDirLetterHead','../Images/church_letterhead.jpg','text','../Images/church_letterhead.jpg','Church Letterhead path and file','ChurchInfoReport',NULL),
 (1031,'sZeroGivers','This letter shows our record of your payments for','text','This letter shows our record of your payments for','Verbage for top line of tax report. Dates will be appended to the end of this line.','ChurchInfoReport',NULL),
 (1032,'sZeroGivers2','Thank you for your help in making a difference. We greatly appreciate your gift!','text','Thank you for your help in making a difference. We greatly appreciate your gift!','Verbage for bottom line of tax report.','ChurchInfoReport',NULL),
 (1033,'sZeroGivers3','If you have any questions or corrections to make to this report, please contact the church at the above number during business hours, 9am to 4pm, M-F.','text','If you have any questions or corrections to make to this report, please contact the church at the above number during business hours, 9am to 4pm, M-F.','Verbage for bottom line of tax report.','ChurchInfoReport',NULL);
/*!40000 ALTER TABLE `config_cfg` ENABLE KEYS */;


--
-- Definition of table `deposit_dep`
--

DROP TABLE IF EXISTS `deposit_dep`;
CREATE TABLE `deposit_dep` (
  `dep_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `dep_Date` date DEFAULT NULL,
  `dep_Comment` text COLLATE utf8_unicode_ci,
  `dep_EnteredBy` mediumint(9) unsigned DEFAULT NULL,
  `dep_Closed` tinyint(1) NOT NULL DEFAULT '0',
  `dep_Type` enum('Bank','CreditCard','BankDraft','eGive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Bank',
  PRIMARY KEY (`dep_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0;

--
-- Dumping data for table `deposit_dep`
--

/*!40000 ALTER TABLE `deposit_dep` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit_dep` ENABLE KEYS */;


--
-- Definition of table `donateditem_di`
--

DROP TABLE IF EXISTS `donateditem_di`;
CREATE TABLE `donateditem_di` (
  `di_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `di_item` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `di_FR_ID` mediumint(9) unsigned NOT NULL,
  `di_donor_ID` mediumint(9) NOT NULL DEFAULT '0',
  `di_buyer_ID` mediumint(9) NOT NULL DEFAULT '0',
  `di_multibuy` smallint(1) NOT NULL DEFAULT '0',
  `di_title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `di_description` text COLLATE utf8_unicode_ci,
  `di_sellprice` decimal(8,2) DEFAULT NULL,
  `di_estprice` decimal(8,2) DEFAULT NULL,
  `di_minimum` decimal(8,2) DEFAULT NULL,
  `di_materialvalue` decimal(8,2) DEFAULT NULL,
  `di_EnteredBy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `di_EnteredDate` date NOT NULL,
  `di_picture` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`di_ID`),
  UNIQUE KEY `di_ID` (`di_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `donateditem_di`
--

/*!40000 ALTER TABLE `donateditem_di` DISABLE KEYS */;
/*!40000 ALTER TABLE `donateditem_di` ENABLE KEYS */;


--
-- Definition of table `donationfund_fun`
--

DROP TABLE IF EXISTS `donationfund_fun`;
CREATE TABLE `donationfund_fun` (
  `fun_ID` tinyint(3) NOT NULL AUTO_INCREMENT,
  `fun_Active` enum('true','false') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `fun_Name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fun_Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fun_ID`),
  UNIQUE KEY `fun_ID` (`fun_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `donationfund_fun`
--

/*!40000 ALTER TABLE `donationfund_fun` DISABLE KEYS */;
INSERT INTO `donationfund_fun` (`fun_ID`,`fun_Active`,`fun_Name`,`fun_Description`) VALUES 
 (1,'true','Pledges','Pledge income for the operating budget');
/*!40000 ALTER TABLE `donationfund_fun` ENABLE KEYS */;


--
-- Definition of table `egive_egv`
--

DROP TABLE IF EXISTS `egive_egv`;
CREATE TABLE `egive_egv` (
  `egv_egiveID` varchar(16) CHARACTER SET utf8 NOT NULL,
  `egv_famID` int(11) NOT NULL,
  `egv_DateEntered` datetime NOT NULL,
  `egv_DateLastEdited` datetime NOT NULL,
  `egv_EnteredBy` smallint(6) NOT NULL DEFAULT '0',
  `egv_EditedBy` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `egive_egv`
--

/*!40000 ALTER TABLE `egive_egv` DISABLE KEYS */;
/*!40000 ALTER TABLE `egive_egv` ENABLE KEYS */;


--
-- Definition of table `email_message_pending_emp`
--

DROP TABLE IF EXISTS `email_message_pending_emp`;
CREATE TABLE `email_message_pending_emp` (
  `emp_usr_id` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `emp_to_send` smallint(5) unsigned NOT NULL DEFAULT '0',
  `emp_subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `emp_message` text COLLATE utf8_unicode_ci NOT NULL,
  `emp_attach_name` text COLLATE utf8_unicode_ci,
  `emp_attach` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_message_pending_emp`
--

/*!40000 ALTER TABLE `email_message_pending_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_message_pending_emp` ENABLE KEYS */;


--
-- Definition of table `email_recipient_pending_erp`
--

DROP TABLE IF EXISTS `email_recipient_pending_erp`;
CREATE TABLE `email_recipient_pending_erp` (
  `erp_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `erp_usr_id` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `erp_num_attempt` smallint(5) unsigned NOT NULL DEFAULT '0',
  `erp_failed_time` datetime DEFAULT NULL,
  `erp_email_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_recipient_pending_erp`
--

/*!40000 ALTER TABLE `email_recipient_pending_erp` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_recipient_pending_erp` ENABLE KEYS */;


--
-- Definition of table `event_attend`
--

DROP TABLE IF EXISTS `event_attend`;
CREATE TABLE `event_attend` (
  `event_id` int(11) NOT NULL DEFAULT '0',
  `person_id` int(11) NOT NULL DEFAULT '0',
  `checkin_date` datetime DEFAULT NULL,
  `checkin_id` int(11) DEFAULT NULL,
  `checkout_date` datetime DEFAULT NULL,
  `checkout_id` int(11) DEFAULT NULL,
  UNIQUE KEY `event_id` (`event_id`,`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_attend`
--

/*!40000 ALTER TABLE `event_attend` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_attend` ENABLE KEYS */;


--
-- Definition of table `event_types`
--

DROP TABLE IF EXISTS `event_types`;
CREATE TABLE `event_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_defstarttime` time NOT NULL DEFAULT '00:00:00',
  `type_defrecurtype` enum('none','weekly','monthly','yearly') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `type_defrecurDOW` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Sunday',
  `type_defrecurDOM` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `type_defrecurDOY` date NOT NULL DEFAULT '0000-00-00',
  `type_active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_types`
--

/*!40000 ALTER TABLE `event_types` DISABLE KEYS */;
INSERT INTO `event_types` (`type_id`,`type_name`,`type_defstarttime`,`type_defrecurtype`,`type_defrecurDOW`,`type_defrecurDOM`,`type_defrecurDOY`,`type_active`) VALUES 
 (1,'Church Service','10:30:00','weekly','Sunday','','0000-00-00',1),
 (2,'Sunday School','09:30:00','weekly','Sunday','','0000-00-00',1);
/*!40000 ALTER TABLE `event_types` ENABLE KEYS */;


--
-- Definition of table `eventcountnames_evctnm`
--

DROP TABLE IF EXISTS `eventcountnames_evctnm`;
CREATE TABLE `eventcountnames_evctnm` (
  `evctnm_countid` int(5) NOT NULL AUTO_INCREMENT,
  `evctnm_eventtypeid` smallint(5) NOT NULL DEFAULT '0',
  `evctnm_countname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evctnm_notes` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `evctnm_countid` (`evctnm_countid`),
  UNIQUE KEY `evctnm_eventtypeid` (`evctnm_eventtypeid`,`evctnm_countname`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `eventcountnames_evctnm`
--

/*!40000 ALTER TABLE `eventcountnames_evctnm` DISABLE KEYS */;
INSERT INTO `eventcountnames_evctnm` (`evctnm_countid`,`evctnm_eventtypeid`,`evctnm_countname`,`evctnm_notes`) VALUES 
 (1,1,'Total',''),
 (2,1,'Members',''),
 (3,1,'Visitors',''),
 (4,2,'Total',''),
 (5,2,'Members',''),
 (6,2,'Visitors','');
/*!40000 ALTER TABLE `eventcountnames_evctnm` ENABLE KEYS */;


--
-- Definition of table `eventcounts_evtcnt`
--

DROP TABLE IF EXISTS `eventcounts_evtcnt`;
CREATE TABLE `eventcounts_evtcnt` (
  `evtcnt_eventid` int(5) NOT NULL DEFAULT '0',
  `evtcnt_countid` int(5) NOT NULL DEFAULT '0',
  `evtcnt_countname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `evtcnt_countcount` int(6) DEFAULT NULL,
  `evtcnt_notes` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`evtcnt_eventid`,`evtcnt_countid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `eventcounts_evtcnt`
--

/*!40000 ALTER TABLE `eventcounts_evtcnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventcounts_evtcnt` ENABLE KEYS */;


--
-- Definition of table `events_event`
--

DROP TABLE IF EXISTS `events_event`;
CREATE TABLE `events_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type` int(11) NOT NULL DEFAULT '0',
  `event_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `event_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_text` text COLLATE utf8_unicode_ci,
  `event_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inactive` int(1) NOT NULL DEFAULT '0',
  `event_typename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id`),
  FULLTEXT KEY `event_txt` (`event_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events_event`
--

/*!40000 ALTER TABLE `events_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_event` ENABLE KEYS */;


--
-- Definition of table `family_custom`
--

DROP TABLE IF EXISTS `family_custom`;
CREATE TABLE `family_custom` (
  `fam_ID` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fam_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `family_custom`
--

/*!40000 ALTER TABLE `family_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_custom` ENABLE KEYS */;


--
-- Definition of table `family_custom_master`
--

DROP TABLE IF EXISTS `family_custom_master`;
CREATE TABLE `family_custom_master` (
  `fam_custom_Order` smallint(6) NOT NULL DEFAULT '0',
  `fam_custom_Field` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fam_custom_Name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fam_custom_Special` mediumint(8) unsigned DEFAULT NULL,
  `fam_custom_Side` enum('left','right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'left',
  `fam_custom_FieldSec` tinyint(4) NOT NULL DEFAULT '1',
  `type_ID` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `family_custom_master`
--

/*!40000 ALTER TABLE `family_custom_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_custom_master` ENABLE KEYS */;


--
-- Definition of table `family_fam`
--

DROP TABLE IF EXISTS `family_fam`;
CREATE TABLE `family_fam` (
  `fam_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `fam_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_City` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_State` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_HomePhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_WorkPhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_CellPhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_WeddingDate` date DEFAULT NULL,
  `fam_DateEntered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fam_DateLastEdited` datetime DEFAULT NULL,
  `fam_EnteredBy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fam_EditedBy` smallint(5) unsigned DEFAULT '0',
  `fam_scanCheck` text COLLATE utf8_unicode_ci,
  `fam_scanCredit` text COLLATE utf8_unicode_ci,
  `fam_SendNewsLetter` enum('FALSE','TRUE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FALSE',
  `fam_DateDeactivated` date DEFAULT NULL,
  `fam_OkToCanvass` enum('FALSE','TRUE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FALSE',
  `fam_Canvasser` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fam_Latitude` double DEFAULT NULL,
  `fam_Longitude` double DEFAULT NULL,
  `fam_Envelope` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fam_ID`),
  KEY `fam_ID` (`fam_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `family_fam`
--

/*!40000 ALTER TABLE `family_fam` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_fam` ENABLE KEYS */;


--
-- Definition of table `fundraiser_fr`
--

DROP TABLE IF EXISTS `fundraiser_fr`;
CREATE TABLE `fundraiser_fr` (
  `fr_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `fr_date` date DEFAULT NULL,
  `fr_title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `fr_description` text COLLATE utf8_unicode_ci,
  `fr_EnteredBy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fr_EnteredDate` date NOT NULL,
  PRIMARY KEY (`fr_ID`),
  UNIQUE KEY `fr_ID` (`fr_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fundraiser_fr`
--

/*!40000 ALTER TABLE `fundraiser_fr` DISABLE KEYS */;
/*!40000 ALTER TABLE `fundraiser_fr` ENABLE KEYS */;


--
-- Definition of table `group_grp`
--

DROP TABLE IF EXISTS `group_grp`;
CREATE TABLE `group_grp` (
  `grp_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `grp_Type` tinyint(4) NOT NULL DEFAULT '0',
  `grp_RoleListID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `grp_DefaultRole` mediumint(9) NOT NULL DEFAULT '0',
  `grp_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `grp_Description` text COLLATE utf8_unicode_ci,
  `grp_hasSpecialProps` enum('true','false') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  PRIMARY KEY (`grp_ID`),
  UNIQUE KEY `grp_ID` (`grp_ID`),
  KEY `grp_ID_2` (`grp_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_grp`
--

/*!40000 ALTER TABLE `group_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_grp` ENABLE KEYS */;


--
-- Definition of table `groupprop_master`
--

DROP TABLE IF EXISTS `groupprop_master`;
CREATE TABLE `groupprop_master` (
  `grp_ID` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `prop_ID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prop_Field` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `prop_Name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prop_Description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_ID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `prop_Special` mediumint(9) unsigned DEFAULT NULL,
  `prop_PersonDisplay` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group-specific properties order, name, description, type';

--
-- Dumping data for table `groupprop_master`
--

/*!40000 ALTER TABLE `groupprop_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupprop_master` ENABLE KEYS */;


--
-- Definition of table `istlookup_lu`
--

DROP TABLE IF EXISTS `istlookup_lu`;
CREATE TABLE `istlookup_lu` (
  `lu_fam_ID` mediumint(9) NOT NULL DEFAULT '0',
  `lu_LookupDateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lu_DeliveryLine1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_DeliveryLine2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_City` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_State` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_ZipAddon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_Zip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_Addon` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_LOTNumber` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_DPCCheckdigit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_RecordType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_LastLine` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_CarrierRoute` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_ReturnCodes` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_ErrorCodes` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_ErrorDesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lu_fam_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='US Address Verification Lookups From Intelligent Search Tech';

--
-- Dumping data for table `istlookup_lu`
--

/*!40000 ALTER TABLE `istlookup_lu` DISABLE KEYS */;
/*!40000 ALTER TABLE `istlookup_lu` ENABLE KEYS */;


--
-- Definition of table `list_lst`
--

DROP TABLE IF EXISTS `list_lst`;
CREATE TABLE `list_lst` (
  `lst_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lst_OptionID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lst_OptionSequence` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lst_OptionName` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `list_lst`
--

/*!40000 ALTER TABLE `list_lst` DISABLE KEYS */;
INSERT INTO `list_lst` (`lst_ID`,`lst_OptionID`,`lst_OptionSequence`,`lst_OptionName`) VALUES 
 (1,1,1,'Member'),
 (1,2,2,'Regular Attender'),
 (1,3,3,'Guest'),
 (1,5,4,'Non-Attender'),
 (1,4,5,'Non-Attender (staff)'),
 (2,1,1,'Head of Household'),
 (2,2,2,'Spouse'),
 (2,3,3,'Child'),
 (2,4,4,'Other Relative'),
 (2,5,5,'Non Relative'),
 (3,1,1,'Ministry'),
 (3,2,2,'Team'),
 (3,3,3,'Bible Study'),
 (3,4,4,'Sunday School Class'),
 (4,1,1,'True / False'),
 (4,2,2,'Date'),
 (4,3,3,'Text Field (50 char)'),
 (4,4,4,'Text Field (100 char)'),
 (4,5,5,'Text Field (Long)'),
 (4,6,6,'Year'),
 (4,7,7,'Season'),
 (4,8,8,'Number'),
 (4,9,9,'Person from Group'),
 (4,10,10,'Money'),
 (4,11,11,'Phone Number'),
 (4,12,12,'Custom Drop-Down List'),
 (5,1,1,'bAll'),
 (5,2,2,'bAdmin'),
 (5,3,3,'bAddRecords'),
 (5,4,4,'bEditRecords'),
 (5,5,5,'bDeleteRecords'),
 (5,6,6,'bMenuOptions'),
 (5,7,7,'bManageGroups'),
 (5,8,8,'bFinance'),
 (5,9,9,'bNotes'),
 (5,10,10,'bCommunication'),
 (5,11,11,'bCanvasser');
/*!40000 ALTER TABLE `list_lst` ENABLE KEYS */;


--
-- Definition of table `menuconfig_mcf`
--

DROP TABLE IF EXISTS `menuconfig_mcf`;
CREATE TABLE `menuconfig_mcf` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `parent` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ismenu` tinyint(1) NOT NULL,
  `content_english` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statustext` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `security_grp` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `session_var` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_var_in_text` tinyint(1) NOT NULL,
  `session_var_in_uri` tinyint(1) NOT NULL,
  `url_parm_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `sortorder` tinyint(3) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menuconfig_mcf`
--

/*!40000 ALTER TABLE `menuconfig_mcf` DISABLE KEYS */;
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (1,'root','',1,'Main','Main','','','bAll',NULL,0,0,NULL,1,0),
 (2,'main','root',1,'Main','Main','','','bAll',NULL,0,0,NULL,1,1),
 (3,'logoff','main',0,'Log Off','Log Off','Default.php?Logoff=True','','bAll',NULL,0,0,NULL,1,1),
 (4,'chgpassword','main',0,'Change My Password','Change My Password','UserPasswordChange.php','','bAll',NULL,0,0,NULL,1,2),
 (5,'chgsetting','main',0,'Change My Settings','Change My Settings','SettingsIndividual.php','','bAll',NULL,0,0,NULL,1,0),
 (6,'admin','root',1,'Admin','Admin','','','bAdmin',NULL,0,0,NULL,1,2),
 (7,'editusers','admin',0,'Edit Users','Edit Users','UserList.php','','bAdmin',NULL,0,0,NULL,1,1),
 (8,'addnewuser','admin',0,'Add New User','Add New User','UserEditor.php','','bAdmin',NULL,0,0,NULL,1,2),
 (9,'custompersonfld','admin',0,'Edit Custom Person Fields','Edit Custom Person Fields','PersonCustomFieldsEditor.php','','bAdmin',NULL,0,0,NULL,1,3),
 (10,'donationfund','admin',0,'Edit Donation Funds','Edit Donation Funds','DonationFundEditor.php','','bAdmin',NULL,0,0,NULL,1,4);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (11,'dbbackup','admin',0,'Backup Database','Backup Database','BackupDatabase.php','','bAdmin',NULL,0,0,NULL,1,5),
 (12,'cvsimport','admin',0,'CSV Import','CSV Import','CSVImport.php','','bAdmin',NULL,0,0,NULL,1,6),
 (13,'accessreport','admin',0,'Access report','Access report','AccessReport.php','','bAdmin',NULL,0,0,NULL,1,7),
 (14,'generalsetting','admin',0,'Edit General Settings','Edit General Settings','SettingsGeneral.php','','bAdmin',NULL,0,0,NULL,1,8),
 (15,'reportsetting','admin',0,'Edit Report Settings','Edit Report Settings','SettingsReport.php','','bAdmin',NULL,0,0,NULL,1,9),
 (16,'userdefault','admin',0,'Edit User Default Settings','Edit User Default Settings','SettingsUser.php','','bAdmin',NULL,0,0,NULL,1,10),
 (17,'envelopmgr','admin',0,'Envelope Manager','Envelope Manager','ManageEnvelopes.php','','bAdmin',NULL,0,0,NULL,1,11),
 (91,'automaticpayments','admin',0,'Edit Automatic Payments','Edit Automatic Payments','ElectronicPaymentList.php','','bAdmin',NULL,0,0,NULL,1,12);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (18,'register','admin',0,'Please select this option to register ChurchInfo after configuring.','Please select this option to register ChurchInfo after configuring.','Register.php','','bAdmin',NULL,0,0,NULL,1,13),
 (19,'people','root',1,'People/Families','People/Families','','People/Families','bAll',NULL,0,0,NULL,1,3),
 (20,'newperson','people',0,'Add New Person','Add New Person','PersonEditor.php','','bAddRecords',NULL,0,0,NULL,1,1),
 (21,'viewperson','people',0,'View All Persons','View All Persons','SelectList.php?mode=person','','bAll',NULL,0,0,NULL,1,2),
 (22,'classes','people',0,'Classification Manager','Classification Manager','OptionManager.php?mode=classes','','bMenuOptions',NULL,0,0,NULL,1,3),
 (23,'separator1','people',0,'---------------------------','---------------------------','','','bAll',NULL,0,0,NULL,1,4),
 (24,'volunteeropportunity','people',0,'Edit volunteer opportunities','Edit volunteer opportunities','VolunteerOpportunityEditor.php','','bAll',NULL,0,0,NULL,1,5);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (25,'separator2','people',0,'---------------------------','---------------------------','','','bAll',NULL,0,0,NULL,1,6),
 (26,'newfamily','people',0,'Add New Family','Add New Family','FamilyEditor.php','','bAddRecords',NULL,0,0,NULL,1,7),
 (27,'viewfamily','people',0,'View All Families','View All Families','SelectList.php?mode=family','','bAll',NULL,0,0,NULL,1,8),
 (28,'familygeotools','people',0,'Family Geographic Utilties','Family Geographic Utilties','GeoPage.php','','bAll',NULL,0,0,NULL,1,9),
 (29,'familymap','people',0,'Family Map','Family Map','MapUsingGoogle.php?GroupID=-1','','bAll',NULL,0,0,NULL,1,10),
 (30,'rolemanager','people',0,'Family Roles Manager','Family Roles Manager','OptionManager.php?mode=famroles','','bMenuOptions',NULL,0,0,NULL,1,11),
 (31,'events','root',1,'Events','Events','','Events','bAll',NULL,0,0,NULL,1,4),
 (32,'listevent','events',0,'List Church Events','List Church Events','ListEvents.php','List Church Events','bAll',NULL,0,0,NULL,1,1);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (33,'addevent','events',0,'Add Church Event','Add Church Event','EventNames.php','Add Church Event','bAll',NULL,0,0,NULL,1,2),
 (34,'eventype','events',0,'List Event Types','List Event Types','EventNames.php','','bAdmin',NULL,0,0,NULL,1,3),
 (83,'eventcheckin','events',0,'Check-in and Check-out','Check-in and Check-out','Checkin.php','','bAll',NULL,0,0,NULL,1,4),
 (35,'deposit','root',1,'Payments','Payments','','','bFinance',NULL,0,0,NULL,1,5),
 (36,'newdeposit','deposit',0,'Create New Deposit','Create New Deposit','DepositSlipEditor.php?DepositType=Bank','','bFinance',NULL,0,0,NULL,1,1),
 (37,'viewdeposit','deposit',0,'View All Deposits','View All Deposits','FindDepositSlip.php','','bFinance',NULL,0,0,NULL,1,2),
 (38,'depositreport','deposit',0,'Deposit Reports','Deposit Reports','FinancialReports.php','','bFinance',NULL,0,0,NULL,1,3),
 (39,'separator3','deposit',0,'---------------------------','---------------------------','','','bFinance',NULL,0,0,NULL,1,4);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (40,'depositslip','deposit',0,'Edit Deposit Slip','Edit Deposit Slip','DepositSlipEditor.php','','bFinance','iCurrentDeposit',1,1,'DepositSlipID',1,5),
 (84,'fundraiser','root',1,'Fundraiser','Fundraiser','','','bAll',NULL,0,0,NULL,1,5),
 (85,'newfundraiser','fundraiser',0,'Create New Fundraiser','Create New Fundraiser','FundRaiserEditor.php?FundRaiserID=-1','','bAll',NULL,0,0,NULL,1,1),
 (86,'viewfundraiser','fundraiser',0,'View All Fundraisers','View All Fundraisers','FindFundRaiser.php','','bAll',NULL,0,0,NULL,1,1),
 (87,'editfundraiser','fundraiser',0,'Edit Fundraiser','Edit Fundraiser','FundRaiserEditor.php','','bAll','iCurrentFundraiser',1,1,'FundRaiserID',1,5),
 (88,'viewbuyers','fundraiser',0,'View Buyers','View Buyers','PaddleNumList.php','','bAll','iCurrentFundraiser',1,1,'FundRaiserID',1,5),
 (89,'adddonors','fundraiser',0,'Add Donors to Buyer List','Add Donors to Buyer List','AddDonors.php','','bAll','iCurrentFundraiser',1,1,'FundRaiserID',1,5);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (41,'cart','root',1,'Cart','Cart','','','bAll',NULL,0,0,NULL,1,6),
 (42,'viewcart','cart',0,'List Cart Items','List Cart Items','CartView.php','','bAll',NULL,0,0,NULL,1,1),
 (43,'emptycart','cart',0,'Empty Cart','Empty Cart','CartView.php?Action=EmptyCart','','bAll',NULL,0,0,NULL,1,2),
 (44,'carttogroup','cart',0,'Empty Cart to Group','Empty Cart to Group','CartToGroup.php','','bManageGroups',NULL,0,0,NULL,1,3),
 (45,'carttofamily','cart',0,'Empty Cart to Family','Empty Cart to Family','CartToFamily.php','','bAddRecords',NULL,0,0,NULL,1,4),
 (46,'carttoevent','cart',0,'Empty Cart to Event','Empty Cart to Event','CartToEvent.php','Empty Cart contents to Event','bAll',NULL,0,0,NULL,1,5),
 (47,'report','root',1,'Data/Reports','Data/Reports','','','bAll',NULL,0,0,NULL,1,7),
 (48,'cvsexport','report',0,'CSV Export Records','CSV Export Records','CSVExport.php','','bAll',NULL,0,0,NULL,1,1);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (49,'querymenu','report',0,'Query Menu','Query Menu','QueryList.php','','bAll',NULL,0,0,NULL,1,2),
 (50,'reportmenu','report',0,'Reports Menu','Reports Menu','ReportList.php','','bAll',NULL,0,0,NULL,1,3),
 (51,'groups','root',1,'Groups','Groups','','','bAll',NULL,0,0,NULL,1,8),
 (52,'listgroups','groups',0,'List Groups','List Groups','GroupList.php','','bAll',NULL,0,0,NULL,1,1),
 (53,'newgroup','groups',0,'Add a New Group','Add a New Group','GroupEditor.php','','bManageGroups',NULL,0,0,NULL,1,2),
 (54,'editgroup','groups',0,'Edit Group Types','Edit Group Types','OptionManager.php?mode=grptypes','','bMenuOptions',NULL,0,0,NULL,1,3),
 (55,'assigngroup','group',0,'Group Assignment Helper','Group Assignment Helper','SelectList.php?mode=groupassign','','bAll',NULL,0,0,NULL,1,4),
 (56,'properties','root',1,'Properties','Properties','','','bAll',NULL,0,0,NULL,1,9);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (57,'peopleproperty','properties',0,'People Properties','People Properties','PropertyList.php?Type=p','','bAll',NULL,0,0,NULL,1,1),
 (58,'familyproperty','properties',0,'Family Properties','Family Properties','PropertyList.php?Type=f','','bAll',NULL,0,0,NULL,1,2),
 (59,'groupproperty','properties',0,'Group Properties','Group Properties','PropertyList.php?Type=g','','bAll',NULL,0,0,NULL,1,3),
 (60,'propertytype','properties',0,'Property Types','Property Types','PropertyTypeList.php','','bAll',NULL,0,0,NULL,1,4),
 (64,'help','root',1,'Help','Help','','','bAll',NULL,0,0,NULL,1,127),
 (65,'about','help',0,'About ChurchInfo','About ChurchInfo','Help.php?page=About','','bAll',NULL,0,0,NULL,1,1),
 (66,'wiki','help',0,'Wiki Documentation','Wiki Documentation','Help.php?page=Wiki','','bAll',NULL,0,0,NULL,1,2),
 (67,'helppeople','help',0,'People','People','Help.php?page=People','','bAll',NULL,0,0,NULL,1,3);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (68,'helpfamily','help',0,'Families','Families','Help.php?page=Family','','bAll',NULL,0,0,NULL,1,4),
 (69,'helpgeofeature','help',0,'Geographic features','Geographic features','Help.php?page=Geographic','','bAll',NULL,0,0,NULL,1,5),
 (70,'helpgroups','help',0,'Groups','Groups','Help.php?page=Groups','','bAll',NULL,0,0,NULL,1,6),
 (71,'helpfinance','help',0,'Finances','Finances','Help.php?page=Finances','','bAll',NULL,0,0,NULL,1,7),
 (90,'helpfundraiser','help',0,'Fundraiser','Fundraiser','Help.php?page=Fundraiser','','bAll',NULL,0,0,NULL,1,8),
 (72,'helpreports','help',0,'Reports','Reports','Help.php?page=Reports','','bAll',NULL,0,0,NULL,1,9),
 (73,'helpadmin','help',0,'Administration','Administration','Help.php?page=Admin','','bAll',NULL,0,0,NULL,1,10),
 (74,'helpcart','help',0,'Cart','Cart','Help.php?page=Cart','','bAll',NULL,0,0,NULL,1,11),
 (75,'helpproperty','help',0,'Properties','Properties','Help.php?page=Properties','','bAll',NULL,0,0,NULL,1,12);
INSERT INTO `menuconfig_mcf` (`mid`,`name`,`parent`,`ismenu`,`content_english`,`content`,`uri`,`statustext`,`security_grp`,`session_var`,`session_var_in_text`,`session_var_in_uri`,`url_parm_name`,`active`,`sortorder`) VALUES 
 (76,'helpnotes','help',0,'Notes','Notes','Help.php?page=Notes','','bAll',NULL,0,0,NULL,1,13),
 (77,'helpcustomfields','help',0,'Custom Fields','Custom Fields','Help.php?page=Custom','','bAll',NULL,0,0,NULL,1,14),
 (78,'helpclassification','help',0,'Classifications','Classifications','Help.php?page=Class','','bAll',NULL,0,0,NULL,1,15),
 (79,'helpcanvass','help',0,'Canvass Support','Canvass Support','Help.php?page=Canvass','','bAll',NULL,0,0,NULL,1,16),
 (80,'helpevents','help',0,'Events','Events','Help.php?page=Events','','bAll',NULL,0,0,NULL,1,17),
 (81,'menusetup','admin',0,'Menu Options','Menu Options','MenuSetup.php','','bAdmin',NULL,0,0,NULL,1,13),
 (82,'customfamilyfld','admin',0,'Edit Custom Family Fields','Edit Custom Family Fields','FamilyCustomFieldsEditor.php','','bAdmin',NULL,0,0,NULL,1,3);
/*!40000 ALTER TABLE `menuconfig_mcf` ENABLE KEYS */;


--
-- Definition of table `multibuy_mb`
--

DROP TABLE IF EXISTS `multibuy_mb`;
CREATE TABLE `multibuy_mb` (
  `mb_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `mb_per_ID` mediumint(9) NOT NULL DEFAULT '0',
  `mb_item_ID` mediumint(9) NOT NULL DEFAULT '0',
  `mb_count` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`mb_ID`),
  UNIQUE KEY `mb_ID` (`mb_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `multibuy_mb`
--

/*!40000 ALTER TABLE `multibuy_mb` DISABLE KEYS */;
/*!40000 ALTER TABLE `multibuy_mb` ENABLE KEYS */;


--
-- Definition of table `note_nte`
--

DROP TABLE IF EXISTS `note_nte`;
CREATE TABLE `note_nte` (
  `nte_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nte_per_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nte_fam_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nte_Private` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nte_Text` text COLLATE utf8_unicode_ci,
  `nte_DateEntered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nte_DateLastEdited` datetime DEFAULT NULL,
  `nte_EnteredBy` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nte_EditedBy` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nte_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `note_nte`
--

/*!40000 ALTER TABLE `note_nte` DISABLE KEYS */;
/*!40000 ALTER TABLE `note_nte` ENABLE KEYS */;


--
-- Definition of table `paddlenum_pn`
--

DROP TABLE IF EXISTS `paddlenum_pn`;
CREATE TABLE `paddlenum_pn` (
  `pn_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `pn_fr_ID` mediumint(9) unsigned DEFAULT NULL,
  `pn_Num` mediumint(9) unsigned DEFAULT NULL,
  `pn_per_ID` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pn_ID`),
  UNIQUE KEY `pn_ID` (`pn_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `paddlenum_pn`
--

/*!40000 ALTER TABLE `paddlenum_pn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paddlenum_pn` ENABLE KEYS */;


--
-- Definition of table `person2group2role_p2g2r`
--

DROP TABLE IF EXISTS `person2group2role_p2g2r`;
CREATE TABLE `person2group2role_p2g2r` (
  `p2g2r_per_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `p2g2r_grp_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `p2g2r_rle_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`p2g2r_per_ID`,`p2g2r_grp_ID`),
  KEY `p2g2r_per_ID` (`p2g2r_per_ID`,`p2g2r_grp_ID`,`p2g2r_rle_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person2group2role_p2g2r`
--

/*!40000 ALTER TABLE `person2group2role_p2g2r` DISABLE KEYS */;
/*!40000 ALTER TABLE `person2group2role_p2g2r` ENABLE KEYS */;


--
-- Definition of table `person2volunteeropp_p2vo`
--

DROP TABLE IF EXISTS `person2volunteeropp_p2vo`;
CREATE TABLE `person2volunteeropp_p2vo` (
  `p2vo_ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `p2vo_per_ID` mediumint(9) DEFAULT NULL,
  `p2vo_vol_ID` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`p2vo_ID`),
  UNIQUE KEY `p2vo_ID` (`p2vo_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person2volunteeropp_p2vo`
--

/*!40000 ALTER TABLE `person2volunteeropp_p2vo` DISABLE KEYS */;
/*!40000 ALTER TABLE `person2volunteeropp_p2vo` ENABLE KEYS */;


--
-- Definition of table `person_custom`
--

DROP TABLE IF EXISTS `person_custom`;
CREATE TABLE `person_custom` (
  `per_ID` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`per_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person_custom`
--

/*!40000 ALTER TABLE `person_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_custom` ENABLE KEYS */;


--
-- Definition of table `person_custom_master`
--

DROP TABLE IF EXISTS `person_custom_master`;
CREATE TABLE `person_custom_master` (
  `custom_Order` smallint(6) NOT NULL DEFAULT '0',
  `custom_Field` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom_Name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom_Special` mediumint(8) unsigned DEFAULT NULL,
  `custom_Side` enum('left','right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'left',
  `custom_FieldSec` tinyint(4) NOT NULL,
  `type_ID` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person_custom_master`
--

/*!40000 ALTER TABLE `person_custom_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_custom_master` ENABLE KEYS */;


--
-- Definition of table `person_per`
--

DROP TABLE IF EXISTS `person_per`;
CREATE TABLE `person_per` (
  `per_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `per_Title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_FirstName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_MiddleName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_LastName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_Suffix` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_Address1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_Address2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_City` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_State` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_Zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_Country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_HomePhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_WorkPhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_CellPhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_WorkEmail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_BirthMonth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `per_BirthDay` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `per_BirthYear` year(4) DEFAULT NULL,
  `per_MembershipDate` date DEFAULT NULL,
  `per_Gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `per_fmr_ID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `per_cls_ID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `per_fam_ID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `per_Envelope` smallint(5) unsigned DEFAULT NULL,
  `per_DateLastEdited` datetime DEFAULT NULL,
  `per_DateEntered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `per_EnteredBy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `per_EditedBy` smallint(5) unsigned DEFAULT '0',
  `per_FriendDate` date DEFAULT NULL,
  `per_Flags` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`per_ID`),
  KEY `per_ID` (`per_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person_per`
--

/*!40000 ALTER TABLE `person_per` DISABLE KEYS */;
INSERT INTO `person_per` (`per_ID`,`per_Title`,`per_FirstName`,`per_MiddleName`,`per_LastName`,`per_Suffix`,`per_Address1`,`per_Address2`,`per_City`,`per_State`,`per_Zip`,`per_Country`,`per_HomePhone`,`per_WorkPhone`,`per_CellPhone`,`per_Email`,`per_WorkEmail`,`per_BirthMonth`,`per_BirthDay`,`per_BirthYear`,`per_MembershipDate`,`per_Gender`,`per_fmr_ID`,`per_cls_ID`,`per_fam_ID`,`per_Envelope`,`per_DateLastEdited`,`per_DateEntered`,`per_EnteredBy`,`per_EditedBy`,`per_FriendDate`,`per_Flags`) VALUES 
 (1,NULL,'ChurchInfo',NULL,'Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0000,NULL,0,0,0,0,NULL,NULL,'2004-08-25 18:00:00',0,0,NULL,0);
/*!40000 ALTER TABLE `person_per` ENABLE KEYS */;


--
-- Definition of table `pledge_plg`
--

DROP TABLE IF EXISTS `pledge_plg`;
CREATE TABLE `pledge_plg` (
  `plg_plgID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `plg_FamID` mediumint(9) DEFAULT NULL,
  `plg_FYID` mediumint(9) DEFAULT NULL,
  `plg_date` date DEFAULT NULL,
  `plg_amount` decimal(8,2) DEFAULT NULL,
  `plg_schedule` enum('Weekly','Monthly','Quarterly','Once','Other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `plg_method` enum('CREDITCARD','CHECK','CASH','BANKDRAFT','EGIVE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `plg_comment` text COLLATE utf8_unicode_ci,
  `plg_DateLastEdited` date NOT NULL DEFAULT '0000-00-00',
  `plg_EditedBy` mediumint(9) NOT NULL DEFAULT '0',
  `plg_PledgeOrPayment` enum('Pledge','Payment') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pledge',
  `plg_fundID` tinyint(3) unsigned DEFAULT NULL,
  `plg_depID` mediumint(9) unsigned DEFAULT NULL,
  `plg_CheckNo` bigint(16) unsigned DEFAULT NULL,
  `plg_Problem` tinyint(1) DEFAULT NULL,
  `plg_scanString` text COLLATE utf8_unicode_ci,
  `plg_aut_ID` mediumint(9) NOT NULL DEFAULT '0',
  `plg_aut_Cleared` tinyint(1) NOT NULL DEFAULT '0',
  `plg_aut_ResultID` mediumint(9) NOT NULL DEFAULT '0',
  `plg_NonDeductible` decimal(8,2) NOT NULL,
  `plg_GroupKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`plg_plgID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pledge_plg`
--

/*!40000 ALTER TABLE `pledge_plg` DISABLE KEYS */;
/*!40000 ALTER TABLE `pledge_plg` ENABLE KEYS */;


--
-- Definition of table `property_pro`
--

DROP TABLE IF EXISTS `property_pro`;
CREATE TABLE `property_pro` (
  `pro_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pro_Class` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pro_prt_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pro_Name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `pro_Description` text COLLATE utf8_unicode_ci NOT NULL,
  `pro_Prompt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pro_ID`),
  UNIQUE KEY `pro_ID` (`pro_ID`),
  KEY `pro_ID_2` (`pro_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `property_pro`
--

/*!40000 ALTER TABLE `property_pro` DISABLE KEYS */;
INSERT INTO `property_pro` (`pro_ID`,`pro_Class`,`pro_prt_ID`,`pro_Name`,`pro_Description`,`pro_Prompt`) VALUES 
 (1,'p',1,'Disabled','has a disability.','What is the nature of the disability?'),
 (2,'f',2,'Single Parent','is a single-parent household.',''),
 (3,'g',3,'Youth','is youth-oriented.','');
/*!40000 ALTER TABLE `property_pro` ENABLE KEYS */;


--
-- Definition of table `propertytype_prt`
--

DROP TABLE IF EXISTS `propertytype_prt`;
CREATE TABLE `propertytype_prt` (
  `prt_ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `prt_Class` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prt_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prt_Description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`prt_ID`),
  UNIQUE KEY `prt_ID` (`prt_ID`),
  KEY `prt_ID_2` (`prt_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `propertytype_prt`
--

/*!40000 ALTER TABLE `propertytype_prt` DISABLE KEYS */;
INSERT INTO `propertytype_prt` (`prt_ID`,`prt_Class`,`prt_Name`,`prt_Description`) VALUES 
 (1,'p','General','General Person Properties'),
 (2,'f','General','General Family Properties'),
 (3,'g','General','General Group Properties');
/*!40000 ALTER TABLE `propertytype_prt` ENABLE KEYS */;


--
-- Definition of table `query_qry`
--

DROP TABLE IF EXISTS `query_qry`;
CREATE TABLE `query_qry` (
  `qry_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `qry_SQL` text COLLATE utf8_unicode_ci NOT NULL,
  `qry_Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `qry_Description` text COLLATE utf8_unicode_ci NOT NULL,
  `qry_Count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`qry_ID`),
  UNIQUE KEY `qry_ID` (`qry_ID`),
  KEY `qry_ID_2` (`qry_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `query_qry`
--

/*!40000 ALTER TABLE `query_qry` DISABLE KEYS */;
INSERT INTO `query_qry` (`qry_ID`,`qry_SQL`,`qry_Name`,`qry_Description`,`qry_Count`) VALUES 
 (2,'SELECT COUNT(per_ID)\nAS \'Count\'\nFROM person_per','Person Count','Returns the total number of people in the database.',0),
 (3,'SELECT CONCAT(\'<a href=FamilyView.php?FamilyID=\',fam_ID,\'>\',fam_Name,\'</a>\') AS \'Family Name\', COUNT(*) AS \'No.\'\nFROM person_per\nINNER JOIN family_fam\nON fam_ID = per_fam_ID\nGROUP BY per_fam_ID\nORDER BY \'No.\' DESC','Family Member Count','Returns each family and the total number of people assigned to them.',0),
 (4,'SELECT per_ID as AddToCart,CONCAT(\'<a\r\nhref=PersonView.php?PersonID=\',per_ID,\'>\',per_FirstName,\'\r\n\',per_LastName,\'</a>\') AS Name,\r\nCONCAT(per_BirthMonth,\'/\',per_BirthDay,\'/\',per_BirthYear) AS \'Birth Date\',\r\nDATE_FORMAT(FROM_DAYS(TO_DAYS(NOW())-TO_DAYS(CONCAT(per_BirthYear,\'-\',per_BirthMonth,\'-\',per_BirthDay))),\'%Y\')+0 AS  \'Age\'\r\nFROM person_per\r\nWHERE\r\nDATE_ADD(CONCAT(per_BirthYear,\'-\',per_BirthMonth,\'-\',per_BirthDay),INTERVAL\r\n~min~ YEAR) <= CURDATE()\r\nAND\r\nDATE_ADD(CONCAT(per_BirthYear,\'-\',per_BirthMonth,\'-\',per_BirthDay),INTERVAL\r\n(~max~ + 1) YEAR) >= CURDATE()','Person by Age','Returns any person records with ages between two given ages.',1),
 (6,'SELECT COUNT(per_ID) AS Total FROM person_per WHERE per_Gender = ~gender~','Total By Gender','Total of records matching a given gender.',0);
INSERT INTO `query_qry` (`qry_ID`,`qry_SQL`,`qry_Name`,`qry_Description`,`qry_Count`) VALUES 
 (7,'SELECT per_ID as AddToCart, CONCAT(per_FirstName,\' \',per_LastName) AS Name FROM person_per WHERE per_fmr_ID = ~role~ AND per_Gender = ~gender~','Person by Role and Gender','Selects person records with the family role and gender specified.',1),
 (9,'SELECT \r\nper_ID as AddToCart, \r\nCONCAT(per_FirstName,\' \',per_LastName) AS Name, \r\nCONCAT(r2p_Value,\' \') AS Value\r\nFROM person_per,record2property_r2p\r\nWHERE per_ID = r2p_record_ID\r\nAND r2p_pro_ID = ~PropertyID~\r\nORDER BY per_LastName','Person by Property','Returns person records which are assigned the given property.',1),
 (15,'SELECT per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',per_ID,\'>\',per_FirstName,\' \',per_MiddleName,\' \',per_LastName,\'</a>\') AS Name, fam_City as City, fam_State as State, fam_Zip as ZIP, per_HomePhone as HomePhone, per_Email as Email, per_WorkEmail as WorkEmail FROM person_per RIGHT JOIN family_fam ON family_fam.fam_id = person_per.per_fam_id WHERE ~searchwhat~ LIKE \'%~searchstring~%\'','Advanced Search','Search by any part of Name, City, State, Zip, Home Phone, Email, or Work Email.',1),
 (16,'SELECT per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',per_ID,\'>\',per_FirstName,\' \',per_LastName,\'</a>\') AS Name FROM person_per LEFT JOIN person2group2role_p2g2r ON per_id = p2g2r_per_ID LEFT JOIN group_grp a ON grp_ID = p2g2r_grp_ID LEFT JOIN list_lst b ON lst_ID = grp_RoleListID AND p2g2r_rle_ID = lst_OptionID WHERE lst_OptionName = \'Teacher\'','Find Teachers','Find all people assigned to Sunday school classes as teachers',1);
INSERT INTO `query_qry` (`qry_ID`,`qry_SQL`,`qry_Name`,`qry_Description`,`qry_Count`) VALUES 
 (17,'SELECT per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',per_ID,\'>\',per_FirstName,\' \',per_LastName,\'</a>\') AS Name FROM person_per LEFT JOIN person2group2role_p2g2r ON per_id = p2g2r_per_ID LEFT JOIN group_grp a ON grp_ID = p2g2r_grp_ID LEFT JOIN list_lst b ON lst_ID = grp_RoleListID AND p2g2r_rle_ID = lst_OptionID WHERE lst_OptionName = \'Student\'','Find Students','Find all people assigned to Sunday school classes as students',1),
 (18,'SELECT per_ID as AddToCart, per_BirthDay as Day, CONCAT(per_FirstName,\' \',per_LastName) AS Name FROM person_per WHERE per_cls_ID=~percls~ AND per_BirthMonth=~birthmonth~ ORDER BY per_BirthDay','Birthdays','People with birthdays in a particular month',0),
 (19,'SELECT per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',per_ID,\'>\',per_FirstName,\' \',per_LastName,\'</a>\') AS Name FROM person_per LEFT JOIN person2group2role_p2g2r ON per_id = p2g2r_per_ID LEFT JOIN group_grp a ON grp_ID = p2g2r_grp_ID LEFT JOIN list_lst b ON lst_ID = grp_RoleListID AND p2g2r_rle_ID = lst_OptionID WHERE lst_OptionName = \'Student\' AND grp_ID = ~group~ ORDER BY per_LastName','Class Students','Find students for a particular class',1),
 (20,'SELECT per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',per_ID,\'>\',per_FirstName,\' \',per_LastName,\'</a>\') AS Name FROM person_per LEFT JOIN person2group2role_p2g2r ON per_id = p2g2r_per_ID LEFT JOIN group_grp a ON grp_ID = p2g2r_grp_ID LEFT JOIN list_lst b ON lst_ID = grp_RoleListID AND p2g2r_rle_ID = lst_OptionID WHERE lst_OptionName = \'Teacher\' AND grp_ID = ~group~ ORDER BY per_LastName','Class Teachers','Find teachers for a particular class',1);
INSERT INTO `query_qry` (`qry_ID`,`qry_SQL`,`qry_Name`,`qry_Description`,`qry_Count`) VALUES 
 (21,'SELECT per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',per_ID,\'>\',per_FirstName,\' \',per_LastName,\'</a>\') AS Name FROM person_per LEFT JOIN person2group2role_p2g2r ON per_id = p2g2r_per_ID WHERE p2g2r_grp_ID=~group~ ORDER BY per_LastName','Registered students','Find Registered students',1),
 (22,'SELECT per_ID as AddToCart, DAYOFMONTH(per_MembershipDate) as Day, per_MembershipDate AS DATE, CONCAT(per_FirstName,\' \',per_LastName) AS Name FROM person_per WHERE per_cls_ID=1 AND MONTH(per_MembershipDate)=~membermonth~ ORDER BY per_MembershipDate','Membership anniversaries','Members who joined in a particular month',0),
 (23,'SELECT usr_per_ID as AddToCart, CONCAT(a.per_FirstName,\' \',a.per_LastName) AS Name FROM user_usr LEFT JOIN person_per a ON per_ID=usr_per_ID ORDER BY per_LastName','Select database users','People who are registered as database users',0),
 (24,'SELECT per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',per_ID,\'>\',per_FirstName,\' \',per_LastName,\'</a>\') AS Name FROM person_per WHERE per_cls_id =1','Select all members','People who are members',0),
 (25,'SELECT per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',per_ID,\'>\',per_FirstName,\' \',per_LastName,\'</a>\') AS Name FROM person_per LEFT JOIN person2volunteeropp_p2vo ON per_id = p2vo_per_ID WHERE p2vo_vol_ID = ~volopp~ ORDER BY per_LastName','Volunteers','Find volunteers for a particular opportunity',1);
INSERT INTO `query_qry` (`qry_ID`,`qry_SQL`,`qry_Name`,`qry_Description`,`qry_Count`) VALUES 
 (26,'SELECT per_ID as AddToCart, CONCAT(per_FirstName,\' \',per_LastName) AS Name FROM person_per WHERE DATE_SUB(NOW(),INTERVAL ~friendmonths~ MONTH)<per_FriendDate ORDER BY per_MembershipDate','Recent friends','Friends who signed up in previous months',0),
 (27,'SELECT per_ID as AddToCart, CONCAT(per_FirstName,\' \',per_LastName) AS Name FROM person_per inner join family_fam on per_fam_ID=fam_ID where per_fmr_ID<>3 AND fam_OkToCanvass=\"TRUE\" ORDER BY fam_Zip','Families to Canvass','People in families that are ok to canvass.',0),
 (28,'SELECT fam_Name, a.plg_amount as PlgFY1, b.plg_amount as PlgFY2 from family_fam left join pledge_plg a on a.plg_famID = fam_ID and a.plg_FYID=~fyid1~ and a.plg_PledgeOrPayment=\'Pledge\' left join pledge_plg b on b.plg_famID = fam_ID and b.plg_FYID=~fyid2~ and b.plg_PledgeOrPayment=\'Pledge\' order by fam_Name','Pledge comparison','Compare pledges between two fiscal years',1),
 (30,'SELECT per_ID as AddToCart, CONCAT(per_FirstName,\' \',per_LastName) AS Name, fam_address1, fam_city, fam_state, fam_zip FROM person_per join family_fam on per_fam_id=fam_id where per_fmr_id<>3 and per_fam_id in (select fam_id from family_fam inner join pledge_plg a on a.plg_famID=fam_ID and a.plg_FYID=~fyid1~ and a.plg_amount>0) and per_fam_id not in (select fam_id from family_fam inner join pledge_plg b on b.plg_famID=fam_ID and b.plg_FYID=~fyid2~ and b.plg_amount>0)','Missing pledges','Find people who pledged one year but not another',1);
INSERT INTO `query_qry` (`qry_ID`,`qry_SQL`,`qry_Name`,`qry_Description`,`qry_Count`) VALUES 
 (31,'select per_ID as AddToCart, per_FirstName, per_LastName, per_email from person_per, autopayment_aut where aut_famID=per_fam_ID and aut_CreditCard!=\"\" and per_email!=\"\" and (per_fmr_ID=1 or per_fmr_ID=2 or per_cls_ID=1)','Credit Card People','People who are configured to pay by credit card.',0),
 (32,'SELECT fam_Name, fam_Envelope, b.fun_Name as Fund_Name, a.plg_amount as Pledge from family_fam left join pledge_plg a on a.plg_famID = fam_ID and a.plg_FYID=~fyid~ and a.plg_PledgeOrPayment=\'Pledge\' and a.plg_amount>0 join donationfund_fun b on b.fun_ID = a.plg_fundID order by fam_Name, a.plg_fundID','Family Pledge by Fiscal Year','Pledge summary by family name for each fund for the selected fiscal year',1),
 (100,'SELECT a.per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',a.per_ID,\'>\',a.per_FirstName,\' \',a.per_LastName,\'</a>\') AS Name FROM person_per AS a LEFT JOIN person2volunteeropp_p2vo p2v1 ON (a.per_id = p2v1.p2vo_per_ID AND p2v1.p2vo_vol_ID = ~volopp1~) LEFT JOIN person2volunteeropp_p2vo p2v2 ON (a.per_id = p2v2.p2vo_per_ID AND p2v2.p2vo_vol_ID = ~volopp2~) WHERE p2v1.p2vo_per_ID=p2v2.p2vo_per_ID ORDER BY per_LastName','Volunteers','Find volunteers for who match two specific opportunity codes',1),
 (200,'SELECT a.per_ID as AddToCart, CONCAT(\'<a href=PersonView.php?PersonID=\',a.per_ID,\'>\',a.per_FirstName,\' \',a.per_LastName,\'</a>\') AS Name FROM person_per AS a LEFT JOIN person_custom pc ON a.per_id = pc.per_ID WHERE pc.~custom~=\'~value~\' ORDER BY per_LastName','CustomSearch','Find people with a custom field value',1);
/*!40000 ALTER TABLE `query_qry` ENABLE KEYS */;


--
-- Definition of table `queryparameteroptions_qpo`
--

DROP TABLE IF EXISTS `queryparameteroptions_qpo`;
CREATE TABLE `queryparameteroptions_qpo` (
  `qpo_ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `qpo_qrp_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `qpo_Display` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `qpo_Value` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`qpo_ID`),
  UNIQUE KEY `qpo_ID` (`qpo_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `queryparameteroptions_qpo`
--

/*!40000 ALTER TABLE `queryparameteroptions_qpo` DISABLE KEYS */;
INSERT INTO `queryparameteroptions_qpo` (`qpo_ID`,`qpo_qrp_ID`,`qpo_Display`,`qpo_Value`) VALUES 
 (1,4,'Male','1'),
 (2,4,'Female','2'),
 (3,6,'Male','1'),
 (4,6,'Female','2'),
 (5,15,'Name','CONCAT(per_FirstName,per_MiddleName,per_LastName)'),
 (6,15,'Zip Code','fam_Zip'),
 (7,15,'State','fam_State'),
 (8,15,'City','fam_City'),
 (9,15,'Home Phone','per_HomePhone'),
 (10,27,'2012/2013','17'),
 (11,27,'2013/2014','18'),
 (12,27,'2014/2015','19'),
 (13,27,'2015/2016','20'),
 (14,28,'2012/2013','17'),
 (15,28,'2013/2014','18'),
 (16,28,'2014/2015','19'),
 (17,28,'2015/2016','20'),
 (18,30,'2012/2013','17'),
 (19,30,'2013/2014','18'),
 (20,30,'2014/2015','19'),
 (21,30,'2015/2016','20'),
 (22,31,'2012/2013','17'),
 (23,31,'2013/2014','18'),
 (24,31,'2014/2015','19'),
 (25,31,'2015/2016','20'),
 (26,15,'Email','per_Email'),
 (27,15,'WorkEmail','per_WorkEmail'),
 (28,32,'2012/2013','17'),
 (29,32,'2013/2014','18'),
 (30,32,'2014/2015','19'),
 (31,32,'2015/2016','20'),
 (32,33,'Member','1'),
 (33,33,'Regular Attender','2');
INSERT INTO `queryparameteroptions_qpo` (`qpo_ID`,`qpo_qrp_ID`,`qpo_Display`,`qpo_Value`) VALUES 
 (34,33,'Guest','3'),
 (35,33,'Non-Attender','4'),
 (36,33,'Non-Attender (staff)','5');
/*!40000 ALTER TABLE `queryparameteroptions_qpo` ENABLE KEYS */;


--
-- Definition of table `queryparameters_qrp`
--

DROP TABLE IF EXISTS `queryparameters_qrp`;
CREATE TABLE `queryparameters_qrp` (
  `qrp_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `qrp_qry_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `qrp_Type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `qrp_OptionSQL` text COLLATE utf8_unicode_ci,
  `qrp_Name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qrp_Description` text COLLATE utf8_unicode_ci,
  `qrp_Alias` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qrp_Default` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qrp_Required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `qrp_InputBoxSize` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `qrp_Validation` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `qrp_NumericMax` int(11) DEFAULT NULL,
  `qrp_NumericMin` int(11) DEFAULT NULL,
  `qrp_AlphaMinLength` int(11) DEFAULT NULL,
  `qrp_AlphaMaxLength` int(11) DEFAULT NULL,
  PRIMARY KEY (`qrp_ID`),
  UNIQUE KEY `qrp_ID` (`qrp_ID`),
  KEY `qrp_ID_2` (`qrp_ID`),
  KEY `qrp_qry_ID` (`qrp_qry_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `queryparameters_qrp`
--

/*!40000 ALTER TABLE `queryparameters_qrp` DISABLE KEYS */;
INSERT INTO `queryparameters_qrp` (`qrp_ID`,`qrp_qry_ID`,`qrp_Type`,`qrp_OptionSQL`,`qrp_Name`,`qrp_Description`,`qrp_Alias`,`qrp_Default`,`qrp_Required`,`qrp_InputBoxSize`,`qrp_Validation`,`qrp_NumericMax`,`qrp_NumericMin`,`qrp_AlphaMinLength`,`qrp_AlphaMaxLength`) VALUES 
 (1,4,0,NULL,'Minimum Age','The minimum age for which you want records returned.','min','0',0,5,'n',120,0,NULL,NULL),
 (2,4,0,NULL,'Maximum Age','The maximum age for which you want records returned.','max','120',1,5,'n',120,0,NULL,NULL),
 (4,6,1,'','Gender','The desired gender to search the database for.','gender','1',1,0,'',0,0,0,0),
 (5,7,2,'SELECT lst_OptionID as Value, lst_OptionName as Display FROM list_lst WHERE lst_ID=2 ORDER BY lst_OptionSequence','Family Role','Select the desired family role.','role','1',0,0,'',0,0,0,0),
 (6,7,1,'','Gender','The gender for which you would like records returned.','gender','1',1,0,'',0,0,0,0),
 (8,9,2,'SELECT pro_ID AS Value, pro_Name as Display \r\nFROM property_pro\r\nWHERE pro_Class= \'p\' \r\nORDER BY pro_Name ','Property','The property for which you would like person records returned.','PropertyID','0',1,0,'',0,0,0,0),
 (9,10,2,'SELECT distinct don_date as Value, don_date as Display FROM donations_don ORDER BY don_date ASC','Beginning Date','Please select the beginning date to calculate total contributions for each member (i.e. YYYY-MM-DD). NOTE: You can only choose dates that conatain donations.','startdate','1',1,0,'0',0,0,0,0);
INSERT INTO `queryparameters_qrp` (`qrp_ID`,`qrp_qry_ID`,`qrp_Type`,`qrp_OptionSQL`,`qrp_Name`,`qrp_Description`,`qrp_Alias`,`qrp_Default`,`qrp_Required`,`qrp_InputBoxSize`,`qrp_Validation`,`qrp_NumericMax`,`qrp_NumericMin`,`qrp_AlphaMinLength`,`qrp_AlphaMaxLength`) VALUES 
 (10,10,2,'SELECT distinct don_date as Value, don_date as Display FROM donations_don\r\nORDER BY don_date DESC','Ending Date','Please enter the last date to calculate total contributions for each member (i.e. YYYY-MM-DD).','enddate','1',1,0,'',0,0,0,0),
 (14,15,0,'','Search','Enter any part of the following: Name, City, State, Zip, Home Phone, Email, or Work Email.','searchstring','',1,0,'',0,0,0,0),
 (15,15,1,'','Field','Select field to search for.','searchwhat','1',1,0,'',0,0,0,0),
 (16,11,2,'SELECT distinct don_date as Value, don_date as Display FROM donations_don ORDER BY don_date ASC','Beginning Date','Please select the beginning date to calculate total contributions for each member (i.e. YYYY-MM-DD). NOTE: You can only choose dates that conatain donations.','startdate','1',1,0,'0',0,0,0,0),
 (17,11,2,'SELECT distinct don_date as Value, don_date as Display FROM donations_don\r\nORDER BY don_date DESC','Ending Date','Please enter the last date to calculate total contributions for each member (i.e. YYYY-MM-DD).','enddate','1',1,0,'',0,0,0,0);
INSERT INTO `queryparameters_qrp` (`qrp_ID`,`qrp_qry_ID`,`qrp_Type`,`qrp_OptionSQL`,`qrp_Name`,`qrp_Description`,`qrp_Alias`,`qrp_Default`,`qrp_Required`,`qrp_InputBoxSize`,`qrp_Validation`,`qrp_NumericMax`,`qrp_NumericMin`,`qrp_AlphaMinLength`,`qrp_AlphaMaxLength`) VALUES 
 (18,18,0,'','Month','The birthday month for which you would like records returned.','birthmonth','1',1,0,'',12,1,1,2),
 (19,19,2,'SELECT grp_ID AS Value, grp_Name AS Display FROM group_grp ORDER BY grp_Type','Class','The sunday school class for which you would like records returned.','group','1',1,0,'',12,1,1,2),
 (20,20,2,'SELECT grp_ID AS Value, grp_Name AS Display FROM group_grp ORDER BY grp_Type','Class','The sunday school class for which you would like records returned.','group','1',1,0,'',12,1,1,2),
 (21,21,2,'SELECT grp_ID AS Value, grp_Name AS Display FROM group_grp ORDER BY grp_Type','Registered students','Group of registered students','group','1',1,0,'',12,1,1,2),
 (22,22,0,'','Month','The membership anniversary month for which you would like records returned.','membermonth','1',1,0,'',12,1,1,2),
 (25,25,2,'SELECT vol_ID AS Value, vol_Name AS Display FROM volunteeropportunity_vol ORDER BY vol_Name','Volunteer opportunities','Choose a volunteer opportunity','volopp','1',1,0,'',12,1,1,2);
INSERT INTO `queryparameters_qrp` (`qrp_ID`,`qrp_qry_ID`,`qrp_Type`,`qrp_OptionSQL`,`qrp_Name`,`qrp_Description`,`qrp_Alias`,`qrp_Default`,`qrp_Required`,`qrp_InputBoxSize`,`qrp_Validation`,`qrp_NumericMax`,`qrp_NumericMin`,`qrp_AlphaMinLength`,`qrp_AlphaMaxLength`) VALUES 
 (26,26,0,'','Months','Number of months since becoming a friend','friendmonths','1',1,0,'',24,1,1,2),
 (27,28,1,'','First Fiscal Year','First fiscal year for comparison','fyid1','9',1,0,'',12,9,0,0),
 (28,28,1,'','Second Fiscal Year','Second fiscal year for comparison','fyid2','9',1,0,'',12,9,0,0),
 (30,30,1,'','First Fiscal Year','Pledged this year','fyid1','9',1,0,'',12,9,0,0),
 (31,30,1,'','Second Fiscal Year','but not this year','fyid2','9',1,0,'',12,9,0,0),
 (32,32,1,'','Fiscal Year','Fiscal Year.','fyid','9',1,0,'',12,9,0,0),
 (33,18,1,'','Classification','Member, Regular Attender, etc.','percls','1',1,0,'',12,1,1,2),
 (100,100,2,'SELECT vol_ID AS Value, vol_Name AS Display FROM volunteeropportunity_vol ORDER BY vol_Name','Volunteer opportunities','First volunteer opportunity choice','volopp1','1',1,0,'',12,1,1,2),
 (101,100,2,'SELECT vol_ID AS Value, vol_Name AS Display FROM volunteeropportunity_vol ORDER BY vol_Name','Volunteer opportunities','Second volunteer opportunity choice','volopp2','1',1,0,'',12,1,1,2);
INSERT INTO `queryparameters_qrp` (`qrp_ID`,`qrp_qry_ID`,`qrp_Type`,`qrp_OptionSQL`,`qrp_Name`,`qrp_Description`,`qrp_Alias`,`qrp_Default`,`qrp_Required`,`qrp_InputBoxSize`,`qrp_Validation`,`qrp_NumericMax`,`qrp_NumericMin`,`qrp_AlphaMinLength`,`qrp_AlphaMaxLength`) VALUES 
 (200,200,2,'SELECT custom_field as Value, custom_Name as Display FROM person_custom_master','Custom field','Choose customer person field','custom','1',0,0,'',0,0,0,0),
 (201,200,0,'','Field value','Match custom field to this value','value','1',0,0,'',0,0,0,0);
/*!40000 ALTER TABLE `queryparameters_qrp` ENABLE KEYS */;


--
-- Definition of table `record2property_r2p`
--

DROP TABLE IF EXISTS `record2property_r2p`;
CREATE TABLE `record2property_r2p` (
  `r2p_pro_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `r2p_record_ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `r2p_Value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `record2property_r2p`
--

/*!40000 ALTER TABLE `record2property_r2p` DISABLE KEYS */;
/*!40000 ALTER TABLE `record2property_r2p` ENABLE KEYS */;


--
-- Definition of table `result_res`
--

DROP TABLE IF EXISTS `result_res`;
CREATE TABLE `result_res` (
  `res_ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `res_echotype1` text COLLATE utf8_unicode_ci NOT NULL,
  `res_echotype2` text COLLATE utf8_unicode_ci NOT NULL,
  `res_echotype3` text COLLATE utf8_unicode_ci NOT NULL,
  `res_authorization` text COLLATE utf8_unicode_ci NOT NULL,
  `res_order_number` text COLLATE utf8_unicode_ci NOT NULL,
  `res_reference` text COLLATE utf8_unicode_ci NOT NULL,
  `res_status` text COLLATE utf8_unicode_ci NOT NULL,
  `res_avs_result` text COLLATE utf8_unicode_ci NOT NULL,
  `res_security_result` text COLLATE utf8_unicode_ci NOT NULL,
  `res_mac` text COLLATE utf8_unicode_ci NOT NULL,
  `res_decline_code` text COLLATE utf8_unicode_ci NOT NULL,
  `res_tran_date` text COLLATE utf8_unicode_ci NOT NULL,
  `res_merchant_name` text COLLATE utf8_unicode_ci NOT NULL,
  `res_version` text COLLATE utf8_unicode_ci NOT NULL,
  `res_EchoServer` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`res_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `result_res`
--

/*!40000 ALTER TABLE `result_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `result_res` ENABLE KEYS */;


--
-- Definition of table `user_usr`
--

DROP TABLE IF EXISTS `user_usr`;
CREATE TABLE `user_usr` (
  `usr_per_ID` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `usr_Password` text COLLATE utf8_unicode_ci NOT NULL,
  `usr_NeedPasswordChange` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `usr_LastLogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usr_LoginCount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usr_FailedLogins` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_AddRecords` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_EditRecords` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_DeleteRecords` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_MenuOptions` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_ManageGroups` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_Finance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_Communication` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_Notes` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_Admin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_Workspacewidth` smallint(6) DEFAULT NULL,
  `usr_BaseFontSize` tinyint(4) DEFAULT NULL,
  `usr_SearchLimit` tinyint(4) DEFAULT '10',
  `usr_Style` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'Style.css',
  `usr_showPledges` tinyint(1) NOT NULL DEFAULT '0',
  `usr_showPayments` tinyint(1) NOT NULL DEFAULT '0',
  `usr_showSince` date NOT NULL DEFAULT '0000-00-00',
  `usr_defaultFY` mediumint(9) NOT NULL DEFAULT '10',
  `usr_currentDeposit` mediumint(9) NOT NULL DEFAULT '0',
  `usr_UserName` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_EditSelf` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usr_CalStart` date DEFAULT NULL,
  `usr_CalEnd` date DEFAULT NULL,
  `usr_CalNoSchool1` date DEFAULT NULL,
  `usr_CalNoSchool2` date DEFAULT NULL,
  `usr_CalNoSchool3` date DEFAULT NULL,
  `usr_CalNoSchool4` date DEFAULT NULL,
  `usr_CalNoSchool5` date DEFAULT NULL,
  `usr_CalNoSchool6` date DEFAULT NULL,
  `usr_CalNoSchool7` date DEFAULT NULL,
  `usr_CalNoSchool8` date DEFAULT NULL,
  `usr_SearchFamily` tinyint(3) DEFAULT NULL,
  `usr_Canvasser` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usr_per_ID`),
  UNIQUE KEY `usr_UserName` (`usr_UserName`),
  KEY `usr_per_ID` (`usr_per_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_usr`
--

/*!40000 ALTER TABLE `user_usr` DISABLE KEYS */;
INSERT INTO `user_usr` (`usr_per_ID`,`usr_Password`,`usr_NeedPasswordChange`,`usr_LastLogin`,`usr_LoginCount`,`usr_FailedLogins`,`usr_AddRecords`,`usr_EditRecords`,`usr_DeleteRecords`,`usr_MenuOptions`,`usr_ManageGroups`,`usr_Finance`,`usr_Communication`,`usr_Notes`,`usr_Admin`,`usr_Workspacewidth`,`usr_BaseFontSize`,`usr_SearchLimit`,`usr_Style`,`usr_showPledges`,`usr_showPayments`,`usr_showSince`,`usr_defaultFY`,`usr_currentDeposit`,`usr_UserName`,`usr_EditSelf`,`usr_CalStart`,`usr_CalEnd`,`usr_CalNoSchool1`,`usr_CalNoSchool2`,`usr_CalNoSchool3`,`usr_CalNoSchool4`,`usr_CalNoSchool5`,`usr_CalNoSchool6`,`usr_CalNoSchool7`,`usr_CalNoSchool8`,`usr_SearchFamily`,`usr_Canvasser`) VALUES 
 (1,'0f6b31b40e622d92344d3c3c5112b32816ac9a0fcc8993a8277ffeb95db297c8',0,'2017-10-03 12:09:24',3,0,1,1,1,1,1,1,1,1,1,580,9,10,'Style.css',0,0,'0000-00-00',20,0,'Admin',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `user_usr` ENABLE KEYS */;


--
-- Definition of table `userconfig_ucfg`
--

DROP TABLE IF EXISTS `userconfig_ucfg`;
CREATE TABLE `userconfig_ucfg` (
  `ucfg_per_id` mediumint(9) unsigned NOT NULL,
  `ucfg_id` int(11) NOT NULL DEFAULT '0',
  `ucfg_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ucfg_value` text COLLATE utf8_unicode_ci,
  `ucfg_type` enum('text','number','date','boolean','textarea') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `ucfg_tooltip` text COLLATE utf8_unicode_ci NOT NULL,
  `ucfg_permission` enum('FALSE','TRUE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FALSE',
  `ucfg_cat` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ucfg_per_id`,`ucfg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userconfig_ucfg`
--

/*!40000 ALTER TABLE `userconfig_ucfg` DISABLE KEYS */;
INSERT INTO `userconfig_ucfg` (`ucfg_per_id`,`ucfg_id`,`ucfg_name`,`ucfg_value`,`ucfg_type`,`ucfg_tooltip`,`ucfg_permission`,`ucfg_cat`) VALUES 
 (0,0,'bEmailMailto','1','boolean','User permission to send email via mailto: links','TRUE',''),
 (0,1,'sMailtoDelimiter',',','text','Delimiter to separate emails in mailto: links','TRUE',''),
 (0,2,'bSendPHPMail','0','boolean','User permission to send email using PHPMailer','FALSE',''),
 (0,3,'sFromEmailAddress','','text','Reply email address: PHPMailer','FALSE',''),
 (0,4,'sFromName','ChurchInfo Webmaster','text','Name that appears in From field: PHPMailer','FALSE',''),
 (0,5,'bCreateDirectory','0','boolean','User permission to create directories','FALSE','SECURITY'),
 (0,6,'bExportCSV','0','boolean','User permission to export CSV files','FALSE','SECURITY'),
 (0,7,'bUSAddressVerification','0','boolean','User permission to use IST Address Verification','FALSE',''),
 (1,0,'bEmailMailto','1','boolean','User permission to send email via mailto: links','TRUE',''),
 (1,1,'sMailtoDelimiter',',','text','user permission to send email via mailto: links','TRUE','');
INSERT INTO `userconfig_ucfg` (`ucfg_per_id`,`ucfg_id`,`ucfg_name`,`ucfg_value`,`ucfg_type`,`ucfg_tooltip`,`ucfg_permission`,`ucfg_cat`) VALUES 
 (1,2,'bSendPHPMail','1','boolean','User permission to send email using PHPMailer','TRUE',''),
 (1,3,'sFromEmailAddress','','text','Reply email address for PHPMailer','TRUE',''),
 (1,4,'sFromName','ChurchInfo Webmaster','text','Name that appears in From field','TRUE',''),
 (1,5,'bCreateDirectory','1','boolean','User permission to create directories','TRUE',''),
 (1,6,'bExportCSV','1','boolean','User permission to export CSV files','TRUE',''),
 (1,7,'bUSAddressVerification','1','boolean','User permission to use IST Address Verification','TRUE',''),
 (0,10,'bAddEvent','0','boolean','Allow user to add new event','FALSE','SECURITY'),
 (0,11,'bSeePrivacyData','0','boolean','Allow user to see member privacy data, e.g. Birth Year, Age.','FALSE','SECURITY');
/*!40000 ALTER TABLE `userconfig_ucfg` ENABLE KEYS */;


--
-- Definition of table `version_ver`
--

DROP TABLE IF EXISTS `version_ver`;
CREATE TABLE `version_ver` (
  `ver_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `ver_version` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ver_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ver_ID`),
  UNIQUE KEY `ver_version` (`ver_version`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `version_ver`
--

/*!40000 ALTER TABLE `version_ver` DISABLE KEYS */;
INSERT INTO `version_ver` (`ver_ID`,`ver_version`,`ver_date`) VALUES 
 (3,'1.2.14','2015-06-26 15:49:05');
/*!40000 ALTER TABLE `version_ver` ENABLE KEYS */;


--
-- Definition of table `volunteeropportunity_vol`
--

DROP TABLE IF EXISTS `volunteeropportunity_vol`;
CREATE TABLE `volunteeropportunity_vol` (
  `vol_ID` int(3) NOT NULL AUTO_INCREMENT,
  `vol_Order` int(3) NOT NULL DEFAULT '0',
  `vol_Active` enum('true','false') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `vol_Name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vol_Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`vol_ID`),
  UNIQUE KEY `vol_ID` (`vol_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `volunteeropportunity_vol`
--

/*!40000 ALTER TABLE `volunteeropportunity_vol` DISABLE KEYS */;
/*!40000 ALTER TABLE `volunteeropportunity_vol` ENABLE KEYS */;


--
-- Definition of table `whycame_why`
--

DROP TABLE IF EXISTS `whycame_why`;
CREATE TABLE `whycame_why` (
  `why_ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `why_per_ID` mediumint(9) NOT NULL DEFAULT '0',
  `why_join` text COLLATE utf8_unicode_ci NOT NULL,
  `why_come` text COLLATE utf8_unicode_ci NOT NULL,
  `why_suggest` text COLLATE utf8_unicode_ci NOT NULL,
  `why_hearOfUs` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`why_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `whycame_why`
--

/*!40000 ALTER TABLE `whycame_why` DISABLE KEYS */;
/*!40000 ALTER TABLE `whycame_why` ENABLE KEYS */;

--
-- Create schema churchmgt
--

CREATE DATABASE IF NOT EXISTS churchmgt;
USE churchmgt;

--
-- Definition of table `baptismal register`
--

DROP TABLE IF EXISTS `baptismal register`;
CREATE TABLE `baptismal register` (
  `card_number` int(11) NOT NULL,
  `date_of_baptism` date NOT NULL,
  `place_of_baptism` text NOT NULL,
  `baptism_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `place_of_birth` varchar(150) NOT NULL,
  `home_town` text NOT NULL,
  `father_name` varchar(150) NOT NULL,
  `mother_name` varchar(150) NOT NULL,
  `sponsor` varchar(150) NOT NULL,
  `minister` text NOT NULL,
  `confirmation` varchar(10) NOT NULL,
  `marriage` varchar(11) NOT NULL,
  PRIMARY KEY (`card_number`),
  UNIQUE KEY `card_number` (`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `baptismal register`
--

/*!40000 ALTER TABLE `baptismal register` DISABLE KEYS */;
/*!40000 ALTER TABLE `baptismal register` ENABLE KEYS */;


--
-- Definition of table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_type` enum('CS','SS','VOL') NOT NULL,
  `event_title` varchar(200) NOT NULL,
  `event_desc` text NOT NULL,
  `event_text` text NOT NULL,
  `event_start` datetime NOT NULL,
  `event_end` datetime NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` (`event_id`,`event_type`,`event_title`,`event_desc`,`event_text`,`event_start`,`event_end`) VALUES 
 (0,'','Blessed are the poor in spirit','taka place in Zaria','','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;


--
-- Definition of table `expenditure`
--

DROP TABLE IF EXISTS `expenditure`;
CREATE TABLE `expenditure` (
  `exp_id` mediumint(12) unsigned NOT NULL,
  `home_exp` text NOT NULL,
  `transport_exp` text NOT NULL,
  `central_fund_exp` text NOT NULL,
  `insurance_policies` varchar(120) NOT NULL,
  `other_exp` text NOT NULL,
  `Second_collection` varchar(50) NOT NULL,
  `special_exp` text NOT NULL,
  `captial_project` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expenditure`
--

/*!40000 ALTER TABLE `expenditure` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenditure` ENABLE KEYS */;


--
-- Definition of table `family_fam`
--

DROP TABLE IF EXISTS `family_fam`;
CREATE TABLE `family_fam` (
  `fam_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `fam_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_City` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_State` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_HomePhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_WorkPhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_CellPhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fam_WeddingDate` date DEFAULT NULL,
  `fam_DateEntered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fam_DateLastEdited` datetime DEFAULT NULL,
  `fam_EnteredBy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fam_EditedBy` smallint(5) unsigned DEFAULT '0',
  `fam_scanCheck` text COLLATE utf8_unicode_ci,
  `fam_scanCredit` text COLLATE utf8_unicode_ci,
  `fam_SendNewsLetter` enum('FALSE','TRUE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FALSE',
  `fam_DateDeactivated` date DEFAULT NULL,
  `fam_OkToCanvass` enum('FALSE','TRUE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FALSE',
  `fam_Canvasser` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fam_Latitude` double DEFAULT NULL,
  `fam_Longitude` double DEFAULT NULL,
  `fam_Envelope` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fam_ID`),
  KEY `fam_ID` (`fam_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `family_fam`
--

/*!40000 ALTER TABLE `family_fam` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_fam` ENABLE KEYS */;


--
-- Definition of table `parish`
--

DROP TABLE IF EXISTS `parish`;
CREATE TABLE `parish` (
  `Parish_id` int(11) NOT NULL AUTO_INCREMENT,
  `Diocesan_ID` int(11) NOT NULL DEFAULT '1',
  `Parish_Name` varchar(120) NOT NULL,
  `Address` text NOT NULL,
  `PriestInCharge` varchar(100) NOT NULL,
  PRIMARY KEY (`Parish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parish`
--

/*!40000 ALTER TABLE `parish` DISABLE KEYS */;
INSERT INTO `parish` (`Parish_id`,`Diocesan_ID`,`Parish_Name`,`Address`,`PriestInCharge`) VALUES 
 (1,1,'Christ The King Catholic Cathedral, Zaria','No. 80 Yoruba Street Sabon Gari - Zaria, Kaduna State','Very. Rev. Fr. Henry Bidi Atuma'),
 (2,1,'St. Johns Parish Kings Road','Muchia','Fr. Isaac Agu'),
 (3,1,'St. Paul','Angwan Pete','Fr. John Obrain');
/*!40000 ALTER TABLE `parish` ENABLE KEYS */;


--
-- Definition of table `parish_income`
--

DROP TABLE IF EXISTS `parish_income`;
CREATE TABLE `parish_income` (
  `Inc_Id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT,
  `main_parish_income` varchar(25) DEFAULT NULL,
  `diocesan_support` varchar(25) NOT NULL,
  `Insurance` varchar(11) NOT NULL,
  `second_collection` varchar(11) NOT NULL,
  `special_collection` varchar(11) NOT NULL,
  `special_donation` text NOT NULL,
  PRIMARY KEY (`Inc_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parish_income`
--

/*!40000 ALTER TABLE `parish_income` DISABLE KEYS */;
INSERT INTO `parish_income` (`Inc_Id`,`main_parish_income`,`diocesan_support`,`Insurance`,`second_collection`,`special_collection`,`special_donation`) VALUES 
 (4,'43443','3553','3245','66788','44666','34456');
/*!40000 ALTER TABLE `parish_income` ENABLE KEYS */;


--
-- Definition of table `parishioners`
--

DROP TABLE IF EXISTS `parishioners`;
CREATE TABLE `parishioners` (
  `Parishioner_ID` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `Address` text NOT NULL,
  `Society` text NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Phone_Number` varchar(11) NOT NULL,
  `Sex` varchar(1) NOT NULL,
  PRIMARY KEY (`Parishioner_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parishioners`
--

/*!40000 ALTER TABLE `parishioners` DISABLE KEYS */;
INSERT INTO `parishioners` (`Parishioner_ID`,`Name`,`Address`,`Society`,`Date_of_Birth`,`Phone_Number`,`Sex`) VALUES 
 (0,'Mr. John Johnson','No 67 Club Street','','0000-00-00','','');
/*!40000 ALTER TABLE `parishioners` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

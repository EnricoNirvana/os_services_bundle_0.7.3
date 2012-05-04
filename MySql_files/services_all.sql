-- --------------------------------------------------------
-- This is a unified 'opensim_services' sql template which combines 
-- all necessary tables for the groups, profile, offline messages
-- and search modules into a single database. It refers to and contains 
-- code taken from the following source repositories:
-- 
-- The Flotsam Project:
-- https://github.com/mcortez/flotsam/tree/master/flotsam/Servers/XmlRpcGroupsServer/
-- The OpenSim Profile Project:
-- http://forge.opensimulator.org/gf/project/osprofile/scmsvn/
-- The OpenSim Search Project:
-- http://forge.opensimulator.org/gf/project/ossearch/scmsvn/
-- The OSGrid file repository:
-- http://download.osgrid.org/
--
-- All credits go to the respective authors and contributers of
-- these projects. More information can be found at the urls above and
-- in the documentation included with this distribution.

-- This code open source and is provided under the OpenSim BSD licence:
-- http://opensimulator.org/wiki/BSD_License
-- --------------------------------------------------------
--
-- MySQL Server version: 5.1.58
-- PHP Version: 5.3.6-13ubuntu3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

-- --------------------------------------------------------

-- --------------------------------------------------------
-- Shared Tables for Profile/Search modules:
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `classifieds` (
  `classifieduuid` char(36) NOT NULL,
  `creatoruuid` char(36) NOT NULL,
  `creationdate` int(20) NOT NULL,
  `expirationdate` int(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parceluuid` char(36) NOT NULL,
  `parentestate` int(11) NOT NULL,
  `snapshotuuid` char(36) NOT NULL,
  `simname` varchar(255) NOT NULL,
  `posglobal` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `classifiedflags` int(8) NOT NULL,
  `priceforlisting` int(5) NOT NULL,
  PRIMARY KEY (`classifieduuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

-- --------------------------------------------------------

-- --------------------------------------------------------
-- Tables for Profile module:
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `usernotes` (
  `useruuid` varchar(36) NOT NULL,
  `targetuuid` varchar(36) NOT NULL,
  `notes` text NOT NULL,
  UNIQUE KEY `useruuid` (`useruuid`,`targetuuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `userpicks` (
  `pickuuid` varchar(36) NOT NULL,
  `creatoruuid` varchar(36) NOT NULL,
  `toppick` enum('true','false') NOT NULL,
  `parceluuid` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `snapshotuuid` varchar(36) NOT NULL,
  `user` varchar(255) NOT NULL,
  `originalname` varchar(255) NOT NULL,
  `simname` varchar(255) NOT NULL,
  `posglobal` varchar(255) NOT NULL,
  `sortorder` int(2) NOT NULL,
  `enabled` enum('true','false') NOT NULL,
  PRIMARY KEY (`pickuuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `userprofile` (
  `useruuid` varchar(36) NOT NULL,
  `profilePartner` varchar(36) NOT NULL,
  `profileAllowPublish` binary(1) NOT NULL,
  `profileMaturePublish` binary(1) NOT NULL,
  `profileURL` varchar(255) NOT NULL,
  `profileWantToMask` int(3) NOT NULL,
  `profileWantToText` text NOT NULL,
  `profileSkillsMask` int(3) NOT NULL,
  `profileSkillsText` text NOT NULL,
  `profileLanguages` text NOT NULL,
  `profileImage` varchar(36) NOT NULL,
  `profileAboutText` text NOT NULL,
  `profileFirstImage` varchar(36) NOT NULL,
  `profileFirstText` text NOT NULL,
  PRIMARY KEY (`useruuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `usersettings` (
  `useruuid` varchar(36) NOT NULL,
  `imviaemail` enum('true','false') NOT NULL,
  `visible` enum('true','false') NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`useruuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

-- --------------------------------------------------------

-- --------------------------------------------------------
-- Tables for Search module:
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `allparcels` (
  `regionUUID` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `ownerUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `groupUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `landingpoint` varchar(255) NOT NULL,
  `parcelUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `infoUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `parcelarea` int(11) NOT NULL,
  PRIMARY KEY  (`parcelUUID`),
  KEY `regionUUID` (`regionUUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `events` (
  `owneruuid` char(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `eventid` int(11) NOT NULL auto_increment,
  `creatoruuid` char(40) NOT NULL,
  `category` int(2) NOT NULL,
  `description` text NOT NULL,
  `dateUTC` int(10) NOT NULL,
  `duration` int(3) NOT NULL,
  `covercharge` tinyint(1) NOT NULL,
  `coveramount` int(10) NOT NULL,
  `simname` varchar(255) NOT NULL,
  `globalPos` varchar(255) NOT NULL,
  `eventflags` int(1) NOT NULL,
  PRIMARY KEY  (`eventid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `hostsregister` (
  `host` varchar(255) NOT NULL,
  `port` int(5) NOT NULL,
  `register` int(10) NOT NULL,
  `nextcheck` int(10) NOT NULL,
  `checked` tinyint(1) NOT NULL,
  `failcounter` int(10) NOT NULL,
  PRIMARY KEY (`host`,`port`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `objects` (
  `objectuuid` varchar(255) NOT NULL,
  `parceluuid` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `regionuuid` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`objectuuid`,`parceluuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `parcels` (
  `regionUUID` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `parcelUUID` varchar(255) NOT NULL,
  `landingpoint` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `searchcategory` varchar(50) NOT NULL,
  `build` enum('true','false') NOT NULL,
  `script` enum('true','false') NOT NULL,
  `public` enum('true','false') NOT NULL,
  `dwell` float NOT NULL default '0',
  `infouuid` varchar(255) NOT NULL default '',
  `mature` varchar(10) NOT NULL default 'PG',
  PRIMARY KEY  (`regionUUID`,`parcelUUID`),
  KEY `name` (`parcelname`),
  KEY `description` (`description`),
  KEY `searchcategory` (`searchcategory`),
  KEY `dwell` (`dwell`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `parcelsales` (
  `regionUUID` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `parcelUUID` varchar(255) NOT NULL,
  `area` int(6) NOT NULL,
  `saleprice` int(11) NOT NULL,
  `landingpoint` varchar(255) NOT NULL,
  `infoUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `dwell` int(11) NOT NULL,
  `parentestate` int(11) NOT NULL default '1',
  `mature` varchar(10) NOT NULL default 'PG',
  PRIMARY KEY  (`regionUUID`,`parcelUUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `popularplaces` (
  `parcelUUID` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dwell` float NOT NULL,
  `infoUUID` char(36) NOT NULL,
  `has_picture` tinyint(1) NOT NULL,
  `mature` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `regions` (
  `regionname` varchar(255) NOT NULL,
  `regionuuid` varchar(255) NOT NULL,
  `regionhandle` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `owneruuid` varchar(255) NOT NULL,
  PRIMARY KEY  (`regionuuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

-- --------------------------------------------------------

-- --------------------------------------------------------
-- Tables for Groups module:
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `osagent` (
  `AgentID` varchar(128) NOT NULL default '',
  `ActiveGroupID` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`AgentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `osgroup` (
  `GroupID` varchar(128) NOT NULL default '',
  `Name` varchar(255) NOT NULL default '',
  `Charter` text NOT NULL,
  `InsigniaID` varchar(128) NOT NULL default '',
  `FounderID` varchar(128) NOT NULL default '',
  `MembershipFee` int(11) NOT NULL default '0',
  `OpenEnrollment` varchar(255) NOT NULL default '',
  `ShowInList` tinyint(1) NOT NULL default '0',
  `AllowPublish` tinyint(1) NOT NULL default '0',
  `MaturePublish` tinyint(1) NOT NULL default '0',
  `OwnerRoleID` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`GroupID`),
  UNIQUE KEY `Name` (`Name`),
  FULLTEXT KEY `Name_2` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `osgroupinvite` (
  `InviteID` varchar(128) NOT NULL default '',
  `GroupID` varchar(128) NOT NULL default '',
  `RoleID` varchar(128) NOT NULL default '',
  `AgentID` varchar(128) NOT NULL default '',
  `TMStamp` timestamp NOT NULL,
  PRIMARY KEY  (`InviteID`),
  UNIQUE KEY `GroupID` (`GroupID`,`RoleID`,`AgentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `osgroupmembership` (
  `GroupID` varchar(128) NOT NULL default '',
  `AgentID` varchar(128) NOT NULL default '',
  `SelectedRoleID` varchar(128) NOT NULL default '',
  `Contribution` int(11) NOT NULL default '0',
  `ListInProfile` int(11) NOT NULL default '1',
  `AcceptNotices` int(11) NOT NULL default '1',
  PRIMARY KEY  (`GroupID`,`AgentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `osgroupnotice` (
  `GroupID` varchar(128) NOT NULL default '',
  `NoticeID` varchar(128) NOT NULL default '',
  `Timestamp` int(10) unsigned NOT NULL default '0',
  `FromName` varchar(255) NOT NULL default '',
  `Subject` varchar(255) NOT NULL default '',
  `Message` text NOT NULL,
  `BinaryBucket` text NOT NULL,
  PRIMARY KEY  (`GroupID`,`NoticeID`),
  KEY `Timestamp` (`Timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `osgrouprolemembership` (
  `GroupID` varchar(128) NOT NULL default '',
  `RoleID` varchar(128) NOT NULL default '',
  `AgentID` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`GroupID`,`RoleID`,`AgentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

CREATE TABLE IF NOT EXISTS `osrole` (
  `GroupID` varchar(128) NOT NULL default '',
  `RoleID` varchar(128) NOT NULL default '',
  `Name` varchar(255) NOT NULL default '',
  `Description` varchar(255) NOT NULL default '',
  `Title` varchar(255) NOT NULL default '',
  `Powers` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`GroupID`,`RoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;

-- --------------------------------------------------------

-- --------------------------------------------------------
-- Tables for Offline Messages module:
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `offline_msgs` (
  `uuid` varchar(36) NOT NULL,
  `message` text NOT NULL,
  KEY `uuid` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 collate latin1_general_ci;
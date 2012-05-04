About this distribution: 
========================

** This version of the OS Services Bundle is compatible with OpenSim 0.7.3 ONLY **

This is an ongoing attempt at creating bundled installation packages for OpenSim modules which are not part of the core distribution but provide what many consider to be essential or highly desired services.  

This bundle contains everything needed to set up and run Groups, Profiles, Search and Offline Messages services with your 
current OpenSim instance(s) including binaries, web components, database dumps and step by step instructions.  The web component has been consolidated into a single folder with 1 config file.

While in certain situations not every function will perform flawlessly, it's a reasonable starting point from which most users can establish a solid, feature-rich OpenSim server with as little stress and confusion as possible.

The active repository for this service bundle lives in GitHub: https://github.com/anticore

A standard download for all users also exists here: http://public.odosys.net/opensim/files


*********************
** IMPORTANT NOTES **
*********************

This distribution is based on pre-existing project repositories provided by the OpenSim development community. Though there are several of these projects established for various OpenSim services, the code featured here has consistently provided the best overall results for the widest possible installation base.

All of the invivdual modules which make up this bundle are available from their respective repositories and are IDENTICAL in function and implementation.  This project only serves as a simplified and unified presentation of these modules for those requiring an 'all-in-one' approach.  -NO- modifications have been made to the core code of these modules.

-PLEASE NOTE- it is not the current goal of this project to add additional features or functionality to these third party service implementations.  This may change in the future.

All credits for the existence of these add-on modules belong to their many authors and contributors, as well as the core OpenSim development team.  More information can be found in the 'LICENCE.txt' file included in the 'Documents' folder.



Compatibility and Liability:
============================

** This version of the OS Services Bundle is compatible with OpenSim 0.7.3 ONLY **

At the moment, complete feature sets of certain OpenSim features (in camparison with Second Life) may or may not be fully implemented due to platform limitations and project status of the various third party modules.  Also, there are no guarantees that everything here will work perfectly for everyone.  As always, you should test this or any third party distribution on a non-essential development installation of OpenSim prior to production use.  Remember: if anything breaks, you get to keep BOTH parts...

The components in this distribution, along with their recommended settings, have been successfully tested and maintained in the following environments:

- Ubuntu 10/11 | OpenSUSE 11 | CentOS 5 | Debian 6 + Mono 2.6.x/2.10.x, 
MySQL 5.1.x, PHP 5.3.x, Apache 2.2.x

- Windows XP SP3 (32 bit) + .NET Framework 3.5, MySQL 5.1.x,  PHP 5.3.x, Apache 2.2.x (as installed services)

- Windows 7/Server 2008 R2 (64 bit) + .NET Framework 3.5, MySQL 5.5.x, PHP
5.3.x, Apache 2.2.x (as a WAMP stack)

- Performance under Microsoft IIS has not been directly tested.  There are apparently some issues in certain setups regarding PHP and MSSQL functionality which differs from standard Apache/MySQL environments.  Users running OpenSim under IIS may have to alter some server settings in order to get full functionality from these and other third party modules.

- Mac OSX implementations seemed to run fine with limited testing, but as I do not maintain a fully functional OpenSim server using this architecture I can only rely on feedback from those who do.
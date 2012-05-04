About this file:
================

This is the sql dump file which will create the proper tables to store data for these OpenSim modules: Profiles, Search, Groups and Offline Messages.  

If your particular database environment requires you to use seperate databases for each service or you prefer to do so, please use the individual sql files located in the 'Extras > sql' folder located at the root of this distribution.


Database setup:
===============

- Create a new MySQL database named 'os_services' with a collation scheme of 'latin1_general_ci'.

- Import the file named 'services_all.sql'.

- Make sure to select 'latin1_general_ci' or 'iso-8859-1' as the character set of the source file if that option is available.


Updating existing installations:
================================

[NOTE] This is ONLY for users who are updating a previous version of the services bundle (pre v0.2).

- Import the file named 'update_services.sql' in the 'Update ONLY' folder into your existing 'os_services' database.

- This will modify the 'events' table to reflect recent changes made to the Search Module.
-- --------------------------------------------------------
-- This will update portions of your Search tables to reflect
-- changes made to the Search Module code.
--  

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

ALTER TABLE events MODIFY dateUTC int(10) NOT NULL;
ALTER TABLE events MODIFY covercharge tinyint(1) NOT NULL;
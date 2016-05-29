-- 
-- Table structure for table `Homeworld`
-- 

CREATE TABLE Homeworld (
  homeworld_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  champion_id INT(11) UNSIGNED NOT NULL,
  homeworld_name VARCHAR(20) NOT NULL,
  PRIMARY KEY  (homeworld_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;








-- 
--  Table structure for table `champion
-- 

CREATE TABLE champion (
  champion_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  homeworld_id TINYINT UNSIGNED NOT NULL,
  damage_type VARCHAR(45) NOT NULL,   -- AP, AD, MIXED

CONSTRAINT FK_homeworld_id FOREIGN KEY (homeworld_id)   
    REFERENCES Homeworld (homeworld_id) ON DELETE RESTRICT ON UPDATE CASCADE,

  PRIMARY KEY  (champion_id),
  KEY idx_champion_name (name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;





-- 
-- Table structure for table `Lane`
-- 


CREATE TABLE Lane (
  lane_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  item_name VARCHAR(25) NOT NULL,
  PRIMARY KEY  (lane_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;





CREATE TABLE Lanes (
  lane_id TINYINT UNSIGNED NOT NULL,
  champion_id INT(11) UNSIGNED NOT NULL,
  lane_name VARCHAR(20) NOT NULL,
  PRIMARY KEY  (lane_id, champion_id),

CONSTRAINT FK_Lanes_champion_id FOREIGN KEY (champion_id)   
    REFERENCES champion (champion_id) ON DELETE RESTRICT ON UPDATE CASCADE,

CONSTRAINT FK_Lanes_lane_id FOREIGN KEY (lane_id)   
    REFERENCES Lane (lane_id) ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB DEFAULT CHARSET=utf8;







-- 
-- Table structure for table `Role`
-- 

CREATE TABLE Role (
  role_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(25) NOT NULL,
  PRIMARY KEY  (role_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;






-- 
-- Table structure for table `Roles`
-- 

CREATE TABLE Roles (
  role_id TINYINT UNSIGNED NOT NULL,
  champion_id INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY  (role_id, champion_id),

CONSTRAINT FK_Roles_champion_id FOREIGN KEY (champion_id)   
    REFERENCES Champion (champion_id),

CONSTRAINT FK_Roles_role_id FOREIGN KEY (role_id) REFERENCES Role (role_id) 

)ENGINE=InnoDB DEFAULT CHARSET=utf8;











--
-- Table structure for table `Item`
--


CREATE TABLE Item (
  item_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  item_name VARCHAR(25) NOT NULL,
  PRIMARY KEY  (item_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;






--
-- Table structure for table `Items`
--

CREATE TABLE Items (
  item_id TINYINT UNSIGNED NOT NULL,
  champion_id INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY  (item_id, champion_id),

  CONSTRAINT FK_Items_item_id FOREIGN KEY (item_id) REFERENCES Item (item_id) 
    ON DELETE RESTRICT ON UPDATE CASCADE,

  CONSTRAINT FK_Items_champion_id FOREIGN KEY (champion_id) REFERENCES Champion (champion_id) 
    ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB DEFAULT CHARSET=utf8;











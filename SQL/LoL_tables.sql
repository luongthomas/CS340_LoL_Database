/******************************
** File:    LoL_tables.sql
** Name:    Kimberly McLeod, Thomas Luong
** Class:   Oregon State University, Intro to Databases CS 340
** Desc:    Table Definitions for League of Legends database of champions, 
                items, roles, lanes, and homeworlds
** Date:    05/29/2016

*******************************/


-- Sets foreign key checks off so we can add whole tables 
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';



DROP TABLE IF EXISTS Homeworld;
DROP TABLE IF EXISTS Champion;
DROP TABLE IF EXISTS Lane;
DROP TABLE IF EXISTS Lanes;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Items;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS Roles;



-- 
-- Table structure for table `Homeworld`
-- 

CREATE TABLE Homeworld (
  homeworld_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  homeworld_name VARCHAR(50) NOT NULL,
  homeworld_desc TEXT,
  PRIMARY KEY  (homeworld_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- 
--  Table structure for table `champion
-- 

CREATE TABLE Champion (
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
  lane_name VARCHAR(25) NOT NULL,
  PRIMARY KEY  (lane_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- 
-- Table structure for table `Lanes`
-- 

CREATE TABLE Lanes (
  lane_id TINYINT UNSIGNED NOT NULL,
  champion_id INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY  (lane_id, champion_id),

CONSTRAINT FK_Lanes_champion_id FOREIGN KEY (champion_id)   
    REFERENCES Champion (champion_id) ON DELETE RESTRICT ON UPDATE CASCADE,

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
    REFERENCES Champion (champion_id) ON DELETE RESTRICT ON UPDATE CASCADE,

  CONSTRAINT FK_Roles_role_id FOREIGN KEY (role_id) 
    REFERENCES Role (role_id) ON DELETE RESTRICT ON UPDATE CASCADE

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

  CONSTRAINT FK_Items_item_id FOREIGN KEY (item_id) 
    REFERENCES Item (item_id) ON DELETE RESTRICT ON UPDATE CASCADE,

  CONSTRAINT FK_Items_champion_id FOREIGN KEY (champion_id) 
    REFERENCES Champion (champion_id) ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB DEFAULT CHARSET=utf8;












/******************************
** File:    LoL_entries.sql
** Name:    Kimberly McLeod, Thomas Luong
** Class:   Oregon State University, Intro to Databases CS 340
** Desc:    Entity Insertions for League of Legends database of champions, 
                items, roles, lanes, and homeworlds
** Date:    05/29/2016

*******************************/

-- Add this before inserting entries to bypass foreign key checks

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';



-- incomplete champion-homeworld list here
-- http://forums.na.leagueoflegends.com/board/showthread.php?t=2191422

-- Split into three queries, since the texts are really long

INSERT INTO Homeworld (homeworld_id, homeworld_name, homeworld_desc)
VALUES
(1, 'Noxus', 'The Empire of Noxus (commonly referred to as Noxus) is a nation located on the eastern part of Valoran. It shares borders with Shurima.  The human nation of Noxus is in many ways the moral antithesis of Demacia; it is a country where the physically and mentally strong acquire power through any means, regardless of the consequences to their fellow citizens.'), 
(2, 'Ionia', 'Ionia is a continent spanning nation off the east coast of the Valoran, northeast of Noxus.  Ionia is a naturally beautiful island nation full of ancient trees, tall mountains and tranquil rivers. The entire landscape is covered with large patches of forests teeming with life.'), 
(3, 'Unknown/Extraplanar', 'Unknown Origin'), 
(4, 'Bandle City', 'The Yordle Land (commonly referred by its main cities name as Bandle City) is a nation located in the southeastern part of Valoran.'), 
(5, 'Demacia', 'The Kingdom of Demacia (commonly referred to as Demacia) is a nation located in the western part of Valoran. It shares its borders with Shurima.'), 
(6, 'Zaun', 'Zaun is a city-state located in the northeastern part of Valoran.  Zaun, also known as the City of Privileges, is a city-state both supported and ruined by unchecked industry, mercantilism, and magic run amok. The pollution from the countless factories and laboratories is constantly spewed into the environment. The urban heart of the city-state is often choked with smog that blocks the morning sun and drains the sky of its pastels. Visitors have called the sky the "Zaun Gray", and describe staring up at it akin to seeing the beginnings of a cosmic disturbance. As polluted as Zaun is above-ground, its subterranean levels are far worse. All of Zaun\'s runoff waste pools together in its sewers, mixing together into toxic and mysterious concoctions.'), 
(7, 'Kumungu Jungle', 'Kumungu is a jungle landscape in the southern part of Valoran.  There are few dwellers, let alone champions, residing in the blasted and dangerous lands that lie south of the Great Barrier. Much of that world still bears the scars of past Rune Wars, especially the mysterious Kumungu Jungle. There are long-forgotten treasures in these strange places which many risk life and limb to acquire.'),
(8, 'Valoran', 'Valoran is the sole supercontinent of Runeterra. All nations and factions of Runeterra are based on Valoran.  '), 
(9, 'Piltover', 'Piltover is a city-state on the northeastern part of Valoran.  Piltover, also known as the City of Progress, is the leading center of ecologically-minded techmaturgical research on Valoran. The city\'s great academies and their contributions to science are known across the land, rivaled only by the eccentric colleges found in Zaun. A coastal nation, the denizens of Piltover are utilizing the liquids and gases emitting from the nearest marsh as a viable source of energy in order to power the city.'),
(10, 'Bilgewater', 'The Bilgewater Union (commonly referred to as Bilgewater) is an island nation of the Blue Flame Islands, which are located in the southeastern coast of Valoran. Bilgewater was officially founded on September 19, 150 years ago.'),
(11, 'Urtistan', 'Urtistan was once a large city located behind the Great Barrier, south of Demacia, and west of the Shurima Desert.  There are few dwellers, let alone champions, residing in the blasted and dangerous lands that lie south of the Great Barrier. ');


INSERT INTO Homeworld (homeworld_id, homeworld_name, homeworld_desc)
VALUES
(12, 'Kalamanda/Odyn Valley', 'Kalamanda is a small village located north of Mogron Pass on Valoran. The village was first mentioned on the first issue of The Journal of Justice when a mass deposit of gold and gems and two nexuses were discovered near it. The deposit has led all city-states to set camps in Kalamanda in an attempt to obtain a trading deal, leading to high tensions between them.  Kalamanda was once a sleepy non-descript village located near the northern entrance to Mogron Pass, only moderately known as a decent place to fish for Valoran trout and not much else.  However, it became the centre of the Noxian-Demacian conflicts. Eventually, the disagreements escalated so much that a full scale war began. However, due to Zilean Zilean\'s (along with several League Summoners) magical temporal stasis, it was quickly stopped. However, the stasis caused the village to become magically unstable for decades. It was then that the village was remade into the Field of Justice, the Crystal Scar.'),
(13, 'Voodoo Lands', 'The Voodoo Lands are located just southeast of the Great Barrier.  An unforgiving barren wilderness, the Voodoo Lands were colonized by political and social outcasts from Noxus, known as the Gray Order, who sought to leave their neighbors in peace as they pursued dark arcane knowledge. The leaders of this outcast society are a married couple: Gregori Hastur, the Gray Warlock, and his wife Amoline, the Shadow Witch. Though survival was a challenge at times, the Gray Order\'s colony managed to thrive in a land where so many others would have failed.'),
(14, 'Shurima', 'The Shurima Desert (commonly known as Shurima) is an arid territory in the southern half of the continent. Many men have gone mad beneath the glare of the Shurima sun. It is also the location of the newly resurrected Shuriman Empire, a vast civilization that bloomed millennia ago. It shares borders with Demacia and Noxus.  Ancient beings called Ascendants originate from this area.  Shurima was once a powerful empire that spanned the farthest reaches of the vast southern continent. After an era of expansion and prosperity, its last emperor was betrayed by his closest friend, and the empire fell to ruin. Its gleaming capital was all but destroyed in an earth-shaking cataclysm and the empire was left in ruins, its people scattered and its mighty cities devoured by the sand. Now Shurima is a barren wasteland, an unforgiving desert where only the strongest survive and its people cling to the few remaining oases and strips of fertile land around the coast.'),
(15, 'Plague Jungles', 'The Plague Jungles is a tropical landscape in the most southern part of Valoran.  Ravaged by Rune Wars long past, the lands south of the Great Barrier are wrecked by chaotic magical storms, leaving the grasp of nature\'s rule tenuous at best. While abnormal flora or fauna are the norm rather than the exception in these ruined areas, none are more curious than the living organisms found in the Plague Jungles. There, uneven concentrations of magic and life would well up until they burst, resulting in evolution at an unprecedented rate.'),
(16, 'Lokfar', 'Lokfar is a peninsula on the coast of Freljord.  An unforgiving barren tundra, Lokfar is a place where all creatures must vie bitterly for every resource. The coastal peninsula of Lokfar is among the most brutal places in the Freljord. There, rage is the only fire to warm frozen bones, blood is the only liquid that flows freely, and there is no worse fate than to grow old, frail, and forgotten. In the lands of Lokfar there exists a long tradition of soldiers unlike most others. Berserkers, as they call themselves, are warriors who channel fury from deep within their cores, unleashing pure and savage wrath upon their enemies.'),
(17, 'The Great Barrier', 'The Great Barrier is a mountain range stretching from east to west across Valoran, dividing the continent into two large pieces. Its most famous peak is Mount Targon, home to Pantheon, Leona, and Diana, and the most well-known pass through it is Mogron Pass. It is known as the Great Barrier because it divides Valoran between north and south. North of the Great Barrier stands most of Valoran\'s city-states, while most of what lies south of the Great Barrier is wasteland and wild places with occasional ruins from Rune Wars past. There are many Minotaur tribes that live along the Great Barrier, including the one from which Alistar hails.'),
(18, 'Frejlord', 'The Freljord (pronounced "Freil-yord") is a region located in the northern part of Valoran. The Avarosan tribe have formed The Kingdom of Freljord and are the main governing body of this land. It is currently in a civil war with the Winter\'s Claw and Frostguard tribes. Ancient beings called the Iceborn originate from this area.');

INSERT INTO Homeworld (homeworld_id, homeworld_name, homeworld_desc)
VALUES
(19, 'The Shadow Isles', 'The Shadow Isles, formerly known as the Blessed Isles, is a mysterious island kingdom located southeast of Bilgewater. It is a haunted land populated by undead beings.  Little is known about the mysterious Shadow Isles. An eternally thick, unnatural fog blankets the islands from the view of outsiders. It is thought that the islands are home to countless forms of undead, though no one seems eager to perform the exploration necessary to find out the truth.  Most of the Shadow Isles\' history comes from the two mysterious altars of the Twisted Treeline, that says fragments of their history to its capturers and from the League records of the Shadow Isles\' champions.'),
(20, 'Icathia', 'Icathia is a lost city in the southern half of Valoran.  Icathia itself is considered mythical by most, though those who believe it once existed were certain that the sands had long since devoured whatever remained. The believers generally agree that the lost city was located somewhere in the southern half of Valoran, though details beyond this are almost entirely unreliable hearsay. Many explorers have struck out to discover Icathia, but the only fact their findings universally corroborate is that just about everywhere south of the Great Barrier is malevolent, ominous, and spooky.'),
(21, 'Guardian\'s Sea', 'The Guardian\'s Sea is the ocean east of the Valoran continent. Ionia and the Blue Flame Islands with Bilgewater can be found here.  This sea is a haven for Pirates who pillage unsuspecting cargo boats.  It is also possible that the Marai (Nami), ancient sea dwellers of the deep, come from here, Including the race from which Fizz comes from.'),
(22, 'Howling Marsh', 'Howling Marsh is a small region between Ironspike Mountains and source of Serpentine River. It is also near the Institute of War.  It is known that it is a place filled with undead.'),
(23, 'The Void', 'The Void is a place between dimensions and between worlds.  To some it is known as the Outside, to others it is the Unknown. To most, however, it is called the Void. It is a timeless place inhabited by various seemingly intelligent entities who, for reasons beyond human understanding, have the desire to gain entrance to and vitiate the worlds outside their realm. These creatures are called "Voidborn". According to Vel\'Koz, the Void is a very dark place, both he and Cho\'Gath said that the daylight in Runeterra is too strong for them.'),
(24, 'Ancient Runterra', 'Runeterra (also knowns as Magic Earth) is the fictional world where League of Legends takes place. It comprises the supercontinent of Valoran (the location of the world\'s nations and the residence of its influential figures) and twelve oceans with three archipelagos around it. Also couple of moons rotate around the planet.'),
(25, 'Mount Targon', 'Mount Targon is a mountain found near the center of the Valoran continent.  Like any place of myth, Mount Targon is a beacon to dreamers, madmen and questors of adventure. Those who survive the arduous journey to the foot of the titanic mountain find a sky shimmering with celestial bodies; the sun and moons, but also constellations, planets, fiery comets that streak the darkness, and auspicious arrangements of stars. The people living at the mountain’s base believe these to be aspects of long-vanished stellar beings, creatures powerful and ancient on a scale beyond human comprehension.'),
(26, 'Monolith', 'here is a world of perfect harmony, where all are part of the whole. The Monolith is the essence of all creation, and its denizens are but singular pieces of it. It is beautiful in its symmetry, and in its almost complete lack of uncertainty. The rocky beings that live there know their place and work to fulfill their duties to the fullest extent, functioning almost as a superorganism or hive. Malphite has always strived to live up to his full potential, as his own personal part of the whole, serving the role of a distinguished creature questing to enforce his people\'s flawless vision of order.');

-- I dont think howling marsh has any originating champions tho.


-- http://leagueoflegends.wikia.com/wiki/List_of_champions
-- Damage type determined by which number was higher on damage type
-- Origin is also from this source on each individual champion's Background page

-- Order of homeworld priority: birthplace, then residence
INSERT INTO Champion (champion_id, homeworld_id, name, damage_type) 
VALUES

(1, 3, 'Aatrox', 'AD'),
(2, 2, 'Ahri', 'AP'),
(3, 2, 'Akali', 'AP'),
(4, 17, 'Alistar', 'Mixed'),
(5, 14, 'Amumu', 'AP'),
(6, 18, 'Anivia', 'AP'),
(7, 13, 'Annie', 'AP'),
(8, 18, 'Ashe', 'AD'),
(9, 3, 'Aurelion Sol', 'AP'),
(10, 14, 'Azir', 'AP'),
(11, 3, 'Bard', 'AP'),
(12, 6, 'Blitzcrank', 'AP'),
(13, 3, 'Brand', 'AP'),
(14, 18, 'Braum', 'Mixed'),
(15, 9, 'Caitlyn', 'AD'),
(16, 1, 'Cassiopeia', 'AP'),
(17, 23, 'Cho\'Gath', 'AP'),
(18, 4, 'Corki', 'AD'),
(19, 1, 'Darius', 'AD'),
(20, 25, 'Diana', 'AP'),
(21, 6, 'Dr. Mundo', 'AP'),
(22, 1, 'Draven', 'AD'),
(23, 6, 'Ekko', 'AP'),
(24, 19, 'Elise', 'AP'),
(25, 19, 'Evelynn', 'AP'),
(26, 9, 'Ezreal', 'AD'),
(27, 3, 'Fiddlesticks', 'AP'),
(28, 5, 'Fiora', 'AD'),
(29, 21, 'Fizz', 'AP'),
(30, 5, 'Galio', 'AP'),
(31, 10, 'Gangplank', 'AD'),
(32, 5, 'Garen', 'AD'),
(33, 18, 'Gnar', 'AD'),
(34, 18, 'Gragas', 'AP'),
(35, 19, 'Hecarim', 'AD'),
(36, 4, 'Heimerdinger', 'AP'),
(37, 10, 'Illaoi', 'AD'),
(38, 2, 'Irelia', 'AD'),
(39, 6, 'Janna', 'AP'),
(40, 5, 'Jarvan IV', 'AD'),
(41, 3, 'Jax', 'AD'),
(42, 9, 'Jayce', 'AD'),
(43, 2, 'Jhin', 'AD'),
(44, 6, 'Jinx', 'AD'),
(45, 19, 'Kalista', 'AD'),
(46, 2, 'Karma', 'AP'),
(47, 1, 'Karthus', 'AP'),
(48, 14, 'Kassadin', 'AP'),
(49, 1, 'Katarina', 'AP'),
(50, 5, 'Kayle', 'AP'),
(51, 4, 'Kennen', 'AP'),
(52, 23, 'Kha\'Zix', 'AD'),
(53, 24, 'Kindred', 'AD'),
(54, 23, 'Kog\'Maw', 'AD'),
(55, 1, 'LeBlanc', 'AP'),
(56, 2, 'Lee Sin', 'AD'),
(57, 25, 'Leona', 'Mixed'),
(58, 18, 'Lissandra', 'AP'),
(59, 5, 'Lucian', 'AD'),
(60, 4, 'Lulu', 'AP'),
(61, 5, 'Lux', 'AP'),
(62, 26, 'Malphite', 'AP'),
(63, 14, 'Malzahar', 'AP'),
(64, 19, 'Maokai', 'AP'),
(65, 2, 'Master Yi', 'AD'),
(66, 10, 'Miss Fortune', 'AD'),
(67, 19, 'Mordekaiser', 'AP'),
(68, 1, 'Morgana', 'AP'),
(69, 21, 'Nami', 'AP'),
(70, 14, 'Nasus', 'AD'),
(71, 10, 'Nautilus', 'AP'),
(72, 7, 'Nidalee', 'AP'),
(73, 3, 'Nocturne', 'AD'),
(74, 18, 'Nunu', 'AP'),
(75, 16, 'Olaf', 'AD'),
(76, 9, 'Orianna', 'AP'),
(77, 25, 'Pantheon', 'AD'),
(78, 4, 'Poppy', 'AD'),
(79, 5, 'Quinn', 'AD'),
(80, 14, 'Rammus', 'Mixed'),
(81, 23, 'Rek\'Sai', 'AD'),
(82, 14, 'Renekton', 'AD'),
(83, 17, 'Rengar', 'AD'),
(84, 1, 'Riven', 'AD'),
(85, 4, 'Rumble', 'AP'),
(86, 3, 'Ryze', 'AP'),
(87, 18, 'Sejuani', 'AP'),
(88, 3, 'Shaco', 'AD'),
(89, 2, 'Shen', 'Mixed'),
(90, 5, 'Shyvana', 'AD'),
(91, 6, 'Singed', 'AP'),
(92, 1, 'Sion', 'AD'),
(93, 14, 'Sivir', 'AD'),
(94, 14, 'Skarner', 'AD'),
(95, 2, 'Sona', 'AP'),
(96, 2, 'Soraka', 'AP'),
(97, 1, 'Swain', 'AP'),
(98, 2, 'Syndra', 'AP'),
(99, 24, 'Tahm Kench', 'AP'),
(100, 14, 'Taliyah', 'AP'),
(101, 1, 'Talon', 'AD'),
(102, 5, 'Taric', 'Mixed'),
(103, 4, 'Teemo', 'AP'),
(104, 19, 'Thresh', 'AP'),
(105, 4, 'Tristana', 'AD'),
(106, 18, 'Trundle', 'AD'),
(107, 18, 'Tryndamere', 'AD'),
(108, 10, 'Twisted Fate', 'AP'),
(109, 6, 'Twitch', 'AD'),
(110, 18, 'Udyr', 'AD'),
(111, 1, 'Urgot', 'AD'),
(112, 2, 'Varus', 'AD'),
(113, 5, 'Vayne', 'AD'),
(114, 4, 'Veigar', 'AP'),
(115, 6, 'Vi', 'AD'),
(116, 6, 'Viktor', 'AP'),
(117, 1, 'Vladimir', 'AP'),
(118, 23, 'Vel\'Koz', 'AP'),
(119, 18, 'Volibear', 'AD'),
(120, 6, 'Warwick', 'AD'),
(121, 2, 'Wukong', 'AD'),
(122, 14, 'Xerath', 'AP'),
(123, 5, 'Xin Zhao', 'AD'),
(124, 2, 'Yasuo', 'AD'),
(125, 19, 'Yorick', 'Mixed'),
(126, 6, 'Zac', 'AP'),
(127, 2, 'Zed', 'AD'),
(128, 4, 'Ziggs', 'AP'),
(129, 11, 'Zilean', 'AP'),
(130, 7, 'Zyra', 'AP'),
(131, 10, 'Graves', 'AD');



INSERT INTO Lane (lane_id, lane_name) 
VALUES
(1, 'Top-lane'),
(2, 'Mid-lane'),
(3, 'Bottom-lane'),
(4, 'Jungle');


-- The most common lane the champion usually is in

INSERT INTO Lanes (champion_id, lane_id)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 4),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 3),
(12, 3),
(13, 2),
(14, 3),
(15, 3),
(16, 2),
(17, 1),
(18, 3),
(19, 1),
(20, 4),
(21, 1),
(22, 3),
(23, 2),
(24, 4),
(25, 4),
(26, 3),
(27, 4),
(28, 1),
(29, 2),
(30, 4),
(31, 1),
(32, 1),
(33, 1),
(34, 4),
(35, 4),
(36, 2),
(37, 1),
(38, 1),
(39, 3),
(40, 4),
(41, 1),
(42, 1),
(43, 3),
(44, 3),
(45, 3),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 1),
(51, 1),
(52, 4),
(53, 4),
(54, 3),
(55, 2),
(56, 4),
(57, 3),
(58, 2),
(59, 3),
(60, 3),
(61, 2),
(62, 1),
(63, 2),
(64, 4),
(65, 4),
(66, 3),
(67, 1),
(68, 3),
(69, 3),
(70, 1),
(71, 4),
(72, 4),
(73, 4),
(74, 4),
(75, 1),
(76, 2),
(77, 1),
(78, 1),
(79, 1),
(80, 4),
(81, 4),
(82, 1),
(83, 4),
(84, 1),
(85, 1),
(86, 2),
(87, 4),
(88, 4),
(89, 1),
(90, 4),
(91, 1),
(92, 1),
(93, 3),
(94, 4),
(95, 3),
(96, 3),
(97, 2),
(98, 2),
(99, 3),
(100, 2),
(101, 2),
(102, 3),
(103, 1),
(104, 3),
(105, 3),
(106, 1),
(107, 1),
(108, 2),
(109, 3),
(110, 4),
(111, 3),
(112, 3),
(113, 3),
(114, 2),
(115, 4),
(116, 2),
(117, 1),
(118, 2),
(119, 4),
(120, 4),
(121, 1),
(122, 2),
(123, 4),
(124, 2),
(125, 1),
(126, 4),
(127, 2),
(128, 2),
(129, 2),
(130, 3),
(131, 3);


-- http://leagueoflegends.wikia.com/wiki/Champion/Champion_Attributes

INSERT INTO Role (role_id, role_name) 
VALUES
(1, 'Bruiser/Tank'),
(2, 'AP Carry'),
(3, 'AD Carry'),
(4, 'Support'),
(5, 'Jungler'),
(6, 'Assassain');



-- The most common role the champion is in
-- http://leagueoflegends.wikia.com/wiki/List_of_champions
INSERT INTO Roles (champion_id, role_id)
VALUES

(1, 1),
(1, 2),
(2, 3),
(2, 6),
(3, 6),
(3, 2),
(4, 1),
(4, 5),
(5, 1),
(5, 3),
(6, 3),
(6, 5),
(7, 3),
(8, 4),
(8, 5),
(9, 3),
(10, 3),
(10, 4),
(11, 5),
(11, 3),
(12, 1),
(12, 2),
(13, 3),
(14, 5),
(14, 1),
(15, 4),
(16, 3),
(17, 1),
(17, 3),
(18, 4),
(19, 1),
(19, 2),
(20, 2),
(20, 3),
(21, 1),
(21, 2),
(22, 4),
(23, 2),
(23, 3),
(24, 2),
(24, 3),
(25, 6),
(25, 3),
(26, 4),
(26, 3),
(27, 3),
(27, 5),
(28, 2),
(28, 6),
(29, 2),
(29, 6),
(30, 1),
(30, 3),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 2),
(34, 3),
(35, 1),
(35, 2),
(36, 3),
(36, 5),
(37, 1),
(38, 2),
(38, 6),
(39, 5),
(39, 3),
(40, 1),
(40, 2),
(41, 1),
(41, 6),
(42, 2),
(42, 4),
(43, 4),
(43, 6),
(44, 4),
(45, 4),
(46, 3),
(46, 5),
(47, 3),
(48, 6),
(48, 3),
(49, 6),
(49, 3),
(50, 2),
(50, 5),
(51, 3),
(51, 4),
(52, 2),
(52, 6),
(53, 4),
(53, 6),
(54, 4),
(54, 3),
(55, 6),
(55, 3),
(56, 2),
(56, 6),
(57, 1),
(57, 5),
(58, 3),
(59, 4),
(60, 5),
(60, 3),
(61, 5),
(61, 3),
(62, 1),
(62, 2),
(63, 3),
(63, 6),
(64, 1),
(64, 3),
(65, 6),
(65, 2),
(66, 4),
(67, 2),
(68, 5),
(68, 3),
(69, 5),
(69, 3),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 6),
(72, 2),
(73, 6),
(73, 2),
(74, 5),
(74, 2),
(75, 1),
(75, 2),
(76, 3),
(76, 5),
(77, 6),
(77, 2),
(78, 1),
(78, 2),
(79, 4),
(79, 2),
(80, 1),
(80, 2),
(81, 2),
(82, 2),
(82, 1),
(83, 6),
(83, 2),
(84, 6),
(84, 2),
(85, 2),
(85, 3),
(86, 3),
(86, 2),
(87, 1),
(87, 2),
(88, 6),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(91, 1),
(91, 2),
(92, 1),
(92, 2),
(93, 4),
(94, 1),
(94, 2),
(95, 3),
(95, 5),
(96, 3),
(96, 5),
(97, 3),
(97, 2),
(98, 3),
(98, 5),
(99, 5),
(99, 1),
(100, 3),
(100, 5),
(101, 6),
(101, 2),
(102, 2),
(102, 5),
(103, 4),
(103, 6),
(104, 5),
(104, 2),
(105, 4),
(105, 6),
(106, 1),
(106, 2),
(107, 6),
(107, 2),
(108, 3),
(109, 4),
(109, 6),
(110, 1),
(110, 2),
(111, 4),
(111, 2),
(112, 4),
(112, 3),
(113, 4),
(113, 6),
(114, 3),
(115, 2),
(115, 6),
(116, 3),
(117, 1),
(117, 3),
(118, 3),
(119, 2),
(119, 1),
(120, 1),
(120, 2),
(121, 1),
(121, 2),
(122, 3),
(122, 6),
(123, 2),
(123, 6),
(124, 2),
(124, 6),
(125, 2),
(125, 3),
(126, 1),
(126, 2),
(127, 6),
(127, 2),
(128, 3),
(129, 5),
(129, 3),
(130, 3),
(130, 5),
(131, 4);


-- Used only items that show up in full builds

INSERT INTO Item (item_id, item_name)
VALUES
(1,  'Abyssal Scepter'),
(2,  'Athene\'s Unholy Grail'),
(3,  'Banshee\'s Veil'),
(4,  'Banner of Command'),
(5,  'Berserker\'s Greaves'),
(6,  'Boots of Mobility'),
(7,  'Boots of Swiftness'),
(8,  'Dead Man\'s Plate'),
(9,  'Death\'s Dance'),
(10, 'Duskblade of Draktharr'),
(11, 'Entropy'),
(12, 'Essence Reaver'),
(13, 'Face of the Mountain'),
(14, 'Frost Queen\'s Claim'),
(15, 'Frozen Heart'),
(16, 'Frozen Mallet'),
(17, 'Guardian Angel'),
(18, 'Guinsoo\'s Rageblade'),
(19, 'Hextech GLP-800'),
(20, 'Hextech Gunblade'),
(21, 'Hextech Protobelt-01'),
(22, 'Iceborn Gauntlet'),
(23, 'Infinity Edge'),
(24, 'Ionian Boots of Lucidity'),
(25, 'Liandry\'s Torment'),
(26, 'Lich Bane'),
(27, 'Locket of the Iron Solari'),
(28, 'Lord Dominik\'s Regards'),
(29, 'Lord Van Damm\'s Pillager'),
(30, 'Luden\'s Echo'),
(31, 'Manamune'),
(32, 'Maw of Malmortius '),
(33, 'Mercurial Scimitar'),
(34, 'Mercury\'s Treads'),
(35, 'Mikael\'s Crucible'),
(36, 'Morellonomicon'),
(37, 'Mortal Reminder'),
(38, 'Nashor\'s Tooth'),
(39, 'Ninja Tabi'),
(40, 'Phantom Dancer'),
(41, 'Prototype Hex Core'),
(42, 'Rabadon\'s Deathcap'),
(43, 'Randuin\'s Omen'),
(44, 'Rapid Firecannon'),
(45, 'Ravenous Hydra'),
(46, 'Righteous Glory'),
(47, 'Rod of Ages'),
(48, 'Ruby Sightstone'),
(49, 'Runaan\'s Hurricane'),
(50, 'Rylai\'s Crystal Scepter'),
(51, 'Skirmisher\'s Sabre'),
(52, 'Sorcerer\'s Shoes'),
(53, 'Spirit Visage'),
(54, 'Stalker\'s Blade'),
(55, 'Statikk Shiv'),
(56, 'Sterak\'s Gage'),
(57, 'Sunfire Cape'),
(58, 'The Black Cleaver'),
(59, 'The Bloodthirster'),
(60, 'The Lightbringer'),
(61, 'Thornmail'),
(62, 'Titanic Hydra'),
(63, 'Trinity Force'),
(64, 'Void Staff'),
(65, 'Warmog\'s Armor'),
(66, 'Wit\'s End'),
(67, 'Youmuu\'s Ghostblade'),
(68, 'Zeke\'s Harbinger'),
(69, 'Zhonya\'s Hourglass'),
(70, 'Zz\'Rot Portal'),
(71, 'Eye of Equinox'),
(72, 'Face of the Mountain'),
(73, 'Runic Echoes'),
(74, 'Seraph\'s Embrace'),
(75, 'Eye of the Watchers');




-- The 6 completed items of the highest win rate % for that champion
-- http://www.lolking.net/champions

INSERT INTO Items (champion_id, item_id)
VALUES
(1, 18),
(1, 32),
(1, 53),  
(1, 62),
(1, 58),
(1, 34),

(2, 36),
(2, 1),
(2, 42),
(2, 30),
(2, 52),
(2, 69),

(3, 20),
(3, 69),
(3, 64),
(3, 50),
(3, 52),
(3, 1),

(4, 13),
(4, 71),
(4, 27),
(4, 15),
(4, 7),

(5, 57),
(5, 1),
(5, 73),
(5, 7),
(5, 8),
(5, 25),

(6, 47),
(6, 74),
(6, 42),
(6, 69),
(6, 64),
(6, 52),  

(7, 30),
(7, 47),
(7, 69),
(7, 42),
(7, 36),
(7, 52),  

(8, 23),
(8, 49),
(8, 59),
(8, 28),
(8, 12),
(8, 5), 

(9, 47),
(9, 50),
(9, 25),
(9, 42),
(9, 69),
(9, 52),  

(10, 38),
(10, 50),
(10, 69),
(10, 42),
(10, 52),
(10, 64), 

(11, 14),
(11, 27),
(11, 48),
(11, 75),
(11, 15),
(11, 6),  

(12, 13),
(12, 71),
(12, 15),
(12, 7),
(12, 27),


(13, 50),
(13, 47),
(13, 25),
(13, 42),
(13, 52),
(13, 64), 

(14, 27),
(14, 71),
(14, 43),
(14, 13),
(14, 34),

(15, 23),
(15, 49),
(15, 44),
(15, 59),
(15, 28),
(15, 5),  


(16, 50),
(16, 74),
(16, 1),
(16, 36),
(16, 52),
(16, 25),

(17, 47),
(17, 25),
(17, 15),
(17, 1),
(17, 53),
(17, 34),

(18, 63),
(18, 23),
(18, 12),
(18, 59),
(18, 58),
(18, 52),

(19, 58),
(19, 53),
(19, 8),
(19, 57),
(19, 34),
(19, 16),

(20, 69),
(20, 38),
(20, 1),
(20, 42),
(20, 73),
(20, 52),

(21, 57),
(21, 53),
(21, 65),
(21, 61),
(21, 34),

(22, 23),
(22, 67),
(22, 59),
(22, 40),
(22, 33),
(22, 5),

(23, 22),
(23, 57),
(23, 53),
(23, 1),
(23, 69),
(23, 52),

(24, 50),
(24, 73),
(24, 1),
(24, 25),
(24, 57),
(24, 52),

(25, 73),
(25, 50),
(25, 26),
(25, 8),
(25, 7),

(26, 22),
(26, 31),
(26, 79),
(26, 28),
(26, 24),
(26, 63),

(27, 69),
(27, 73),
(27, 50),
(27, 1),
(27, 52),
(27, 42),

(28, 45),
(28, 58),
(28, 32),
(28, 53),
(28, 5),

(29, 26),
(29, 69),
(29, 1),
(29, 42),
(29, 36),
(29, 52),

(30, 1),
(30, 47),
(30, 53),
(30, 69),
(30, 42),
(30, 34),

(31, 63),
(31, 23),
(31, 12),
(31, 55),
(31, 5),

(32, 57),
(32, 58),
(32, 53),
(32, 8),
(32, 65),
(32, 7),

(33, 58),
(33, 43),
(33, 57),
(33, 16),
(33, 53),
(33, 34),

(34, 22),
(34, 53),
(34, 8),
(34, 73),
(34, 69),
(34, 52),

(35, 63),
(35, 84),
(35, 8),
(35, 53),
(35, 7),
(35, 43),

(36, 69),
(36, 50),
(36, 36),
(36, 42),
(36, 52),
(36, 64),

(37, 58),
(37, 56),
(37, 53),
(37, 8),
(37, 62),
(37, 34),

(38, 63),
(38, 8),
(38, 56),
(38, 53),
(38, 34),
(38, 16),

(39, 27),
(39, 14),
(39, 75),
(39, 81),
(39, 6),

(40, 58),
(40, 8),
(40, 78),
(40, 32),
(40, 45),
(40, 34),

(41, 18),
(41, 20),
(41, 63),
(41, 79),
(41, 5),
(41, 77),

(42, 31),
(42, 58),
(42, 67),
(42, 32),
(42, 24),
(42, 23),

(43, 23),
(43, 44),
(43, 12),
(43, 59),
(43, 5),
(43, 28),

(44, 23),
(44, 49),
(44, 59),
(44, 5),
(44, 28),
(44, 44),

(45, 79),
(45, 49),
(45, 59),
(45, 28),
(45, 40),
(45, 5),

(46, 14),
(46, 36),
(46, 25),
(46, 42),
(46, 52),
(46, 27),

(47, 47),
(47, 69),
(47, 50),
(47, 42),
(47, 64),
(47, 52),

(48, 47),
(48, 69),
(48, 26),
(48, 1),
(48, 52),
(48, 42),

(49, 30),
(49, 69),
(49, 1),
(49, 42),
(49, 64),
(49, 52),

(50, 38),
(50, 18),
(50, 49),
(50, 50),
(50, 5),
(50, 64),

(51, 69),
(51, 50),
(51, 21),
(51, 1),
(51, 52),
(51, 64),

(52, 78),
(52, 67),
(52, 58),
(52, 45),
(52, 72),
(52, 6),

(53, 77),
(53, 49),
(53, 79),
(53, 32),
(53, 56),
(53, 5),

(54, 49),
(54, 18),
(54, 79),
(54, 5),
(54, 23),
(54, 28),


(55, 36),
(55, 1),
(55, 42),
(55, 30),
(55, 69),
(55, 52),

(56, 78),
(56, 58),
(56, 8),
(56, 32),
(56, 39),
(56, 16),

(57, 13),
(57, 27),
(57, 71),
(57, 57),
(57, 34),
(57, 15),

(58, 47),
(58, 69),
(58, 1),
(58, 42),
(58, 52),
(58, 30),

(59, 67),
(59, 58),
(59, 12),
(59, 23),
(59, 40),
(59, 5),

(60, 14),
(60, 48),
(60, 36),
(60, 27),
(60, 30),
(60, 6),

(61, 36),
(61, 30),
(61, 42),
(61, 69),
(61, 52),
(61, 64),

(62, 57),
(62, 22),
(62, 1),
(62, 61),
(62, 15),
(62, 52),

(63, 50),
(63, 36),
(63, 47),
(63, 42),
(63, 25),
(63, 52),

(64, 53),
(64, 57),
(64, 47),
(64, 15),
(64, 22),
(64, 52),

(65, 79),
(65, 67),
(65, 55),
(65, 18),
(65, 77),
(65, 5),

(66, 23),
(66, 12),
(66, 67),
(66, 58),
(66, 59),
(66, 5),

(67, 50),
(67, 1),
(67, 20),
(67, 8),
(67, 69),
(67, 52),

(68, 69),
(68, 14),
(68, 48),
(68, 42),
(68, 27),
(68, 52),

(69, 14),
(69, 48),
(69, 27),
(69, 80),
(69, 75),
(69, 6),

(70, 53),
(70, 15),
(70, 22),
(70, 63),
(70, 8),
(70, 34),

(71, 57),
(71, 13),
(71, 27),
(71, 48),
(71, 71),
(71, 34),

(72, 47),
(72, 73),
(72, 50),
(72, 69),
(72, 64),
(72, 52),

(73, 67),
(73, 77),
(73, 79),
(73, 58),
(73, 5),
(73, 16),

(74, 76),
(74, 53),
(74, 15),
(74, 47),
(74, 52),
(74, 30),

(75, 58),
(75, 53),
(75, 8),
(75, 62),
(75, 56),
(75, 5),

(76, 2),
(76, 42),
(76, 69),
(76, 30),
(76, 36),
(76, 52),

(77, 58),
(77, 67),
(77, 32),
(77, 8),
(77, 5),

(78, 22),
(78, 57),
(78, 53),
(78, 8),
(78, 34),
(78, 56),

(79, 55),
(79, 23),
(79, 67),
(79, 12),
(79, 59),
(79, 5),

(80, 61),
(80, 8),
(80, 76),
(80, 57),
(80, 39),
(80, 15),

(81, 76),
(81, 62),
(81, 8),
(81, 78),
(81, 58),
(81, 39),

(82, 58),
(82, 45),
(82, 53),
(82, 8),
(82, 57),
(82, 39),

(83, 67),
(83, 78),
(83, 45),
(83, 40),
(83, 5),

(84, 58),
(84, 45),
(84, 67),
(84, 32),
(84, 24),

(85, 25),
(85, 50),
(85, 69),
(85, 1),
(85, 52),
(85, 42),

(86, 47),
(86, 74),
(86, 64),
(86, 1),
(86, 15),
(86, 52),

(87, 76),
(87, 8),
(87, 43),
(87, 27),
(87, 52),
(87, 57),

(88, 78),
(88, 45),
(88, 55),
(88, 23),
(88, 67),
(88, 5),

(89, 57),
(89, 53),
(89, 62),
(89, 43),
(89, 70),
(89, 34),

(90, 77),
(90, 62),
(90, 8),
(90, 79),
(90, 53),
(90, 39),

(91, 50),
(91, 47),
(91, 25),
(91, 70),
(91, 74),
(91, 34),

(92, 57),
(92, 53),
(92, 15),
(92, 22),
(92, 5),
(92, 65),

(93, 12),
(93, 40),
(93, 23),
(93, 55),
(93, 59),
(93, 5),

(94, 76),
(94, 22),
(94, 8),
(94, 78),
(94, 53),
(94, 34),

(95, 14),
(95, 75),
(95, 26),
(95, 2),
(95, 48),
(95, 24),

(96, 48),
(96, 83),
(96, 27),
(96, 82),
(96, 81),
(96, 52),

(97, 19),
(97, 47),
(97, 53),
(97, 50),
(97, 69),
(97, 52),

(98, 36),
(98, 30),
(98, 42),
(98, 69),
(98, 52),
(98, 64),

(99, 13),
(99, 8),
(99, 57),
(99, 27),
(99, 48),
(99, 7),

(100, 50),
(100, 47),
(100, 25),
(100, 30),
(100, 52),
(100, 64),


(101, 67),
(101, 10),
(101, 45),
(101, 58),
(101, 32),
(101, 6),

(102, 13),
(102, 71),
(102, 15),
(102, 48),
(102, 27),
(102, 39),

(103, 38),
(103, 25),
(103, 49),
(103, 42),
(103, 30),
(103, 5),

(104, 13),
(104, 27),
(104, 48),
(104, 71),
(104, 15),
(104, 6),

(105, 23),
(105, 44),
(105, 59),
(105, 49),
(105, 55),
(105, 5),

(106, 53),
(106, 8),
(106, 22),
(106, 62),
(106, 5),
(106, 63),

(107, 55),
(107, 23),
(107, 79),
(107, 40),
(107, 67),
(107, 5),

(108, 26),
(108, 69),
(108, 30),
(108, 1),
(108, 42),
(108, 52),

(109, 49),
(109, 67),
(109, 23),
(109, 79),
(109, 5),
(109, 28),

(110, 77),
(110, 63),
(110, 8),
(110, 53),
(110, 34),
(110, 16),

(111, 58),
(111, 31),
(111, 15),
(111, 67),
(111, 5),
(111, 22),

(112, 12),
(112, 23),
(112, 55),
(112, 67),
(112, 59),
(112, 5),

(113, 79),
(113, 40),
(113, 23),
(113, 55),
(113, 18),
(113, 5),

(114, 36),
(114, 42),
(114, 69),
(114, 30),
(114, 64),
(114, 52),

(115, 78),
(115, 58),
(115, 8),
(115, 56),
(115, 63),
(115, 34),

(116, 41),
(116, 50),
(116, 1),
(116, 26),
(116, 42),
(116, 52),

(117, 50),
(117, 53),
(117, 69),
(117, 1),
(117, 21),
(117, 52),

(118, 36),
(118, 30),
(118, 50),
(118, 42),
(118, 52),
(118, 64),

(119, 76),
(119, 8),
(119, 53),
(119, 57),
(119, 61),
(119, 39),

(120, 77),
(120, 79),
(120, 53),
(120, 66),
(120, 15),
(120, 5),

(121, 58),
(121, 67),
(121, 78),
(121, 45),
(121, 8),
(121, 34),

(122, 36),
(122, 30),
(122, 42),
(122, 64),
(122, 52),
(122, 69),

(123, 77),
(123, 18),
(123, 79),
(123, 53),
(123, 8),
(123, 5),

(124, 40),
(124, 23),
(124, 55),
(124, 63),
(124, 59),
(124, 5),

(125, 31),
(125, 58),
(125, 53),
(125, 8),
(125, 34),
(125, 16),

(126, 53),
(126, 76),
(126, 57),
(126, 43),
(126, 52),
(126, 65),

(127, 67),
(127, 10),
(127, 32),
(127, 24),

(128, 36),
(128, 30),
(128, 42),
(128, 69),
(128, 64),
(128, 52),

(129, 47),
(129, 14),
(129, 36),
(129, 42),
(129, 52),
(129, 69),

(130, 50),
(130, 25),
(130, 14),
(130, 48),
(130, 75),
(130, 52),

(131, 40),
(131, 9),
(131, 32),
(131, 56),
(131, 5),
(131, 55);

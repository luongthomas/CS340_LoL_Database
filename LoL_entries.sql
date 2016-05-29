
--incomplete champion-homeworld list here
--http://forums.na.leagueoflegends.com/board/showthread.php?t=2191422

--TODO: Add descriptions

INSERT INTO Homeworld (homeworld_name, homeworld_desc)
VALUES
('Noxus', '_description_'), 
('Ionia', '_description_'), 
('Unknown/Extraplanar', '_description_'), 
('Bandle City', '_description_'), 
('Demacia', '_description_'), 
('Zaun', '_description_'), 
('Valoran', '_description_'), 
('The Void', '_description_'), 
('Piltover', '_description_'),
('The Void', '_description_'),
('The Institute of War', '_description_'),
('Bilgewater', '_description_'),
('The Howling Marsh', '_description_'),
('The Ironspike Mountains', '_description_'),
('The Twisted Treeline', '_description_'),
('Urtistan', '_description_'),
('Kalamanda/Odyn Valley', '_description_'),
('Voodoo Lands', '_description_'),
('Shurima Desert', '_description_'),
('Plague Jungles', '_description_'),
('Lokfar', '_description_'),
('The Great Barrier', '_description_'),
('Frejlord', '_description_'),
('The Shadow Isles', '_description_'),
('Kalamanda/Odyn Valley', '_description_');



INSERT INTO Champion (name, damage_type) 
VALUES
('Annie', 'AP'),
('Annie', 'AP'),
('Annie', 'AP'),
('Annie', 'AP'),
('Annie', 'AP'),
('Annie', 'AP');




INSERT INTO Lane (lane_id, lane_name) 
VALUES
(1, 'Top-lane'),
(2, 'Mid-lane'),
(3, 'Bottom-lane'),
(4, 'Jungle');




INSERT INTO Lanes (lane_id, champion_id)
VALUES
(2, 1),
(2, 1);




INSERT INTO Role (role_id, lane_name) 
VALUES
('Bruiser/Tank')
('AP Carry'),
('AD Carry'),
('Support'),
('Jungler');



INSERT INTO Roles (role_id, champion_id)
VALUES
(2, 1),
(2, 1);



INSERT INTO Item (item_id, item_name)
VALUES
(1, 'Frozen Heart'),
(2, 'Frozen Heart'),
(3, 'Frozen Heart'),
(4, 'Frozen Heart');



INSERT INTO Items (item_id, champion_id)
VALUES
(1, 1),
(2, 1);








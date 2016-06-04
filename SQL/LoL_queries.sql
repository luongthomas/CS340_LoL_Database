

-- Searches for Champions and their respective lane names

SELECT Champion.name, Lane.lane_name FROM Champion 
INNER JOIN Lanes ON
Champion.champion_id=Lanes.champion_id 
INNER JOIN Lane ON
Lanes.lane_id=Lane.lane_id,
ORDER BY Champion.name;



-- Searches for Champions and their respective Item names

SELECT Champion.name, Item.item_name FROM Champion
INNER JOIN Items ON
Champion.champion_id=Items.champion_id
INNER JOIN Item ON
Items.item_id=Item.item_id
ORDER BY Champion.name;




-- Searches for Champions and their respective Homeworld names

SELECT Champion.name, Homeworld.homeworld_name, Homeworld.homeworld_desc FROM Champion
INNER JOIN Homeworld ON
Champion.homeworld_id=Homeworld.homeworld_id
ORDER BY Champion.name;




-- Searches for Champions and their respective Role names

SELECT Champion.name, Role.role_name FROM Champion 
INNER JOIN Roles ON
Champion.champion_id=Roles.champion_id
INNER JOIN Role ON
Roles.role_id=Role.role_id;




-- Adds new Champion to the Champion table
INSERT INTO Champion (homeworld_id, name, damage_type) 
VALUES ((SELECT homeworld_id FROM Homeworld WHERE Homeworld.homeworld_name LIKE [homeworld]), [name], [damage_type]);




-- Adds new Role to existing Champion, updates Roles table
INSERT INTO Roles (champion_id, role_id) 
VALUES ((SELECT champion_id FROM Champion WHERE name LIKE [champion]), 
(SELECT role_id FROM Role WHERE role_name LIKE [role]));
	
	
	
	
-- Adds new Item to existing Champion, updates Items table	
INSERT INTO Items (item_id, champion_id) 
VALUES ((SELECT item_id FROM Item WHERE item_name LIKE [item]), 
(SELECT champion_id FROM Champion WHERE name LIKE [champion]));	




-- Adds new Lane to existing Champion, updates Lanes table
INSERT INTO Lanes (lane_id, champion_id) 
VALUES ((SELECT lane_id FROM Lane WHERE lane_name LIKE [lane]), 
(SELECT champion_id FROM Champion WHERE name LIKE [champion]));
      


-- Adds new Role to Role table
INSERT INTO Role (role_name) VALUES ([role]);



-- Adds new Item to Item table
INSERT INTO Item (item_name) VALUES ([name]);



-- Adds new Lane to Lane table
INSERT INTO Lane (lane_name) VALUES ([name]);



-- Adds new Homeworld to Homeworld table
INSERT INTO Homeworld (homeworld_name, homeworld_desc) 
VALUES ([name], [description]);



-- Searches database and returns Champion's name, roles, homeworld, items, and damage type
SELECT DISTINCT name, damage_type, role_name, homeworld_name, lane_name, item_name 
FROM Champion 
INNER JOIN Roles ON Champion.champion_id = Roles.champion_id 
INNER JOIN Role ON Roles.role_id = Role.role_id 
INNER JOIN Homeworld ON Champion.homeworld_id = Homeworld.homeworld_id 
INNER JOIN Lanes ON Champion.champion_id = Lanes.champion_id 
INNER JOIN Lane ON Lanes.lane_id = Lane.lane_id 
INNER JOIN Items ON Champion.champion_id = Items.champion_id 
INNER JOIN Item ON Items.item_id = Item.item_id 
WHERE Champion.name LIKE [name];



-- Updates Champion's name in Champion table
UPDATE Champion 
SET name = [new_name]
WHERE champion_id = [champion_id]

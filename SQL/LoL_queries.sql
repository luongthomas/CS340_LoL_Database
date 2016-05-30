

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
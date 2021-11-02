------------------------Models--------------------
--InstanceDifficulty:Normal = 1
--InstanceDifficulty:Heroic = 2

--GroupType:Dungeon = 1
--GroupType:Raid = 2

-----------------------Entities---------------------:
--Instance
--	-name:String
--	-level_range:Array
--  -meta_data:Array
--	-image:String
--	-max_players:int
-------------LFM_Post
--	-message:String
--	-Player:Player
--	-difficulty:int:InstanceDifficulty
--  -type:int:GroupType
--  -instance:Instance
--	-level_range:Array
--	-time_last_posted:DateTime

--------------Player
--	-name:String
--	-level:int
--	-LFM_Post:LFM_Post[]

--LFM:Init
--LFM:Listen
--LFM:DungeonPosts:DungeonPost[]
--LFM:AddPost(Player, Dungeon)
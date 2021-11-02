local _, LFM_GroupFinder = ...

local GroupType = LFM_GroupFinder:GetModel('GroupType');
local Difficulty = LFM_GroupFinder:GetModel('InstanceDifficulty');
local Instance = LFM_GroupFinder:GetEntity('Instance');

---
---Decided to put these in an indexed array... bite me
---
LFM_GroupFinder.Data.Instances = {
    [1] = Instance:New({ -- keep slave pens at the top for testing.
        id = 'SlavePens',
        name = 'Slave Pens', --1
        key_words = {'sp', 'slave pens', 'pens'};
        exclude_words = {'boost'},
        level_range = { {62, 64}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [2] = Instance:New({
        id = 'Deadmines',
        name = 'Dead Mines', --1
        key_words = {'vc', 'deadmines', 'dead mines'};
        exclude_words = {'boost'},
        level_range = { {10, 23}, {10, 23} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [3] = Instance:New({
        id = 'RageFireChasm',
        name = 'Rage Fire Chasm', --1
        key_words = {'rfc', 'rage dire chasm'};
        exclude_words = {'boost'},
        level_range = { {10, 23}, {10, 23} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [4] = Instance:New({
        id = 'UberBog',
        name = 'Uber Bog', --1
        key_words = {'ub', 'uberbog', 'uber bog'};
        exclude_words = {'boost'},
        level_range = { {62, 64}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [5] = Instance:New({
        id = 'HellfireRamparts',
        name = 'Hellfire Ramparts', --1
        key_words = {'ramps', 'hellfireramparts', 'hellfire ramparts'};
        exclude_words = {'boost'},
        level_range = { {62, 64}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [6]= Instance:New({
        id = 'SethekkHalls',
        name = 'Sethekk Halls', --1
        key_words = {'sethekkhalls', 'sethekk halls', 'seth Halls', 'sethekk', 'seth', 'sathekk', 'sathekk halls'};
        exclude_words = {'boost'},
        level_range = { {66, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [7] = Instance:New({
        id = 'TheBloodFurnace',
        name = 'The Blood Furnace', --1
        key_words = {'bf', 'blood furnace'};
        exclude_words = {'boost'},
        level_range = { {60, 68}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [8] = Instance:New({
        id = 'TheShatteredHalls',
        name = 'The Shattered Halls', --1
        key_words = {'shattered halls', 'shattered hall', 'sh', 'shh', 'shalls', 'shat halls'};
        exclude_words = {'boost'},
        level_range = { {69, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [9] = Instance:New({
        id = 'ManaTombs',
        name = 'Mana Tombs', --1
        key_words = {'mt', 'mana tombs'};
        exclude_words = {'boost'},
        level_range = { {63, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [10] = Instance:New({
        id = 'AuchenaiCrypts',
        name = 'Auchenai Crypts', --1
        key_words = {'ac', 'auchenai crypts', 'crypts'};
        exclude_words = {'boost'},
        level_range = { {64, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [11] = Instance:New({
        id = 'ShadowLabs',
        name = 'Shadow Labyrinth', --1
        key_words = {'sl', 'slabs', 'shadow labs', 'labs', 'shadow labyrinth', 'slab'};
        exclude_words = {'boost'},
        level_range = { {69, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [12] = Instance:New({
        id = 'SteamVault',
        name = 'The Steamvault', --1
        key_words = {'sv', 'steam vault'};
        exclude_words = {'boost'},
        level_range = { {69, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [13] = Instance:New({
        id = 'OldHillsBrad',
        name = 'Old Hillsbrad Foothills', --1
        key_words = {'oh','ohb', 'old hillsbrad'};
        exclude_words = {'boost'},
        level_range = { {66, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [14] = Instance:New({
        id = 'BlackMorass',
        name = 'The Black Morass', --1
        key_words = {'bm', 'black morass'};
        exclude_words = {'boost'},
        level_range = { {68, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [15] = Instance:New({
        id = 'Arcatraz',
        name = 'The Arcatraz', --1
        key_words = {'arc', 'the arcatraz', 'arcatraz'};
        exclude_words = {'boost'},
        level_range = { {69, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [16] = Instance:New({
        id = 'Botanica',
        name = 'The Botanica', --1
        key_words = {'bot', 'the botanica', 'botanica'};
        exclude_words = {'boost'},
        level_range = { {69, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [17] = Instance:New({
        id = 'Mechanar',
        name = 'The Mechanar', --1
        key_words = {'mech', 'the mechanar', 'mechanar'};
        exclude_words = {'boost'},
        level_range = { {69, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [18] = Instance:New({
        id = 'Karazhan',
        name = 'Karazhan', --1
        key_words = {'kara', 'kazazhan', 'karas', 'karazan', 'kazazhan'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 10;
    }),
    [19] = Instance:New({
        id = 'ZulFarrak',
        name = 'Zul\'Farrak', --1
        key_words = {'ZF', 'Zul Farrak', 'Zul\'Furrak', 'zfgy'};
        exclude_words = {},
        level_range = { {42, 46}, {42, 46} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    [20] = Instance:New({
        id = 'ZulGurub',
        name = 'Zul Gurub', --1
        key_words = {'ZG'};
        exclude_words = {},
        level_range = { {60, 60}, {60, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 20;
    }),
    [21] = Instance:New({
        id = 'Stratholme',
        name = 'Stratholme', --1
        key_words = {'strath', 'strath ud', 'strat', 'stratholme'};
        exclude_words = {},
        level_range = { {60, 60}, {60, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    --LookingForGroup = Instance:New('LookingForGroup', {
    --    name = 'LFG', --1
    --    key_words = {};
    --    exclude_words = {},
    --    level_range = { {1, 70}, {1, 70} };
    --    avail_difficulty_types = {
    --        [Difficulty.Normal] = Difficulty.Normal,
    --    };
    --    current_difficulty = Difficulty.Normal;
    --    type =  GroupType.Dungeon;
    --    max_players = 0;
    --}),
}


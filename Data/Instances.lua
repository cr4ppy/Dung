local _, Dung = ...


local GroupType = Dung:GetModel('GroupType');
local Difficulty = Dung:GetModel('InstanceDifficulty');
local GameVersion = Dung:GetModel('GameVersion');
local Instance = Dung:GetEntity('Instance');

---
---Decided to put these in an array (for performance)... bite me
---
Dung.Data.Instances = {
    -----------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------
    --- CLASSIC ERA DUNGEONS ----------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------
    Instance:New({
        id = 'RageFireChasm',
        name = 'Rage Fire Chasm', --1
        key_words = {'rfc', 'rage fire chasm', 'rage fire', 'rage chasm', 'ragefire'};
        exclude_words = {'boost'},
        level_range = { {13, 16}, {13, 16} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'WailingCaverns',
        name = 'Wailing Caverns', --1
        key_words = {'wc', 'wailing caverns', 'waling caverns', 'wailing'};
        exclude_words = {'boost'},
        level_range = { {17, 21}, {17, 21} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'Deadmines',
        name = 'Dead Mines', --1
        key_words = {'vc', 'deadmines', 'dead mines', 'dead mine'};
        exclude_words = {'boost'},
        level_range = { {18, 22}, {18, 22} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'ShadowfangKeep',
        name = 'Shadowfang Keep', --1
        key_words = {'sfk', 'shadowfang keep', 'fang keep', 'shadow keep', 'shadowkeep', 'fangkeep'};
        exclude_words = {'boost'},
        level_range = { {18, 21}, {18, 21} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'BlackfathomDeeps',
        name = 'Blackfathom Deeps', --1
        key_words = {'bfd', 'blackfathom deeps', 'blackfathom', 'fathom', 'fathom deeps'};
        exclude_words = {'boost'},
        level_range = { {18, 21}, {18, 21} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'TheStockade',
        name = 'The Stockade', --1
        key_words = {'stocks', 'stocakdes', 'the stockade', 'stockade', 'stonks', 'stockades', 'the stockades'};
        exclude_words = {'boost'},
        level_range = { {23, 29}, {23, 29} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'Gnomeregan',
        name = 'Gnomeregan', --1
        key_words = {'gnomer', 'gno', 'gnomeregan', 'gnomeragan', 'gnomregan', 'gnomragan', 'gnom', 'gnomergan', 'gnoma'};
        exclude_words = {'boost'},
        level_range = { {25, 28}, {25, 28} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'RazorfenKraul',
        name = 'Razorfen Kraul', --1
        key_words = {'rfk', 'razorfen kraul', 'kraul', 'razorfen k', 'razorfenkraul'};
        exclude_words = {'boost'},
        level_range = { {24, 27}, {24, 27} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'ScarletMonastery',
        name = 'Scarlet Monastery', --1
        key_words = {'sm', 'sm any', 'sm all', 'sml', 'scarlet monastery','sm gy', 'smgy', 'scarlet monastery graveyard', 'scarlet monastery gy', 'sm lib', 'sm library', 'smlib', 'sml', 'scarlet monastery library', 'scarlet monastery lib', 'scarlet','scarlett', 'sm arms', 'lib cath', 'arms cath'};
        exclude_words = {'boost'},
        level_range = { {30, 40}, {30, 40} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    --Instance:New({
    --    id = 'ScarletMonasteryGY',
    --    name = 'Scarlet Monastery - Graveyard', --1
    --    key_words = {'sm gy', 'smg', 'gy', 'smgy', 'scarlet monastery graveyard', 'graveyard', 'scarlet monastery gy'};
    --    exclude_words = {'boost'},
    --    level_range = { {30, 32}, {30, 32} };
    --    avail_difficulty_types = {
    --        [Difficulty.Normal] = Difficulty.Normal,
    --    };
    --    current_difficulty = Difficulty.Normal;
    --    type =  GroupType.Dungeon;
    --    max_players = 5;
    --}),
    --Instance:New({
    --    id = 'ScarletMonasteryLIB',
    --    name = 'Scarlet Monastery - Library', --1
    --    key_words = {'sm lib', 'sm library', 'smlib', 'sml', 'scarlet monastery library', 'scarlet monastery lib'};
    --    exclude_words = {'boost'},
    --    level_range = { {30, 32}, {30, 32} };
    --    avail_difficulty_types = {
    --        [Difficulty.Normal] = Difficulty.Normal,
    --    };
    --    current_difficulty = Difficulty.Normal;
    --    type =  GroupType.Dungeon;
    --    max_players = 5;
    --}),
    --Instance:New({
    --    id = 'ScarletMonasteryARMS',
    --    name = 'Scarlet Monastery - Armory', --1
    --    key_words = {'sm arm', 'sm arms', 'sma', 'scarlet monastery arms', 'scarlet monastery armory', 'armory'};
    --    exclude_words = {'boost'},
    --    level_range = { {35, 37}, {35, 37} };
    --    avail_difficulty_types = {
    --        [Difficulty.Normal] = Difficulty.Normal,
    --    };
    --    current_difficulty = Difficulty.Normal;
    --    type =  GroupType.Dungeon;
    --    max_players = 5;
    --}),
    --Instance:New({
    --    id = 'ScarletMonasteryCATH',
    --    name = 'Scarlet Monastery - Cathedral', --1
    --    key_words = {'sm cath', 'smc', 'scarlet monastery cath', 'scarlet monastery cathedral', 'cath'};
    --    exclude_words = {'boost'},
    --    level_range = { {36, 40}, {36, 40} };
    --    avail_difficulty_types = {
    --        [Difficulty.Normal] = Difficulty.Normal,
    --    };
    --    current_difficulty = Difficulty.Normal;
    --    type =  GroupType.Dungeon;
    --    max_players = 5;
    --}),
    Instance:New({
        id = 'RazorfenDowns',
        name = 'Razorfen Downs', --1
        key_words = {'rfd', 'razorfen down', 'razorfen downs', 'razorfen d', 'razorfendown', 'razorfendowns'};
        exclude_words = {'boost'},
        level_range = { {34, 37}, {34, 37} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'Uldaman',
        name = 'Uldaman', --1
        key_words = {'ulda', 'uldaman', 'uld'};
        exclude_words = {'boost'},
        level_range = { {36, 40}, {36, 40} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'ZulFarrak',
        name = 'Zul\'Farrak', --1
        key_words = {'zf', 'zul farrak', 'zul\'furrak', 'zfgy'};
        exclude_words = {},
        level_range = { {42, 46}, {42, 46} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'Maraudon',
        name = 'Maraudon', --1
        key_words = {'mara', 'maraudon', 'mar', 'mara ', 'maraudon', 'mauradon', 'mauro', 'maurodon', 'princessrun', 'maraudin', 'maura', 'marau', 'mauraudon'};
        exclude_words = {},
        level_range = { {43, 48}, {43, 48} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'SunkenTemple',
        name = 'The Temple of Atal\'Hakkar', --1
        key_words = {'sunken temple', 'atal\'hakkar', 'temple of atal', 'sunken', 'lfm st ', 'lfg st', ' st lfm '}; --"st" removed because people use it for server time raids
        exclude_words = {},
        level_range = { {47, 50}, {47, 50} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'BlackRockDepths',
        name = 'Black Rock Depths', --1
        key_words = {'brd', 'maraudon', 'arena run', 'angerun', 'anger run', 'emp run', 'emp', 'angerforge', 'blackrockdepth', 'blackrockdepths'};
        exclude_words = {},
        level_range = { {48, 56}, {48, 56} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'LowerBlackRock',
        name = 'Lower Blackrock Spire', --1
        key_words = {'lower', 'lbrs', 'lowers', 'lower blackrock spire'};
        exclude_words = {},
        level_range = { {54, 60}, {54, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'LowerBlackRock',
        name = 'Upper Blackrock Spire', --1
        key_words = {'ubrs', 'upper blackrock spire', 'uppers'};
        exclude_words = {},
        level_range = { {58, 60}, {58, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 10;
    }),
    Instance:New({
        id = 'DireMaulE',
        name = 'Dire Maul East', --1
        key_words = {'dme', 'dire maul east', 'dmeast', 'deast'};
        exclude_words = {},
        level_range = { {55, 60}, {55, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'DireMaulW',
        name = 'Dire Maul West', --1
        key_words = {'dmw', 'dire maul west', 'dmwest', 'dwest', 'jumprun', 'jump run'};
        exclude_words = {},
        level_range = { {58, 60}, {58, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'DireMaulN',
        name = 'Dire Maul North', --1
        key_words = {'dmn', 'dire maul north', 'dmnorth', 'dnorth', 'trib', 'trib run', 'tribute', 'tribute run', 'dmt', 'dm buffs'};
        exclude_words = {},
        level_range = { {58, 60}, {58, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'DireMaulN',
        name = 'Dire Maul North', --1
        key_words = {'dmn', 'dire maul north', 'dmnorth', 'dnorth', 'trib', 'trib run', 'tribute', 'tribute run', 'dmt', 'dm buffs'};
        exclude_words = {},
        level_range = { {58, 60}, {58, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'Stratholme',
        name = 'Stratholme', --1
        key_words = {'strat ud', 'strath', 'strath ud', 'stratud', 'stratholme', 'ud', 'ud baron', 'stath', 'stratholm', 'strah', 'strat', 'starth', 'strat live', 'strathlive'};
        exclude_words = {},
        level_range = { {58, 60}, {58, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'Scholomance',
        name = 'Scholomance', --1
        key_words = {'scholomance', 'scholo', 'sholo', 'sholomance', 'pally mount', 'pally mount quest', 'scolo'};
        exclude_words = {},
        level_range = { {58, 60}, {58, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),

    -----------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------
    --- CLASSIC ERA RAIDS (except ubrs... cos let's be honest, it's a dungeon)---------------------
    -----------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------
    Instance:New({
        id = 'ZulGurub',
        name = 'Zul Gurub', --1
        key_words = {'zg', '20 mans', '20 man', 'hakkar', 'zg mountrun'};
        exclude_words = {},
        level_range = { {60, 60}, {60, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 20;
    }),
    Instance:New({
        id = 'AQRuins',
        name = 'Ruins of Ahn\' Qiraj', --1
        key_words = {'aq20', 'aq ruins', '20 mans', '20 man', 'ossirian'};
        exclude_words = {},
        level_range = { {60, 60}, {60, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 20;
    }),
    Instance:New({
        id = 'MoltenCore',
        name = 'Molten Core', --1
        key_words = {'mc', 'molten core', 'rag', 'ragnaros', 'need douse', 'loot the dog'};
        exclude_words = {},
        level_range = { {60, 60}, {60, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 40;
    }),
    Instance:New({
        id = 'OnyxiasLair',
        name = 'Onyxia\'s Lair', --1
        key_words = {'ony', 'onyxia', 'onyxia\'s lair'};
        exclude_words = {},
        level_range = { {60, 60}, {60, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 40;
    }),
    Instance:New({
        id = 'BlackWingLair',
        name = 'Black Wing Lair', --1
        key_words = {'bwl', 'black wing lair'};
        exclude_words = {},
        level_range = { {60, 60}, {60, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 40;
    }),
    Instance:New({
        id = 'AQ',
        name = 'Ahn\' Qiraj', --1
        key_words = {'aq40', 'twin emps', 'c\'thun', 'cthun', 'ouro'};
        exclude_words = {},
        level_range = { {60, 60}, {60, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 40;
    }),
    Instance:New({
        id = 'Naxx',
        name = 'Naxxramas', --1
        key_words = {'naxxramas', 'nax', 'naxx'};
        exclude_words = {},
        level_range = { {60, 60}, {60, 60} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 40;
    }),
    ---------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    --- BURNING CRUSADE DUNGEONS ----------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------

    Instance:New({
        id = 'HellfireRamparts',
        name = 'Hellfire Ramparts', --1
        key_words = {'ramps', 'hellfireramparts', 'hellfire ramparts', 'ramp', 'ramparts', 'rampart'};
        exclude_words = {'boost'},
        level_range = { {59, 67}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'TheBloodFurnace',
        name = 'The Blood Furnace', --1
        key_words = {'bf', 'blood furnace', 'b furnace', 'bloodfurnace'};
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
    Instance:New({
        id = 'TheShatteredHalls',
        name = 'The Shattered Halls', --1
        key_words = {'shattered halls', 'shattered hall', 'sh', 'shh', 'shalls', 'shat halls', 'shat hall', 'shatterend hall'};
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
    Instance:New({
        id = 'ManaTombs',
        name = 'Mana Tombs', --1
        key_words = {'mt', 'mana tombs', 'mtombs', 'auch tombs', 'mana t'};
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
    Instance:New({
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
    Instance:New({
        id = 'SethekkHalls',
        name = 'Sethekk Halls', --1
        key_words = {'sethekkhalls', 'sethekk halls','sethek halls', 'seth halls', 'sethekk', 'seth', 'sathekk', 'sathekk halls', 'sethekk', 'sethek', 'shettek', 'shettek halls'};
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
    Instance:New({
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
    Instance:New({
        id = 'SlavePens',
        name = 'Slave Pens', --1
        key_words = {'sp', 'slave pens', 'pens', 'slavepens', 'slave pen', 'slavepen', ' hsp '};
        exclude_words = {'boost'},
        level_range = { {61, 69}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'UberBog',
        name = 'Uber Bog', --1
        key_words = {'ub', 'uberbog', 'uber bog'};
        exclude_words = {'boost'},
        level_range = { {62, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
            [Difficulty.Heroic] = Difficulty.Heroic
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Dungeon;
        max_players = 5;
    }),
    Instance:New({
        id = 'SteamVault',
        name = 'The Steamvault', --1
        key_words = {'sv', 'steam vault', 'steamvault', 'steamvaults', 'the steam vault', 'steam vault', 'steam'};
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
    Instance:New({
        id = 'OldHillsBrad',
        name = 'Old Hillsbrad Foothills', --1
        key_words = {'oh','ohb', 'old hillsbrad', 'hillsbrad'};
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
    Instance:New({
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
    Instance:New({
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
    Instance:New({
        id = 'Botanica',
        name = 'The Botanica', --1
        key_words = {'bot', 'the botanica', 'botanica', 'bota'};
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
    Instance:New({
        id = 'Mechanar',
        name = 'The Mechanar', --1
        key_words = {'mech', 'the mechanar', 'mechanar', 'mechenar'};
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
    Instance:New({
        id = 'MagistersTerrace',
        name = 'Magisters\' Terrace', --1
        key_words = {'magisters', 'magister', 'magst', 'mags terrace', 'mgt'};
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

    ---------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    --- BURNING CRUSADE RAIDS -------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    Instance:New({
        id = 'Karazhan',
        name = 'Karazhan', --1
        key_words = {'kara', 'karazhan', 'karas', 'karazan', 'kazazhan'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 10;
    }),
    Instance:New({
        id = 'ZulAman',
        name = 'Zul\'Aman', --1
        key_words = {'za', 'timerun', 'timedrun', 'zul aman', 'za timed', 'za time', 'zulaman'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 10;
    }),
    Instance:New({
        id = 'Magtheridon',
        name = 'Magtheridon\'s Lair', --1
        key_words = {'mags', 'magtheridon', 'magtheridons', 'magtheridon lair', 'magz'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 25;
    }),
    Instance:New({
        id = 'Gruul',
        name = 'Gruul\'s Lair', --1
        key_words = {'gruul', 'grools', 'grool', 'gruul\'s lair', 'magz', 'grull'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 25;
    }),
    Instance:New({
        id = 'SerpentshrineCavern',
        name = 'Serpentshrine Cavern', --1
        key_words = {'ssc', 'serpentshrine', 'serpentshrinecavern', 'serpentshrine cavern'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 25;
    }),
    Instance:New({
        id = 'TempestKeep',
        name = 'Tempest Keep', --1
        key_words = {'tk', 'tempest', 'tempest keep', 'tkeep'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 25;
    }),
    Instance:New({
        id = 'HyjalSummit',
        name = 'Hyjal Summit', --1
        key_words = {'hyjal', 'hs', 'hyjal summit'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 25;
    }),
    Instance:New({
        id = 'BlackTemple',
        name = 'Black Temple', --1
        key_words = {'bt', 'black temple'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 25;
    }),
    Instance:New({
        id = 'Sunwell',
        name = 'Sunwell Plateau', --1
        key_words = {'sunwell', 'plateau', 'sunwell plateau', 'swp', 'sw'};
        exclude_words = {'boost'},
        level_range = { {70, 70}, {70, 70} };
        avail_difficulty_types = {
            [Difficulty.Normal] = Difficulty.Normal,
        };
        current_difficulty = Difficulty.Normal;
        type =  GroupType.Raid;
        max_players = 25;
    }),
}

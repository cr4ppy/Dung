local _, Dung = ...

local isNotTable = Dung.AssertTable;
local isNotNumber = Dung.AssertNumber;
local isNotString = Dung.AssertString;
local Difficulty = Dung:GetModel('InstanceDifficulty');
local GroupType = Dung:GetModel('GroupType');

local Instance = {
    ---@type string
    id = '',

    ---@type string
    name = '';

    ---@type table
    key_words = {};

    ---@type table
    exclude_words = {},

    ---@type table
    level_range = {{1,70}, {1,70}};

    ---@type table
    avail_difficulty_types = { Difficulty.Normal };

    ---@type number
    current_difficulty = Difficulty.Normal;

    ---@type number
    type = GroupType.Dungeon;

    ---@type number
    max_players = 5;

    --image = {};
    --meta_data = {};
}
Instance.__index = Instance
Dung.Entities.Instance = Instance;

---Gets the instance description
---@return string
function Instance:GetDescription()
    local min = self:GetMinLevel();
    local max = self:GetMaxLevel();
    local levels = '(' .. min .. '-' .. max .. ')'

    if(self:IsHeroic() and not self:IsRaid()) then
        levels = '- Heroic (' ..min.. ')';
    end

    if(self:IsRaid()) then
        if self:IsHeroic() then
            levels = '- Heroic Raid (' ..min.. ')';
        else
            levels = '- Raid (' ..min.. ')';
        end
    end
    return self.name .. ' ' .. levels --.. ' ' .. self.max_players ..' Players'
end

---Gets the instance name
---@return string
function Instance:GetName()
    return self.name
end

---Sets the instance level range
---@param range table
---@return self
function Instance:SetLvlRange(range)
    if (isNotTable(range)) then
        return self;
    end;
    self.level_range = range;
    return self;
end

---Gets the instance level range
---@return string
function Instance:GetLevelRange()
    return self.level_range;
end

---Gets if the instance is heroic
---@return boolean
function Instance:IsHeroic()
    return self.current_difficulty == Difficulty.Heroic;
end

---Gets if the instance is a raid
---@return boolean
function Instance:IsRaid()
    return self.type == GroupType.Raid
end

---Gets the instance min level
---@return number
function Instance:GetMinLevel()
    if self:IsHeroic() then
        return self.level_range[2][1];
    end
    return self.level_range[1][1]
end

---Gets the instance max level
---@return number
function Instance:GetMaxLevel()
    if self:IsHeroic() then
        return self.level_range[2][2];
    end
    return self.level_range[1][2]
end

---Set max players for instance
---@param players number
---@return self
function Instance:SetMaxPlayers(players)
    if (isNotNumber(players)) then
        return self;
    end;
    self.max_players = players;
    return self;
end

---Get max players for instance
---@return number
function Instance:GetMaxPlayers()
    return self.max_players;
end

---Set instances keywords
---@param words table
---@return self
function Instance:SetKeyWords(words)
    if (isNotTable(words)) then
        return self;
    end;
    self.key_words = words;
    return self;
end

---Get instances keywords
---@return table
function Instance:GetKeyWords()
    return self.key_words;
end

---Set instances excluded keywords
---@param words table
---@return self
function Instance:SetExcludeWords(words)
    if (isNotTable(words)) then
        return self;
    end;
    self.exclude_words = words;
    --self.exclude_words[#words + 1] = 'recruiting';
    return self;
end

---Get instances excluded keywords
---@return table
function Instance:GetExcludeWords()
    return self.exclude_words;
end

---Set available difficulties
---@param diffs table
---@return self
function Instance:SetAvailableDifficulties(diffs)
    if (isNotTable(diffs)) then
        return self;
    end;
    self.avail_difficulty_types = diffs;
    return self;
end

---Get available difficulties
---@return table
function Instance:GetAvailableDifficulties()
    return self.avail_difficulty_types;
end

---Set current difficulty
---@param diff number
---@return self
function Instance:SetDifficulty(diff)
    if (isNotNumber(diff)) then
        return self;
    end;
    self.current_difficulty = diff;
    return self;
end

---Get current difficulty (it's a string label)
---@return string
function Instance:GetDifficulty()
    return Difficulty:GetLabel(self.current_difficulty);
end

---Is instance available in heroic difficulty
---@return boolean
function Instance:IsAvailableInHeroic()
    return self.avail_difficulty_types[Difficulty.Heroic] == Difficulty.Heroic;
end

---Set instance type
---@param type number
---@return self
function Instance:SetInstanceTypeRef(type)
    if (isNotNumber(type)) then
        return self;
    end;
    self.type = type;
    return self;
end

---Checks if this Instances keywords are in the keywords provided, value and key must match, eg. {'kara': 'kara', 'sp': 'sp}
---@param type number
---@return boolean|table
function Instance:CheckKeywords(keywords)
    local split_trying_keyword;
    local trying_keyword_asking_for_heroic;
    local trying_keyword_asking_for_normal;
    local matches_a_dungeon_keyword;

    for index,dungeon_keyword in pairs(self:GetKeyWords()) do
        --for performance - to try avoid running any code after this block
        --by doing an exact string comparison with dungeon keyword and search keyword
        for trying_keyword in pairs(keywords) do
            if string.len(trying_keyword) > 2 then
                if string.lower(dungeon_keyword) == string.lower(trying_keyword) then
                    if self:IsAvailableInHeroic() then
                        return {self, Difficulty.Any, trying_keyword};
                    end

                    return {self, Difficulty.Normal, trying_keyword};
                end
            end
        end

        for trying_keyword in pairs(keywords) do
            if string.len(trying_keyword) > 1 then
                split_trying_keyword = Dung:Split(Dung:RemoveJunkFromString(string.lower(trying_keyword)), ' ', false);
                trying_keyword_asking_for_heroic = false;
                trying_keyword_asking_for_normal = false;
                matches_a_dungeon_keyword = Dung:ContainsDungeonKeyword(split_trying_keyword, dungeon_keyword);

                if matches_a_dungeon_keyword then
                    trying_keyword_asking_for_heroic = matches_a_dungeon_keyword[2]
                    trying_keyword_asking_for_normal = matches_a_dungeon_keyword[3];

                    if trying_keyword_asking_for_heroic and not trying_keyword_asking_for_normal then
                        if self:IsAvailableInHeroic() then
                            return {self, Difficulty.Heroic, trying_keyword}
                        else
                            return {self, Difficulty.Normal, trying_keyword}
                        end
                    end

                    if trying_keyword_asking_for_normal and self:IsAvailableInHeroic() then
                        return {self, Difficulty.Normal, trying_keyword}
                    end

                    if not trying_keyword_asking_for_normal and not trying_keyword_asking_for_heroic and self:IsAvailableInHeroic() then
                        return {self, Difficulty.Any, trying_keyword}
                    end

                    return {self, Difficulty.Normal, trying_keyword}
                end
            end
        end
    end

    return false;
end
---Get instance type (it's a string label)
---@return string
function Instance:GetType()
    return GroupType:GetLabel(self.type);
end

---Set instance ID
---@param id string
---@return self
function Instance:SetId(id)
    if (isNotString(id)) then
        return self;
    end;
    self.id = id;
    return self;
end

---Get instance ID
---@return string
function Instance:GetId()
    return self.id;
end

function Instance:New(o)
    o = o or {}
    setmetatable(o, {__index = self})
    return o
end
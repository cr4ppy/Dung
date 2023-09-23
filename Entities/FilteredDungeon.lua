local _, Dung = ...

local Difficulty = Dung:GetModel('InstanceDifficulty');

local FilteredDungeon = {
    ---@type string|nil
    keyword = nil;

    ---@type number
    sort_order = nil;

    ---@type table
    instance = {};

    ---@type string
    difficulty = nil;
}
FilteredDungeon.__index = FilteredDungeon
Dung.Entities.FilteredDungeon = FilteredDungeon;

---Sets the sort order
---@param difficulty number
---@return self
function FilteredDungeon:SetDifficulty(difficulty)
    self.difficulty = difficulty;
    return self;
end

-----Gets difficulty
-----@return number
function FilteredDungeon:GetDifficulty()
    return self.difficulty;
end

-----Gets difficulty label
-----@return string
function FilteredDungeon:GetDifficultyLabel()
    return Difficulty:GetLabel(self.difficulty);
end

-----Gets difficulty label
-----@return string
function FilteredDungeon:GetTypeLabel()
    return Difficulty:GetLabel(self.difficulty);
end

---Gets if the instance is heroic
---@return boolean
function FilteredDungeon:IsHeroic()
    return self.difficulty == Difficulty.Heroic;
end

---Gets if the filtered dungeon is a raid
---@return boolean
function FilteredDungeon:IsRaid()
    return self.instance:IsRaid()
end

---Gets if the filtered dungeon is a raid
---@return boolean
function FilteredDungeon:IsShowAll()
    return self.difficulty == Difficulty.Any
end

---Sets instance
---@param inst Instance
---@return self
function FilteredDungeon:SetInstance(instance)
    self.instance = instance;
    return self;
end

---Gets instance
---@param inst Instance
---@return self
function FilteredDungeon:GetInstance()
    return self.instance;
end

---Sets the sort order
---@param sort_order number
---@return self
function FilteredDungeon:SetSortOrder(sort_order)
    self.sort_order = sort_order;
    return self;
end

---Sets the keyword
---@param keyword string
---@return self
function FilteredDungeon:SetKeyword(keyword)
    self.keyword = keyword;
    return self;
end

function FilteredDungeon:New()
    local o = {}
    setmetatable(o, {__index = self})
    return o
end

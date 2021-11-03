local _, LFM_GroupFinder = ...

local Post = {
    ---@type string
    message = '';

    ---@type table(Player)
    player = nil;

    ---@type number
    difficulty = nil;

    ---@type number
    type = nil;

    ---@type table(Instance)
    instance = nil;

    ---@type number
    time_last_posted = nil;

    ---@type boolean
    is_header = false;

    ---@type table
    roles_needed = {};

    ---@type number
    hide_buffer = 0;
}
Post.__index = Post;
LFM_GroupFinder.Entities.Post = Post;

local Difficulty = LFM_GroupFinder:GetModel('InstanceDifficulty')
local Roles = LFM_GroupFinder:GetModel('RoleType');

---Gets the post guid
---@return string
function Post:GetGuid()
    return self:GetInstance():GetId() .. '_' .. self.difficulty
end

---Sets the post message
---@param msg string
---@return self
function Post:SetMessage(msg)
    self.message = msg;
    return self;
end

---Gets the post message
---@return string
function Post:GetMessage()
    return self.message;
end

---Sets the hide buffer time
---@param hide_buffer number
---@return self
function Post:SetHideBuffer(hide_buffer)
    self.hide_buffer = hide_buffer;
    return self;
end

---Gets the hide buffer time
---@return number
function Post:GetHideBuffer()
    return self.hide_buffer;
end

---- Sets the roles needed
---@param roles_needed table
---@return self
function Post:SetRolesNeeded(roles_needed)
    self.roles_needed = roles_needed;
    return self;
end

---- Gets the roles needed
---@return table
function Post:GetRolesNeeded()
    return self.roles_needed;
end

---- Gets the roles needed count
---@return number
function Post:GetRolesNeededCount()
    local n = 0;
    for role in pairs(self.roles_needed) do
        n = n+1;
    end
    return n;
end

---- Gets if the post requires a tank role
---@return boolean
function Post:NeedsTank()
    return LFM_GroupFinder:Contains(self.roles_needed, Roles.Tank)
end

---- Gets if the post requires a healer role
---@return boolean
function Post:NeedsHeals()
    return LFM_GroupFinder:Contains(self.roles_needed, Roles.Heals)
end

---- Gets if the post requires a DPS role
---@return boolean
function Post:NeedsDPS()
    return LFM_GroupFinder:Contains(self.roles_needed, Roles.DPS)
end

---- Sets the post difficulty
---@param difficulty number
---@return self
function Post:SetDifficulty(difficulty)
    self.difficulty = difficulty;
    return self;
end

---- Gets the post difficulty
---@return number
function Post:GetDifficulty()
    return self.difficulty
end

---- Gets the post difficulty tag for the UI
---@return string
function Post:GetDifficultyTag()
    if self:GetInstance():IsRaid() then
        return "(R)"
    end
    if(self:IsHeroic()) then
        return "(H)";
    end
    return '(N)';
end

---- Returns if the post is heroic difficulty
---@return string
function Post:IsHeroic()
    return self.difficulty == Difficulty.Heroic
end

---Sets the post instance
---@param instance table(Instance)
---@return self
function Post:SetInstance(instance)
    self.instance = instance;
end

--- Gets the post instance (since instances are only initiated once you can set the difficulty you want the instance as)
--- note: I think setting the difficulty is kinda buggy with the metatable maybe...(first time lua user)
---
---@param difficulty number|nil
---@return table(Instance)
function Post:GetInstance(difficulty)
    difficulty = difficulty or Difficulty.Normal;
    self.instance.current_difficulty = difficulty;
    return self.instance
end

---Sets the post player
---@param player table(Player)
---@return self
function Post:SetPlayer(player)
    self.player = player;
end

---Gets the post player
---@return table
function Post:GetPlayer()
    return self.player
end

---Sets the last time posted
---@param time_last_posted number
---@return self
function Post:SetLastTimePosted(time_last_posted)
    self.time_last_posted = time_last_posted;
    return self;
end

---Gets the last time posted
---@return number
function Post:GetLastTimePosted()
    return self.time_last_posted
end

---Gets the last time posted as seconds
---@return number
function Post:GetLastTimeSeconds()
    return tonumber(difftime(GetServerTime(), self.time_last_posted))
end

---Gets the max amount of time the post can be alive for
---@return number
function Post:GetMaxTime()
    if self:GetInstance():IsRaid() then
        return LFM_GroupFinder.TIME_POST_ALIVE_RAID
    else -- IS DUNGEON
        if self:IsHeroic() then
            return LFM_GroupFinder.TIME_POST_ALIVE_DUNGEON_H
        end
    end
    return LFM_GroupFinder.TIME_POST_ALIVE
end

---Gets whether the post has expired or not
---@return boolean
function Post:HasExpired()
    return self:GetLastTimeSeconds() > self:GetMaxTime() + self.hide_buffer
end

---Gets elapsed time formatted for the UI.
---@return string
function Post:GetElapsedTime()
    local secs = self:GetLastTimeSeconds()
    local mins = math.floor(secs/60);

    if secs < 30 then
        return "<30s"
    end

    if mins >= 1 then
        return mins ..'m'
    end

    return "<1m"
end

function Post:New()
    local o = {}
    setmetatable(o, {__index = self})
    return o
end
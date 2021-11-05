local _, Dung = ...

local Player = {
    ---@type string
    name = 'Playername';

    ---@type number
    level = nil;

    ---@type table
    posts = {};

    ---@type string
    class = nil;

    ---@type string
    guid = nil;

    ---@type string
    realm = GetRealmName();
}
Player.__index = Player
Dung.Entities.Player = Player;

---Sets the player name
---@param name number
---@return self
function Player:SetName(name)
    self.name = name;
    return self;
end

---Gets the player name
---@return string
function Player:GetName()
    return self.name;
end

---Sets the player GUID
---@param guid string
---@return self
function Player:SetGuid(guid)
    self.guid = guid;
    return self;
end

---Gets the player GUID
---@return string
function Player:GetGuid()
    return self.guid;
end

---Sets the player realm
---@param realm string
---@return self
function Player:SetRealm(realm)
    self.realm = realm;
    return self;
end

---Gets the player realm
---@return string
function Player:GetRealm()
    return self.realm;
end

---Sets the player class, eg. WARRIOR
---@param class string
---@return self
function Player:SetClass(class)
    self.class = class;
    return self;
end

---Gets the player class
---@return string
function Player:GetClass()
    return self.class;
end

function Player:New()
    local o = {}
    setmetatable(o, {__index = self})
    return o
end

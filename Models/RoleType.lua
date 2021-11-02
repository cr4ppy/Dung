local _, LFM_GroupFinder = ...

local RoleType = LFM_GroupFinder.Models:CreateModel('RoleType', {
    ---@type number
    Tank = 1;

    ---@type number
    Heals = 2;

    ---@type number
    DPS = 3;

    ---@type number
    Looking = 4;

    ---@type table
    labels = {
        [1] = "Tank";
        [2] = "Heals";
        [3] = "DPS";
        [3] = "LFG";
    };

    ---@type table
    icons = {
        [1] = "Interface\\ICONS\\inv_shield_09",
        [2] = "Interface\\ICONS\\spell_nature_healingwavelesser",
        [3] = "Interface\\ICONS\\inv_sword_48",
        [4] = "Interface\\ICONS\\ability_townwatch"
    }
});

---Gets label for the role type index
---@param type string
---@return string
function RoleType:GetLabel(type)
    return self.labels[type];
end

---Gets icon file for the role type index
---@param type string
---@return string
function RoleType:GetIconFile(type)
    return self.icons[type];
end
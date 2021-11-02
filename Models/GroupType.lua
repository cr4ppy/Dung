local _, LFM_GroupFinder = ...

local GroupType = LFM_GroupFinder.Models:CreateModel('GroupType', {
    ---@type number
    Dungeon = 999990;

    ---@type number
    Raid = 999991;

    ---@type table
    labels = {
        [999990] = "Dungeon";
        [999991] = "Raid";
    };
});

---Gets label for the group type index
---@param type string
---@return string
function GroupType:GetLabel(type)
    return self.labels[type];
end
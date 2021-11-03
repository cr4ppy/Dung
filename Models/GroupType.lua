local _, LFM_GroupFinder = ...

local GroupType = LFM_GroupFinder.Models:CreateModel('GroupType', {
    ---@type number
    Dungeon = 999990;

    ---@type number
    Raid = 999991;

    ---@type number
    WorldEvent = 999992;

    ---@type table
    labels = {
        [999990] = "Dungeon";
        [999991] = "Raid";
        [999992] = "World Boss";
    };
});

---Gets label for the group type index
---@param type string
---@return string
function GroupType:GetLabel(type)
    return self.labels[type];
end
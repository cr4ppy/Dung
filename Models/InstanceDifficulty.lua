local _, Dung = ...

local InstanceDifficulty = Dung.Models:CreateModel('InstanceDifficulty', {
    ---@type number
    Any = 0;

    ---@type number
    Normal = 1;

    ---@type number
    Heroic = 2;

    ---@type number
    Mythic = 3;

    ---@type number
    LFR = 4;

    ---@type table
    Labels = {
        [0] = "Any";
        [1] = "Normal";
        [2] = "Heroic";
        [3] = "Mythic";
        [4] = "LFR"
    };
});

---Gets label for the instance type index
---@param type string
---@return string
function InstanceDifficulty:GetLabel(type)
    return self.Labels[type];
end

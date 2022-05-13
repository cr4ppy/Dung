local _, Dung = ...

local GameVersion = Dung.Models:CreateModel('GameVersion', {
    ---@type number
    TBC = 1;

    ---@type number
    Vanilla = 2;

    ---@type table
    labels = {
        [1] = "Burning Crusade Classic";
        [2] = "Classic Season of Mastery";
    };
});

---Gets label for the game version index
---@param type string
---@return string
function GameVersion:GetLabel(type)
    return self.labels[type];
end
local _, Dung = ...

local Roles = Dung:GetModel('RoleType')

Dung.Data.RoleKeywords = {
    [Roles.Tank] = {'tank', 'tanks', 'offtank', 'off tank', 'main tank'};
    [Roles.Heals] = {'heals', 'healer', 'heal', 'healers'},
    [Roles.DPS] = {'dps', 'deeps', 'dpos'},
    [Roles.Looking] = {'lfg'},
}
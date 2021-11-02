local _, LFM_GroupFinder = ...

local Roles = LFM_GroupFinder:GetModel('RoleType')

LFM_GroupFinder.Data.RoleKeywords = {
    [Roles.Tank] = {'tank', 'tanks', 'offtank', 'off tank', 'main tank'};
    [Roles.Heals] = {'heals', 'healer', 'heal'},
    [Roles.DPS] = {'dps', 'deeps'},
    [Roles.Looking] = {'lfg'},
}
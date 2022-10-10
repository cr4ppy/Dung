local _, Dung = ...

local Difficulty = Dung:GetModel('InstanceDifficulty')

Dung.Data.NormalKeywords = {
    'N',
    'Normal',
    '(N)',
    '-N',
    'N-',
    '-N-'
}

--We really just need the key in this table for look ups
--But I decided to add the normal difficulty as the value because it's relevant

--not the most elegant, but the fastest
Dung.Data.NormalKeywordsSearch = {
    ['n'] = Difficulty.Normal,
    ['no'] = Difficulty.Normal,
    ['nor'] = Difficulty.Normal,
    ['norm'] = Difficulty.Normal,
    ['norma'] = Difficulty.Normal,
    ['normal'] = Difficulty.Normal,
}
local _, Dung = ...

local Difficulty = Dung:GetModel('InstanceDifficulty')

Dung.Data.HeroicKeywords = {
    'H',
    'Heroic',
    '(H)',
    '-H',
    'H-',
    '-H-'
}

--We really just need the key in this table for look ups
--But I decided to add the heroic difficulty as the value because it's relevant
Dung.Data.HeroicKeywordsSearch = {
    [string.lower(Dung.Data.HeroicKeywords[1])] = Difficulty.Heroic,
    [string.lower(Dung.Data.HeroicKeywords[2])] = Difficulty.Heroic,
}
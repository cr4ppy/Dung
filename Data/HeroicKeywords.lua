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

--not the most elegant, but the fastest
Dung.Data.HeroicKeywordsSearch = {
    ['h'] = Difficulty.Heroic,
    ['heroic'] = Difficulty.Heroic,
    ['he'] = Difficulty.Heroic,
    ['her'] = Difficulty.Heroic,
    ['hero'] = Difficulty.Heroic,
    ['heroi'] = Difficulty.Heroic,
}
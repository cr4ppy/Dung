local function dump(var, ...) return DevTools_Dump(var, ...) end

local _, LFM_GroupFinder = ...

function LFM_GroupFinder:RunFixtures(stop)
    local name = 'Hippo';
    --local guid_name = UnitName("player")..'-'..GetRealmName();

    --, ,'H ramps tank dps','ramps heals', 'zg tank', 'sp', 'dm heals', 'zg', 'ub', 'sethekk'
    --for i,dummy_msg in ipairs({'sp H tank dps heals','sp H dps', 'dm', 'zf','ub','H ramps tank dps','ramps heals', 'zg tank', 'sp', 'dm heals', 'zg', 'ub', 'sethekk'}) do
    --    if i == 5 then
    --        dummy_msg = 'sp tank heals dps This music is entertaining. It put me in positive thinking. One day this pandemic going away soon where we can enjoy the outdoor without the mask and better understand our physical condition.'
    --    end
    --    if i == 5 then
    --        name = 'Wfleldo'
    --    end
    --    LFM_GroupFinder:OnChat(dummy_msg, name..i..'-'..GetRealmName(), nil)
    --end
    --

    LFM_GroupFinder:OnChat('SLAVE PENS ', 'Bilbo'..'-'..GetRealmName(), nil)
    LFM_GroupFinder:OnChat('SP PENS H', 'Bilbod'..'-'..GetRealmName(), nil)
    LFM_GroupFinder:OnChat('karas heals tank dps ed ', 'wefw'..'-'..GetRealmName(), nil)
    LFM_GroupFinder:OnChat(' {star}LF2M Sethekk (n) Need healer+dps{star} farming first boss. ', 'wefd'..'-'..GetRealmName(), nil)
    --'LFM AC (N) NEED TANK/DPS POST'
    --'DPS LFG ARCATRAZ / SV / SL'
    --LFM_GroupFinder:OnChat('healer lfg slabs / honor hold rep farm', 'Wfleldosoerr', nil)
    --LFM_GroupFinder:OnChat('slabs (H)!! lfg / honor hold rep farm honor hold rep farm honor hold rep farm honor hold rep farm', 'Oakee', nil)
    --LFM_GroupFinder:OnChat('karas heals tank dps ed', 'Donkey', nil)
    --LFM_GroupFinder:OnChat('dps lfg slabs / honor hold rep farm', 'Donkey', nil)
    --LFM_GroupFinder:OnChat('{star}LF2M Sethekk (n) Need healer+dps{star} farming first boss.', 'Donkey', nil)
    --LFM_GroupFinder:OnChat('', 'Donkey', nil)

    --dump(string.gsub("{star}DPS{star}",'{star}', ""));
    --LFM_GroupFinder_Frame:Show();
    --LFM_GroupFinder.isRunning = false;
end
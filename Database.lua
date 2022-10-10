local _, Dung = ...

local DB = {}
DB.__index = DB;

function DB:playerData()
    return Dung_GroupFinder_DB_Character
end

function DB:allData()
    return Dung_GroupFinder_DB
end

function DB:hasPlayerDBFile()
    return type(Dung_GroupFinder_DB_Character) == 'table'
end

function DB:setData(key, val)
    if not self:hasPlayerDBFile() then return nil end;
    self:playerData()[key] = val;
end

function DB:getData(key, val)
    if not self:hasPlayerDBFile() then return nil end;
    return self:playerData()[key];
end

function DB:clearData(key)
    self:playerData()[key] = nil;
end

function DB:init()
    Dung_GroupFinder_DB_Character = {};
end

Dung.DB = DB;
local _, Dung = ...

local str_match = string.match;
local str_lower = string.lower;
local str_gsub = string.gsub;
local str_gmatch = string.gmatch;
local str_format = string.format;

--- Replaces specific characters/phrases from a string with a whitespace BEFORE we split into a words table.
---
--- eg. vc{skull} or kara-heals = "vc", "kara heals"
---
---@param str string
---@return string
function Dung:RemoveJunkFromString(str)
    return str_gsub(str, "[^A-Za-z0-9]", ' ')
end


---
---ASSERT TYPES
---
function Dung.Assert(var_type, var)
    if (type(var) ~= var_type) then
        return false;
    end;
    return true;
end
function Dung.AssertTable(table)
    return Dung:Assert('table', table)
end
function Dung.AssertNumber(num)
    return Dung:Assert('number', num)
end
function Dung.AssertString(str)
    return Dung:Assert('string', str)
end

---
---CONTAINS EXACT STRING
---
function Dung:ContainsExact(tbl, value)
    if(type(tbl) ~= 'table') then return false end

    for key,val in pairs(tbl) do
        if str_lower(val) == str_lower(value) or str_lower(key) == str_lower(value) then
            return true;
        end
    end
    return false
end

---
---CONTAINS
---
function Dung:Contains(tbl, value)
    if(type(tbl) ~= 'table') then
        return false
    end

    for i,val in pairs(tbl) do
        if str_match(value, val) then
            return i;
        end
    end
    return false
end

---
---SPLIT STRING INTO TABLE WITH SEP
---
function Dung:Split(str, sep, value_as_key)
    local result = {}
    local regex = string.format(("([^%s]+)"), sep)

    for each in str_gmatch(str, regex) do
        if value_as_key then
            result[str_lower(each)] = each;
        else
            table.insert(result, each)
        end
    end

    return result
end

function Dung:TrimStartEnd(str)
    return str:gsub("^%s*(.-)%s*$", "%1");
end

function Dung:SplitSearchString(str, sep)
    local result = {}
    local regex = str_format(("([^%s]+)"), sep)
    local trimmed;
    local index = 0;

    for each in str_gmatch(str, regex) do
        index = index + 1;
        trimmed = Dung:TrimStartEnd(each)
        result[trimmed] = index;
    end

    return result
end

---
---Model + Entity class getters
---
function Dung:GetModel(name)
    return self.Models[name] or {};
end
function Dung:GetEntity(name)
    return self.Entities[name];
end

function Dung:dump(var)
    return DevTools_Dump(var)
end
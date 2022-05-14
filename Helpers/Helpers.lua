local _, Dung = ...

--- Replaces specific characters/phrases from a string with a whitespace BEFORE we split into a words table.
---
--- eg. vc{skull} or kara-heals = "vc", "kara heals"
---
---@param str string
---@return string
function Dung:RemoveJunkFromString(str)
    return string.gsub(str, "[^A-Za-z0-9]", ' ')
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
---CONTAINS
---
function Dung:Contains(tbl, value)
    if(type(tbl) ~= 'table') then return false end

    for key,val in pairs(tbl) do
        if string.lower(val) == string.lower(value) or string.lower(key) == string.lower(value) then
            return true;
        end
    end
    return false
end

---
---SPLIT STRING INTO TABLE WITH SEP
---
function Dung:Split(str, sep)
    local result = {}
    local regex = string.format(("([^%s]+)"), sep)

    for each in string.gmatch(str, regex) do
        table.insert(result, each)
    end

    return result
end

function Dung:TrimStartEnd(str)
    return str:gsub("^%s*(.-)%s*$", "%1");
end

function Dung:SplitSearchString(str, sep)
    local result = {}
    local regex = string.format(("([^%s]+)"), sep)
    local trimmed;

    for each in string.gmatch(str, regex) do
        trimmed = Dung:TrimStartEnd(each)
        result[trimmed] = trimmed;
    end

    return result
end

---
---JOIN TABLE INTO STR
---
--function Dung:Join(tbl)
--
--end

---
---Model + Entity class getters
---
function Dung:GetModel(name)
    return self.Models[name] or {};
end
function Dung:GetEntity(name)
    return self.Entities[name];
end

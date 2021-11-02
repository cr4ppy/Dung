local _, LFM_GroupFinder = ...

--- Replaces specific characters/phrases from a string with a whitespace BEFORE we split into a words table.
---
--- eg. vc{skull} or kara-heals = "vc", "kara heals"
---
---@param str string
---@return string
function LFM_GroupFinder:RemoveJunkFromString(str)
    --all strings dealt with here are lowercase - i'm new to lua, i don't know if there's a cleaner way to do this, regex the brackets? {}
    str = str.gsub(str,'{star}', " ")
    str = str.gsub(str,'{circle}', " ")
    str = str.gsub(str,'{coin}', " ")
    str = str.gsub(str,'{diamond}', " ")
    str = str.gsub(str,'{triangle}', " ")
    str = str.gsub(str,'{moon}', " ")
    str = str.gsub(str,'{square}', " ")
    str = str.gsub(str,'{cross}', " ")
    str = str.gsub(str,'{skull}', " ")
    str = str.gsub(str,'{x}', " ")
    str = str.gsub(str,'{rt8}', " ")
    str = str.gsub(str,'{rt7}', " ")
    str = str.gsub(str,'{rt6}', " ")
    str = str.gsub(str,'{rt5}', " ")
    str = str.gsub(str,'{rt4}', " ")
    str = str.gsub(str,'{rt3}', " ")
    str = str.gsub(str,'{rt2}', " ")
    str = str.gsub(str,'{rt1}', " ")
    --str = str.gsub(str, '.', ' '); todo: this breaks, needs debugging
    str = str.gsub(str, '+', ' ');
    str = str.gsub(str, '*', ' ');
    str = str.gsub(str, '_', ' ');
    str = str.gsub(str, '|', ' ');
    str = str.gsub(str, '`', ' ');
    str = str.gsub(str, '!', ' ');
    str = str.gsub(str, '-', ' ');
    str = str.gsub(str, '/', ' ');
    str = str.gsub(str, '\\', ' ');
    str = str.gsub(str, ',', ' ');
    str = str.gsub(str, '  ', ' ');
    return str
end

---
---ASSERT TYPES
---
function LFM_GroupFinder.Assert(var_type, var)
    if (type(var) ~= var_type) then
        return false;
    end;
    return true;
end
function LFM_GroupFinder.AssertTable(table)
    return LFM_GroupFinder:Assert('table', table)
end
function LFM_GroupFinder.AssertNumber(num)
    return LFM_GroupFinder:Assert('number', num)
end
function LFM_GroupFinder.AssertString(str)
    return LFM_GroupFinder:Assert('string', str)
end

---
---CONTAINS
---
function LFM_GroupFinder:Contains(tbl, value)
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
function LFM_GroupFinder:Split(str, sep)
    local result = {}
    local regex = string.format(("([^%s]+)"), sep)
    for each in string.gmatch(str, regex) do
      table.insert(result, each)
    end
    return result
end

---
---Model + Entity class getters
---
function LFM_GroupFinder:GetModel(name)
    return self.Models[name] or {};
end
function LFM_GroupFinder:GetEntity(name)
    return self.Entities[name];
end

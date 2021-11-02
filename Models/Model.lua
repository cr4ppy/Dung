local _, LFM_GroupFinder = ...

--Base Model we inherit from
LFM_GroupFinder.Models.Model = {
    name = '!defaultModel!';
    labels = {};
}

--Get the name of the current model you're working with.
function LFM_GroupFinder.Models.Model:GetName()
    return self.name
end
function LFM_GroupFinder.Models.Model:SetName(name)
    self.name = name
    return self
end

--Create a new Model
function LFM_GroupFinder.Models:CreateModel(name, o)
    setmetatable(o, {__index = LFM_GroupFinder.Models.Model});
    o.name = name;
    self.__index = LFM_GroupFinder.Models.Model;
    LFM_GroupFinder.Models[name] = o;
    self.name = name;
    return o
end
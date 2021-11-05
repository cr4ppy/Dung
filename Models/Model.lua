local _, Dung = ...

--Base Model we inherit from
Dung.Models.Model = {
    name = '!defaultModel!';
    labels = {};
}

--Get the name of the current model you're working with.
function Dung.Models.Model:GetName()
    return self.name
end
function Dung.Models.Model:SetName(name)
    self.name = name
    return self
end

--Create a new Model
function Dung.Models:CreateModel(name, o)
    setmetatable(o, {__index = Dung.Models.Model});
    o.name = name;
    self.__index = Dung.Models.Model;
    Dung.Models[name] = o;
    self.name = name;
    return o
end
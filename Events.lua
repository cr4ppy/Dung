local _, LFM_GroupFinder = ...

local function dump(var, ...) return DevTools_Dump(var, ...) end

----- Hover on a post
-----
-----@param self self
-----@return void
function LFM_GroupFinder_OnPostHover(self)
    local btnText = _G[self:GetName().."NormalText"];
    local btnRole1 = _G[self:GetName().."Role1"];
    local btnRole2 = _G[self:GetName().."Role2"];
    local btnRole3 = _G[self:GetName().."Role3"];
    local btnRole4 = _G[self:GetName().."Role4"];

    if(self.is_header) then
        btnText:SetTextColor(1, 0.8, 0.7);
    else
        btnText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
        btnRole1:SetAlpha(1)
        btnRole2:SetAlpha(1)
        btnRole3:SetAlpha(1)
        btnRole4:SetAlpha(1)
    end
end

----- Hover off a post
-----
-----@param self self
-----@return void
function LFM_GroupFinder_OnPostLeave(self)
    local btnText = _G[self:GetName().."NormalText"];
    local btnRole1 = _G[self:GetName().."Role1"];
    local btnRole2 = _G[self:GetName().."Role2"];
    local btnRole3 = _G[self:GetName().."Role3"];
    local btnRole4 = _G[self:GetName().."Role4"];

    if(self.is_header) then
        btnText:SetTextColor(1, 0.8, 0);
    else
        btnText:SetTextColor(0.9, 0.9, 0.9);
        btnRole1:SetAlpha(0.5)
        btnRole2:SetAlpha(0.5)
        btnRole3:SetAlpha(0.5)
        btnRole4:SetAlpha(0.5)
    end
end

----- Click on a post.
-----
-----@param self self
-----@return void
function LFM_GroupFinder_OnPostClick(self)
    local instance_guid = self.Post:GetGuid();
    local player_name = self.Post:GetPlayer():GetName();
    
    if(self.is_header) then
        if(self.is_collapsed == true) then
            LFM_GroupFinder.Data.CollapsedStates[instance_guid] = nil;
            self.is_collapsed = false;
        else
            LFM_GroupFinder.Data.CollapsedStates[instance_guid] = true;
            self.is_collapsed = true;
        end
        LFM_GroupFinder_BigBoyUpdate();
    else
            --send a /who request
        if(IsShiftKeyDown()) then
            C_FriendList.SendWho(player_name);
        else --open chat window with a whisper
            local edit_box = DEFAULT_CHAT_FRAME.editBox;
            ChatEdit_ActivateChat(edit_box);
            edit_box:SetAttribute("chatType", "WHISPER");
            edit_box:Insert('/whisper '..player_name..' ');
        end
    end
end

----- Click collapse all
-----
-----@return void
function LFM_GroupFinder_ToggleAllCollapsed()
    LFM_GroupFinder.PostTable.toggle_hide_all = not LFM_GroupFinder.PostTable.toggle_hide_all --toggle, true = false and false = true

    if(LFM_GroupFinder.PostTable.toggle_hide_all) then
        local Instance;
        local difficulties;

        for i=1, LFM_GroupFinder.DungeonCount do
            Instance = LFM_GroupFinder.Data.Instances[i];
            difficulties = Instance:GetAvailableDifficulties();

            for j=1, #difficulties do
                LFM_GroupFinder.Data.CollapsedStates[Instance:GetId().. '_' .. difficulties[j]] = true;
            end
        end
    else
        LFM_GroupFinder.Data.CollapsedStates = {};
    end

    LFM_GroupFinder_BigBoyUpdate();
end

----- Click filter checkbox (normal, heroic, raid)
-----
-----@param self self
-----@return void
function LFM_GroupFinder_ToggleType(self)
    local Difficulty = LFM_GroupFinder:GetModel('InstanceDifficulty');
    local GroupType = LFM_GroupFinder:GetModel('GroupType');

    if self:GetID() == Difficulty.Normal then
        LFM_GroupFinder.PostTable.show_normal = not LFM_GroupFinder.PostTable.show_normal;
    end
    if self:GetID() == Difficulty.Heroic then
        LFM_GroupFinder.PostTable.show_heroic = not LFM_GroupFinder.PostTable.show_heroic;
    end
    if self:GetID() == GroupType.Raid then
        LFM_GroupFinder.PostTable.show_raid = not LFM_GroupFinder.PostTable.show_raid;
    end

    LFM_GroupFinder_BigBoyUpdate();
end

local _, Dung = ...

--local function dump(var, ...) return DevTools_Dump(var, ...) end

----- Hover on a post
-----
-----@param self self
-----@return void
function Dung_GroupFinder_OnPostHover(self)
    local btnText = _G[self:GetName().."NormalText"];
    local btnRole1 = _G[self:GetName().."Role1"];
    local btnRole2 = _G[self:GetName().."Role2"];
    local btnRole3 = _G[self:GetName().."Role3"];
    local btnRole4 = _G[self:GetName().."Role4"];

    --show tool tip
    if self.Post ~= nil and not self.is_header then
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT", 0, 5);
        GameTooltip:SetText(format(self.Post:GetPlayer():GetName()..': %s', '|cffFFFFFF'..self.Post:GetMessage()..'|r'));
        GameTooltip:Show();
    end

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
function Dung_GroupFinder_OnPostLeave(self)
    local btnText = _G[self:GetName().."NormalText"];
    local btnRole1 = _G[self:GetName().."Role1"];
    local btnRole2 = _G[self:GetName().."Role2"];
    local btnRole3 = _G[self:GetName().."Role3"];
    local btnRole4 = _G[self:GetName().."Role4"];

    --hide tool tip
    GameTooltip:Hide();

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
function Dung_GroupFinder_OnPostClick(self)
    local instance_guid = self.Post:GetGuid();
    local player_name = self.Post:GetPlayer():GetName();

    if(self.is_header) then
        if(self.is_collapsed == true) then
            Dung.Data.CollapsedStates[instance_guid] = nil;
            self.is_collapsed = false;
        else
            Dung.Data.CollapsedStates[instance_guid] = true;
            self.is_collapsed = true;
        end
        Dung_GroupFinder_BigBoyUpdate();
    else
        local activeWindow = ChatEdit_GetActiveWindow();
        --send a /who request
        if(IsShiftKeyDown()) then
            --if the whisper window is already open then copy the players name into the chat window for copying
            if(activeWindow) then
                local edit_box = DEFAULT_CHAT_FRAME.editBox;
                ChatEdit_ActivateChat(edit_box);
                edit_box:SetAttribute("chatType", "SAY");
                edit_box:Insert(player_name);
            else
                C_FriendList.SendWho(player_name);
            end

        else --open chat window with a whisper

            if(activeWindow) then return end;

            local edit_box = DEFAULT_CHAT_FRAME.editBox;
            ChatEdit_ActivateChat(edit_box);
            edit_box:SetAttribute("chatType", "WHISPER");
            edit_box:Insert('/whisper '..player_name..' ');
        end
    end
end

----- Click collapse all
---
-----@param self self
-----@return void
function Dung_GroupFinder_ToggleAllCollapsed(self)
    Dung.PostTable.toggle_hide_all = not Dung.PostTable.toggle_hide_all --toggle, true = false and false = true

    if(Dung.PostTable.toggle_hide_all) then
        local Instance;
        local difficulties;

        for i=1, Dung.DungeonCount do
            Instance = Dung.Data.Instances[i];
            difficulties = Instance:GetAvailableDifficulties();

            for j=1, #difficulties do
                Dung.Data.CollapsedStates[Instance:GetId().. '_' .. difficulties[j]] = true;
            end
        end
    else
        Dung.Data.CollapsedStates = {};
    end

    Dung_GroupFinder_BigBoyUpdate();
end

----- Click filter checkbox (normal, heroic, raid)
-----
-----@param self self
-----@return void
function Dung_GroupFinder_ToggleType(self)
    local Difficulty = Dung:GetModel('InstanceDifficulty');
    local GroupType = Dung:GetModel('GroupType');

    if self:GetID() == Difficulty.Normal then
        Dung.PostTable.show_normal = not Dung.PostTable.show_normal;
    end
    if self:GetID() == Difficulty.Heroic then
        Dung.PostTable.show_heroic = not Dung.PostTable.show_heroic;
    end
    if self:GetID() == GroupType.Raid then
        Dung.PostTable.show_raid = not Dung.PostTable.show_raid;
    end

    Dung_GroupFinder_BigBoyUpdate();
end

----- Toggle filter on/off
-----
-----@param self self
-----@return void
function Dung_GroupFinder_ToggleFilter(self)
    local checked = Dung:ToggleUseFilter();

    if not checked then
        Dung_GroupFinder_FilterInput:SetAlpha(0.5)
        Dung_GroupFinder_FilterInput:ClearFocus();
    else
        Dung_GroupFinder_FilterInput:SetAlpha(1)
    end

    Dung_GroupFinder_DB_Character.filter = checked;

    Dung_GroupFinder_BigBoyUpdate();
end

----- Click to order list asc or desc
-----
-----@param self self
-----@return void
function Dung_GroupFinder_OrderListButton_OnClick(self)

    if Dung.PostTable.current_order_state >= #Dung.PostTable.sort_states then
        Dung.PostTable.current_order_state = 1
    else
        Dung.PostTable.current_order_state = Dung.PostTable.current_order_state + 1;
    end

    Dung.PostTable:set_order_arrow();

    Dung_GroupFinder_BigBoyUpdate();
end

function Dung_GroupFinder_FilterInput_OnLoad(self)
    if(Dung.PostTable.search_word ~= '') then
        self:SetText(Dung.PostTable.search_word)
    end
end

----- Filters list by keyword
-----
-----@param self self
-----@return boolean
function Dung_GroupFinder_FilterInput_OnChange(self)
    local search_keyword = self:GetText();

    if (search_keyword == "") then
        Dung_GroupFinder_FilterInputPromptText:Show();
        Dung.PostTable.search_word = "";
    else
        Dung_GroupFinder_FilterInputPromptText:Hide();
        Dung.PostTable.search_word = search_keyword;
    end

    Dung_GroupFinder_DB_Character['search'] = search_keyword;
    Dung_GroupFinder_BigBoyUpdate();
    return true;
end
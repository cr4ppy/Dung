local _, LFM_GroupFinder = ...

local function dump(var, ...) return DevTools_Dump(var, ...) end

--todo: LIST
------1. REMOVE ALL {r3} VARIABLES FROM STRINGS BEFORE CHECKS
------2. ADD RECRUITING TO ALL EXCLUDES
------3. ADD TRADE KEYWORDS LIKE ENCHANTER/JC FOR IGNORE ON ALL
------4. CLICK WHISPER ✔️
------4. SLASH COMMANDS4
------5. OPTIONS!
------5. LOCALIZATION
------6. FIX RAID FILTER?
------7. SEARCH FILTER
------misc. REPLACE IPAIRS
------misc. EXCLUDE "." FROM STRINGS
------misc. MAKE MESSAGE TEXT GREYISH

if not LFM_GroupFinder_DB then LFM_GroupFinder_DB = {} end -- fresh DB
if not LFM_GroupFinder_DB_Character then LFM_GroupFinder_DB_Character = {} end -- fresh DB

LFM_GroupFinder.Database = LFM_GroupFinder_DB or {};
LFM_GroupFinder.Database.Character = LFM_GroupFinder_DB_Character or {};
LFM_GroupFinder.Tests = {};
LFM_GroupFinder.isRunning = true;
LFM_GroupFinder.POST_HEIGHT = 16;
LFM_GroupFinder.MAX_HEIGHT = 400;
LFM_GroupFinder.TIME_POST_ALIVE = 60 * 2.5; --2.5 minutes
LFM_GroupFinder.TIME_POST_ALIVE_DUNGEON_H = 60 * 3.5; --3.5 minutes
LFM_GroupFinder.TIME_POST_ALIVE_RAID = 60 * 6; --6 minutes
LFM_GroupFinder.DungeonCount = 0; -- amount of dungeons we have, gets populated after they get loaded
LFM_GroupFinder.Data = {};
LFM_GroupFinder.Data.CollapsedStates = {};
LFM_GroupFinder.Models = {};
LFM_GroupFinder.Entities = {};
LFM_GroupFinder.PostTable = {
    posts = {};
    max_display_count = 25;
    display_count = 25;
    show_normal = true;
    show_heroic = true;
    show_raid = true;
    toggle_hide_all = false;
    sort = {
        ---Sorts posts highest to lowest (time posted)
        asc = function(postLeft, postRight)
            return postLeft:GetLastTimePosted() < postRight:GetLastTimePosted()
        end,

        ---Sorts posts lowest to highest (time posted)
        desc = function(postLeft, postRight)
            return postLeft:GetLastTimePosted() > postRight:GetLastTimePosted()
        end
    },
    set_time_color = function(textElement, elapsed)
        if elapsed == '<30s' or elapsed == '<1m' then
            textElement:SetTextColor(0,1,0);
        else
            textElement:SetTextColor(1, 0.8, 0)
        end
    end;
    ---Sets a post text length by how many roles it has (Needs be shifted over to make room for the role icons (tank,dps) etc
    --You can probably use the role count and multiply the icon width (12px).. but whatever they're fine hardcoded
    set_msg_length = function(textElement, roleCount)
        if ( textElement:GetWidth() >= LFM_GroupFinder_Frame:GetWidth() - 216) then
            if roleCount == 1 then
                textElement:SetWidth((LFM_GroupFinder_Frame:GetWidth() - 192))
            elseif roleCount == 2 then
                textElement:SetWidth((LFM_GroupFinder_Frame:GetWidth() - 204))
            elseif roleCount == 3 then
                textElement:SetWidth((LFM_GroupFinder_Frame:GetWidth() - 216))
            elseif roleCount == 4 then
                textElement:SetWidth((LFM_GroupFinder_Frame:GetWidth() - 228))
            else
                textElement:SetWidth((LFM_GroupFinder_Frame:GetWidth() - 180))
            end
        end
    end;
    ---Sets the difficulty tag color
    set_difficulty_tag = function(textElement, is_raid, is_heroic)
        if(is_raid) then
            if(is_heroic) then
                --LEGENDARY ORANGE
                textElement:SetTextColor(ITEM_QUALITY_COLORS[5].r, ITEM_QUALITY_COLORS[5].g, ITEM_QUALITY_COLORS[5].b);
            else
                --EPIC PURPLE
                textElement:SetTextColor(ITEM_QUALITY_COLORS[4].r, ITEM_QUALITY_COLORS[4].g, ITEM_QUALITY_COLORS[4].b);
            end
        else
            if(is_heroic) then
                --BLUE
                textElement:SetTextColor(ITEM_QUALITY_COLORS[3], ITEM_QUALITY_COLORS[3], ITEM_QUALITY_COLORS[3]);
            else
                --WHITE
                textElement:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
            end
        end
    end,
};


--- Adds a post from the table (then updates table)
---
---@param Post table (Post)
---@return void
function LFM_GroupFinder:AddPost(Post)
    table.insert(self.PostTable.posts, Post);

    LFM_GroupFinder_BigBoyUpdate();
    return true;
end

--- Removes a post from the table (then updates table)
---
---@param Post table (Post)
---@return boolean
function LFM_GroupFinder:RemovePost(Post)
    for i,post in pairs(self.PostTable.posts) do
        if post == Post then
            table.remove(self.PostTable.posts, i)
            return true;
        end
    end

    LFM_GroupFinder_BigBoyUpdate()
    return false;
end

--- Get posts ready for the UI - orders them and returns a table of { is_header = (boolean), post = Post }
---
---@param order string
---@return table
function LFM_GroupFinder:GetPostsForScrollWindow(order)
    if(not self.PostTable.show_raid and not self.PostTable.show_heroic and not self.PostTable.show_normal) then
        return {}
    end
    --sort newest to lowest default for now todo: more sorting
    table.sort(self.PostTable.posts, self.PostTable.sort.desc);

    local finalList = {}

    local function addToList(Post, index, collapsed)
        if index == nil then
            table.insert(finalList,{
                is_header = true,
                post = Post
            });

            index = #finalList;
        else
            index = index + 1
        end

        --if not collapsed
        if not collapsed then
            table.insert(finalList,index + 1, {
                is_header = false,
                post = Post
            })
        end
    end

    local instance_guid, index, is_collapsed;
    for key,post in pairs(self.PostTable.posts) do
        instance_guid = post:GetGuid();
        index = self:FindDungeonHeaderIndex(instance_guid, finalList);
        is_collapsed = self.Data.CollapsedStates[instance_guid] == true;

        if(self.PostTable.show_raid and post:GetInstance():IsRaid()) then
            addToList(post, index, is_collapsed)
        elseif self.PostTable.show_heroic and post:IsHeroic() then
            addToList(post, index, is_collapsed)
        elseif self.PostTable.show_normal and not post:IsHeroic() then
            addToList(post, index, is_collapsed)
        end
    end

    return finalList
end

--- Takes an instance ID and table of posts (ready for the UI) and finds the instance_id's header index.
---
--  todo: make this function redundant
---
---@param instance_id string
---@param finalList table
---@return number|nil
function LFM_GroupFinder:FindDungeonHeaderIndex(instance_id, finalList)
    local list_item;

    for index in ipairs(finalList) do
        list_item = finalList[index];
        if list_item.is_header and list_item.post:GetGuid() == instance_id then
            return index;
        end
    end
    return nil;
end

--- Takes a table of words (split chat message) and determines if the Instance entity has any excluded keywords
---
---@param msg_parts string
---@param Instance table (Instance entity)
---@return boolean
function LFM_GroupFinder:HasExcludedWords(msg_parts, Instance)
    for i,exclude_word in ipairs(Instance:GetExcludeWords()) do
        if self:Contains(msg_parts, exclude_word) then
            return true;
        end
    end
    return false;
end

--- Takes a table of words (split chat message) and determines if the post is heroic difficulty.
---
---@param msg_parts table
---@return boolean
function LFM_GroupFinder:IsPostHeroic(msg_parts)
    for i,heroic_keyword in ipairs(self.Data.HeroicKeywords) do
        if  self:Contains(msg_parts, heroic_keyword) or
            self:Contains(msg_parts, heroic_keyword)
            then
                return true
        end
    end
    return false;
end

--- Takes a chat message and returns a table of { difficulty, Instance, roles_needed }
---
---@param post_msg string
---@return table
function LFM_GroupFinder:CheckPost(post_msg)--Checks
    local final = {};
    local words = self:Split(self:RemoveJunkFromString(string.lower(post_msg)), ' ');
    local Difficulty = self:GetModel('InstanceDifficulty');
    local Roles = self:GetModel('RoleType');
    local Instance;

    for i=1, self.DungeonCount do
        Instance = self.Data.Instances[i];
        if self:HasExcludedWords(words, Instance) then
            break;
        end

        local is_heroic = self:IsPostHeroic(words) and Instance:IsAvailableInHeroic();
        local roles_needed = {}

        for i,keywords in ipairs(self.Data.RoleKeywords) do
            for j,keyword in ipairs(keywords) do
                if self:Contains(words, keyword) then
                    roles_needed[i] = true;
                end
            end
        end

        --todo: these blocks are no good here
        if self:Contains(words, 'all') then
            roles_needed[Roles.Tank] = true;
            roles_needed[Roles.Heals] = true;
            roles_needed[Roles.DPS] = true;
            roles_needed[Roles.Looking] = nil;
        end

        if self:Contains(words, 'tankheal') or self:Contains(words, 'healtank') then
            roles_needed[Roles.Tank] = true;
            roles_needed[Roles.Heals] = true;
            roles_needed[Roles.Looking] = nil;
        end

        if self:Contains(words, 'tankdps') or self:Contains(words, 'dpstank') then
            roles_needed[Roles.Tank] = true;
            roles_needed[Roles.DPS] = true;
            roles_needed[Roles.Looking] = nil;
        end

        if self:Contains(words, 'dpsheal') or self:Contains(words, 'healdps') then
            roles_needed[Roles.Heals] = true;
            roles_needed[Roles.DPS] = true;
            roles_needed[Roles.Looking] = nil;
        end

        for j,dungeon_keyword in ipairs(Instance:GetKeyWords()) do
            if self:Contains(words, dungeon_keyword) then
                if is_heroic then
                    table.insert(final, {
                        Difficulty.Heroic,
                        Instance,
                        roles_needed
                    })
                else
                    table.insert(final, {
                        Difficulty.Normal,
                        Instance,
                        roles_needed
                    })
                end
            else
                --if a keyword match isn't found then try match the entire keyword against the post message IF dungeon_keyword has a space in it
                if(string.match(string.lower(post_msg), string.lower(dungeon_keyword)) and string.match(dungeon_keyword, ' ')) then
                    if is_heroic then
                        table.insert(final, {
                            Difficulty.Heroic,
                            Instance,
                            roles_needed
                        })
                    else
                        table.insert(final, {
                            Difficulty.Normal,
                            Instance,
                            roles_needed
                        })
                    end
                end
            end
        end
    end
    return final;
end

---
--- Function that ticks every 5 seconds and removes posts if they've expired. + can do updates to the UI (5 delay so don't do anything big).
---@return void
function LFM_GroupFinder.TickTimers()
    local posts = LFM_GroupFinder:GetPostsForScrollWindow();
    local post_count = #posts;

    FauxScrollFrame_Update(LFM_GroupFinder_ScrollFrame, post_count, LFM_GroupFinder.PostTable.display_count, LFM_GroupFinder.POST_HEIGHT, nil, nil, nil, nil, nil, nil)

    local btnTitleTime, index;

    for i=1, LFM_GroupFinder.PostTable.display_count, 1 do
        index = i + FauxScrollFrame_GetOffset(LFM_GroupFinder_ScrollFrame);
        btnTitleTime = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."Time"];

        if (index <= post_count and not btnTitleTime.is_header) then
            local Post = posts[index].post;

            if(Post:HasExpired()) then
                LFM_GroupFinder:RemovePost(Post);
            else
                local elapsed = Post:GetElapsedTime();
                btnTitleTime:SetText(elapsed);

                LFM_GroupFinder.PostTable.set_time_color(btnTitleTime, elapsed)
            end
        else
            btnTitleTime:SetText('');
        end
    end

	C_Timer.After(5, LFM_GroupFinder.TickTimers)
end

--- Function that returns any existing Post by a players name
--- note: Instance is also available for checking if player has posted this instance before (if ever needed)
---
--  todo 1. do we need to compare realm and player guid too?
---
---@return void
function LFM_GroupFinder:GetPostForPlayer(playerName, realm, playerGuid, Instance)
    for i,Post in ipairs(self.PostTable.posts) do
        if Post.player.name == playerName then
            return Post;
        end
    end
    return false
end

--- Chat message callback - creating/updating a new post. (used by CHAT_MSG_SYSTEM, CHAT_MSG_CHANNEL, CHAT_MSG_GUILD, CHAT_MSG_OFFICER)
---
---@param msg string
---@param playerName string
---@param guid string
---@return void
function LFM_GroupFinder:OnChat(msg, playerName, guid)
    if not self.isRunning then return false end;

    --limit to one post per player for now,
    --this can be changed to make multiple posts with 1 message, eg "sp and ub" makes 2 posts
    local result = self:CheckPost(msg)[1];

    --if no instance found
    if(result == nil) then return false end;

    local Difficulty = result[1];
    local Instance = result[2];
    local RolesNeeded = result[3];
    local split_name = self:Split(playerName,'-'); --split Name-Realm
    local time = GetServerTime();

    -- Check if this player already has a post, if they do just update their existing post and refresh table
    local existing_post = self:GetPostForPlayer(split_name[1], split_name[2], guid, Instance);

    if(existing_post) then
        existing_post:SetDifficulty(Difficulty);
        existing_post:SetLastTimePosted(time);
        existing_post:SetMessage(msg);
        existing_post:SetRolesNeeded(RolesNeeded);
        existing_post:SetInstance(Instance);

        return LFM_GroupFinder_BigBoyUpdate();
    end
    -- Else they don't have a post
    ---if fixtures or dummy data then generate a random time for the dummy/test post.
    local localizedClass, englishClass;
    if(guid == nil) then englishClass = 'WARRIOR' time = time-math.random(1,60);
    else
        localizedClass, englishClass = GetPlayerInfoByGUID(guid);
    end

    --Get new classes to work with
    local Post = self:GetEntity('Post')
    local Player = self:GetEntity('Player')

    --New Player
    local _Player = Player:New();
    _Player:SetName(split_name[1]);
    _Player:SetRealm(split_name[2]);
    _Player:SetClass(englishClass);
    _Player:SetGuid(guid)

    --New Post
    local _Post = Post:New();
    _Post:SetMessage(msg);
    _Post:SetDifficulty(Difficulty);
    _Post:SetPlayer(_Player);
    _Post:SetLastTimePosted(time);
    _Post:SetRolesNeeded(RolesNeeded);
    _Post:SetInstance(Instance);

    self:AddPost(_Post)
end

--- Main update function you can run if you need the entire table updated. Use sparingly (kinda).
---
---@param self self
---@return void
function LFM_GroupFinder_BigBoyUpdate(self)
    local posts = LFM_GroupFinder:GetPostsForScrollWindow();
    local Roles = LFM_GroupFinder:GetModel('RoleType');
    local post_count = #posts;

    --Get the num of posts we can display in the height of our window (minus 5 to account for the graphic space on top and bottom)
    LFM_GroupFinder.PostTable.display_count = math.floor((LFM_GroupFinder_Frame:GetHeight() / LFM_GroupFinder.POST_HEIGHT)+0.5) -5;

    --Stop display count exceeding max amount of posts
    if(LFM_GroupFinder.PostTable.display_count > LFM_GroupFinder.PostTable.max_display_count) then
        LFM_GroupFinder.PostTable.display_count = LFM_GroupFinder.PostTable.max_display_count;
    end

    --Hide every list item before update todo: can be better or not done at all?
    for i=1, LFM_GroupFinder.PostTable.max_display_count, 1 do
        if(i > LFM_GroupFinder.PostTable.display_count) then
            _G["LFM_GroupFinder_ScrollFrameChildTitle"..i]:Hide();
        end
    end

    --Set our scroll frame size (in case window has been re-sized)
    LFM_GroupFinder_ScrollFrame:SetWidth(LFM_GroupFinder_Frame:GetWidth());
    LFM_GroupFinder_ScrollFrame:SetHeight(LFM_GroupFinder_Frame:GetHeight() - 95);

    --Update the scroll frame faux data (in case window has been re-sized)
    FauxScrollFrame_Update(LFM_GroupFinder_ScrollFrame, post_count, LFM_GroupFinder.PostTable.display_count, LFM_GroupFinder.POST_HEIGHT, nil, nil, nil, nil, 0, 0 )

    local btnTitle,
    btnTitleTag,
    btnTitleNumGroupMates,
    btnTitleRole1,
    btnTitleRole2,
    btnTitleRole3,
    btnTitleRole4,
    btnTitleNormalText,
    btnTitleHighlight,
    btnTitlePlayerName,
    btnTitleTime,
    index;

    --Loop over the amount of posts we can theoretically display
    for i=1, LFM_GroupFinder.PostTable.display_count, 1 do
        index = i + FauxScrollFrame_GetOffset(LFM_GroupFinder_ScrollFrame);

        btnTitle = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i];
        btnTitleTag = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."Tag"];
		btnTitleNumGroupMates = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."GroupMates"];
		btnTitleRole1 = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."Role1"];
        btnTitleRole2 = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."Role2"];
        btnTitleRole3 = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."Role3"];
        btnTitleRole4 = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."Role4"];
		btnTitleNormalText = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."NormalText"];
		btnTitleHighlight = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."Highlight"];
        btnTitlePlayerName = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."PlayerName"];
        btnTitleTime = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."Time"];
        btnTitle.is_header = false;

        --If we have a post to display
        if (index <= post_count) then
            local Post = posts[index].post;
            local is_header = posts[index].is_header
            local post_guid = Post:GetGuid();
            local is_raid = Post:GetInstance():IsRaid();
            local is_heroic = Post:IsHeroic();
            btnTitle.is_collapsed = LFM_GroupFinder.Data.CollapsedStates[post_guid] == true;
            btnTitle:SetWidth(LFM_GroupFinder_Frame:GetWidth());

            LFM_GroupFinder_ScrollFrame:SetWidth(LFM_GroupFinder_Frame:GetWidth() - 38);
            btnTitlePlayerName:SetPoint("LEFT", btnTitle, "LEFT", LFM_GroupFinder_Frame:GetWidth()-170, 0)
            btnTitleTag:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
            btnTitleTag:SetText('')
            btnTitleNormalText:SetTextColor(1, 0.8, 0)
            btnTitlePlayerName:SetFont(btnTitleNormalText:GetFont(), 9)
            btnTitlePlayerName:SetText("")
            btnTitleRole1:Hide();
            btnTitleRole2:Hide();
            btnTitleRole3:Hide();
            btnTitleRole4:Hide();

            btnTitleTime:SetText(Post:GetElapsedTime())
            btnTitlePlayerName:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);

            if(is_header) then
                if(btnTitle.is_collapsed) then
                    btnTitle:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
                    btnTitleTime:Show();
                    --btnTitleTime:SetText(Post:GetElapsedTime());
                else
                    btnTitleTime:Hide();
                    btnTitle:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
                end

                btnTitle:Show();
                btnTitle:SetText(Post:GetInstance(Post:GetDifficulty()):GetDescription());
                btnTitleHighlight:SetTexture("Interface\\Buttons\\UI-PlusButton-Hilight");
                btnTitleNormalText:SetPoint("LEFT", btnTitle, "LEFT", 20, 0);
                btnTitleNormalText:SetWidth(0);
            else
                if(btnTitle.is_collapsed) then
                    btnTitle:Hide()
                end

                local class_color = RAID_CLASS_COLORS[Post:GetPlayer():GetClass()];
                local msg = Post:GetMessage();

                --*SUPER HACK* - ty blizz <3
                QuestLogDummyText:SetText("  "..msg);
                btnTitle:SetText(msg);
                btnTitle:SetNormalTexture("");
                btnTitleNormalText:SetTextColor(0.9, 0.9, 0.9);
                btnTitleHighlight:SetTexture("");
                btnTitlePlayerName:SetFont(btnTitleNormalText:GetFont(), 11)
                btnTitlePlayerName:SetText(Post:GetPlayer():GetName())
                btnTitlePlayerName:SetTextColor(class_color.r, class_color.g, class_color.b);
                btnTitleNormalText:SetPoint("LEFT", btnTitle, "LEFT", 20, 0);
                btnTitleTime:Show()
                btnTitleNormalText:SetWidth(0);
                btnTitleTag:SetText(Post:GetDifficultyTag());

                LFM_GroupFinder.PostTable.set_time_color(btnTitleTime, Post:GetElapsedTime())
                LFM_GroupFinder.PostTable.set_msg_length(btnTitleNormalText, Post:GetRolesNeededCount())
                LFM_GroupFinder.PostTable.set_difficulty_tag(btnTitleTag, is_raid, is_heroic)

                --role icons
                local n = 1;
                for role_ref in pairs(Post:GetRolesNeeded()) do
                    local btnTitleRole = _G["LFM_GroupFinder_ScrollFrameChildTitle"..i.."Role" ..n];
                    btnTitleRole:SetTexture(Roles:GetIconFile(role_ref))
                    btnTitleRole:Show();
                    btnTitleRole:SetPoint("LEFT", btnTitle, "LEFT", 14*n+6, 0);
                    btnTitleNormalText:SetPoint("LEFT", btnTitle, "LEFT", 14*(n+1)+6, 0);
                n = n+1;
                end
            end
            btnTitle:Show();
            btnTitle.is_header = is_header;
            btnTitle.Post = Post;
        else
            --We don't have a Post to display - hide if it's not a header
            if not btnTitle.is_header then
                btnTitle:Hide()
            end
        end
    end
end


--- Just an init function for init things (only runs once)
---
---@return void
function LFM_GroupFinder:Run()
    LFM_GroupFinder_Frame:RegisterEvent("CHAT_MSG_SYSTEM");
	LFM_GroupFinder_Frame:RegisterEvent("CHAT_MSG_CHANNEL");
	LFM_GroupFinder_Frame:RegisterEvent("CHAT_MSG_GUILD");
	LFM_GroupFinder_Frame:RegisterEvent("CHAT_MSG_OFFICER");

    LFM_GroupFinder_Frame:ClearAllPoints();
    LFM_GroupFinder_Frame:SetResizable(true)
    LFM_GroupFinder_Frame:SetMinResize(320, 304)
    LFM_GroupFinder_Frame:SetMaxResize(600, 460)

    local resizeHandle = CreateFrame("Button", nil, LFM_GroupFinder_Frame)
    resizeHandle:SetPoint("BOTTOMRIGHT", -6, 7)
    resizeHandle:SetSize(16, 16)
    resizeHandle:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizeHandle:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    resizeHandle:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")

    resizeHandle:SetScript("OnMouseDown", function()
        LFM_GroupFinder_Frame:StartSizing("BOTTOMRIGHT")
        LFM_GroupFinder_ScrollFrame:Hide()
    end)
    resizeHandle:SetScript("OnMouseUp", function()
        LFM_GroupFinder_Frame:StopMovingOrSizing()
        LFM_GroupFinder_ScrollFrame:Show()
        LFM_GroupFinder_BigBoyUpdate()
    end)

    LFM_GroupFinder_ShowNormalLabel:SetFont(LFM_GroupFinder_ShowNormalLabel:GetFont(), 9, nil)
    LFM_GroupFinder_ShowHeroicLabel:SetFont(LFM_GroupFinder_ShowNormalLabel:GetFont());
    LFM_GroupFinder_ShowRaidLabel:SetFont(LFM_GroupFinder_ShowNormalLabel:GetFont());

    LFM_GroupFinder_ShowNormal:SetChecked(self.PostTable.show_normal)
    LFM_GroupFinder_ShowHeroic:SetChecked(self.PostTable.show_heroic)
    LFM_GroupFinder_ShowRaid:SetChecked(self.PostTable.show_raid)

    function LFM_GroupFinder_Frame:CHAT_MSG_SYSTEM(msg, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid)
        LFM_GroupFinder:OnChat(msg, playerName, guid);
    end
    function LFM_GroupFinder_Frame:CHAT_MSG_CHANNEL(msg, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid)
        LFM_GroupFinder:OnChat(msg, playerName, guid);
    end
    function LFM_GroupFinder_Frame:CHAT_MSG_GUILD(msg, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid)
        LFM_GroupFinder:OnChat(msg, playerName, guid);
    end
    function LFM_GroupFinder_Frame:CHAT_MSG_OFFICER(msg, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid)
        LFM_GroupFinder:OnChat(msg, playerName, guid);
    end

    local function DispatchEvent(self, event, ...)
        local handlerMethod = self[event]
        handlerMethod(self, ...)
    end



	LFM_GroupFinder.MinimapButton.Init(LFM_GroupFinder.Database, "Interface\\ICONS\\ability_townwatch", function(self, button) --onclick
        if button== "LeftButton" then
            if LFM_GroupFinder_Frame:IsVisible() then
                LFM_GroupFinder_Frame:Hide();
            else
                LFM_GroupFinder_Frame:Show();
            end
        else

        end
    end)

    LFM_GroupFinder_Frame:SetScript("OnEvent", DispatchEvent);
    --LFM_GroupFinder_Frame:Show();
    self:TickTimers();
end
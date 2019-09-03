local font_main = draw.CreateFont("Tahoma Bold", 20, 20)
local font_main_small = draw.CreateFont("Tahoma Bold", 13, 13)

-- Script --------
local cur_scriptname = GetScriptName()
local cur_version = "1.2"
local git_version = "https://raw.githubusercontent.com/itisluiz/aimware_quickpeek/master/version.txt"
local git_repository = "https://raw.githubusercontent.com/itisluiz/aimware_quickpeek/master/quickpeek.lua"
------------------

-- UI Elements --
local ref_vis_msc_assistance = gui.Reference("VISUALS", "MISC", "Assistance")

local ref_rbot_shared = gui.Reference("RAGE", "WEAPON", "SHARED", "Accuracy")
local ref_rbot_pistol = gui.Reference("RAGE", "WEAPON", "PISTOL", "Accuracy")
local ref_rbot_revolver = gui.Reference("RAGE", "WEAPON", "REVOLVER", "Accuracy")
local ref_rbot_smg = gui.Reference("RAGE", "WEAPON", "SMG", "Accuracy")
local ref_rbot_rifle = gui.Reference("RAGE", "WEAPON", "RIFLE", "Accuracy")
local ref_rbot_shotgun = gui.Reference("RAGE", "WEAPON", "SHOTGUN", "Accuracy")
local ref_rbot_scout = gui.Reference("RAGE", "WEAPON", "SCOUT", "Accuracy")
local ref_rbot_autosniper = gui.Reference("RAGE", "WEAPON", "A. SNIPER", "Accuracy")
local ref_rbot_sniper = gui.Reference("RAGE", "WEAPON", "SNIPER", "Accuracy")
local ref_rbot_lmg = gui.Reference("RAGE", "WEAPON", "LMG", "Accuracy")

local cob_quickpeek_indicator = gui.Combobox(ref_vis_msc_assistance, "msc_quickpeek_indicator", "Quick Peek Indication", "Off", "On World", "On HUD", "On Both")
local cob_quickpeek_indicator_detail = gui.Combobox(ref_vis_msc_assistance, "msc_quickpeek_indicator", "Quick Peek Indication Style", "Fancy", "Simplified")

local key_shared_quickpeek = gui.Keybox(ref_rbot_shared, "rbot_shared_quickpeek_key", "Quick Peek Key", 0)
local sl_shared_quickpeek_returnaftershots = gui.Slider(ref_rbot_shared, "rbot_shared_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 15 )
local chb_shared_quickpeek_knife = gui.Checkbox(ref_rbot_shared, "rbot_shared_quickpeek_knife", "Quick Peek Switch to Knife", 1)

local key_pistol_quickpeek = gui.Keybox(ref_rbot_pistol, "rbot_pistol_quickpeek_key", "Quick Peek Key", 0)
local sl_pistol_quickpeek_returnaftershots = gui.Slider(ref_rbot_pistol, "rbot_pistol_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 15 )
local chb_pistol_quickpeek_knife = gui.Checkbox(ref_rbot_pistol, "rbot_pistol_quickpeek_knife", "Quick Peek Switch to Knife", 1)

local key_revolver_quickpeek = gui.Keybox(ref_rbot_revolver, "rbot_revolver_quickpeek_key", "Quick Peek Key", 0)
local sl_revolver_quickpeek_returnaftershots = gui.Slider(ref_rbot_revolver, "rbot_revolver_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 8 )
local chb_revolver_quickpeek_knife = gui.Checkbox(ref_rbot_revolver, "rbot_revolver_quickpeek_knife", "Quick Peek Switch to Knife", 1)

local key_smg_quickpeek = gui.Keybox(ref_rbot_smg, "rbot_smg_quickpeek_key", "Quick Peek Key", 0)
local sl_smg_quickpeek_returnaftershots = gui.Slider(ref_rbot_smg, "rbot_smg_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 15 )
local chb_smg_quickpeek_knife = gui.Checkbox(ref_rbot_smg, "rbot_smg_quickpeek_knife", "Quick Peek Switch to Knife", 1)

local key_rifle_quickpeek = gui.Keybox(ref_rbot_rifle, "rbot_rifle_quickpeek_key", "Quick Peek Key", 0)
local sl_rifle_quickpeek_returnaftershots = gui.Slider(ref_rbot_rifle, "rbot_rifle_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 15 )
local chb_rifle_quickpeek_knife = gui.Checkbox(ref_rbot_rifle, "rbot_rifle_quickpeek_knife", "Quick Peek Switch to Knife", 1)

local key_shotgun_quickpeek = gui.Keybox(ref_rbot_shotgun, "rbot_shotgun_quickpeek_key", "Quick Peek Key", 0)
local sl_shotgun_quickpeek_returnaftershots = gui.Slider(ref_rbot_shotgun, "rbot_shotgun_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 8 )
local chb_shotgun_quickpeek_knife = gui.Checkbox(ref_rbot_shotgun, "rbot_shotgun_quickpeek_knife", "Quick Peek Switch to Knife", 1)

local key_scout_quickpeek = gui.Keybox(ref_rbot_scout, "rbot_scout_quickpeek_key", "Quick Peek Key", 0)
local sl_scout_quickpeek_returnaftershots = gui.Slider(ref_rbot_scout, "rbot_scout_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 10 )
local chb_scout_quickpeek_knife = gui.Checkbox(ref_rbot_scout, "rbot_scout_quickpeek_knife", "Quick Peek Switch to Knife", 1)

local key_autosniper_quickpeek = gui.Keybox(ref_rbot_autosniper, "rbot_autosniper_quickpeek_key", "Quick Peek Key", 0)
local sl_autosniper_quickpeek_returnaftershots = gui.Slider(ref_rbot_autosniper, "rbot_autosniper_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 15 )
local chb_autosniper_quickpeek_knife = gui.Checkbox(ref_rbot_autosniper, "rbot_autosniper_quickpeek_knife", "Quick Peek Switch to Knife", 1)

local key_sniper_quickpeek = gui.Keybox(ref_rbot_sniper, "rbot_sniper_quickpeek_key", "Quick Peek Key", 0)
local sl_sniper_quickpeek_returnaftershots = gui.Slider(ref_rbot_sniper, "rbot_sniper_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 10 )
local chb_sniper_quickpeek_knife = gui.Checkbox(ref_rbot_sniper, "rbot_sniper_quickpeek_knife", "Quick Peek Switch to Knife", 1)

local key_lmg_quickpeek = gui.Keybox(ref_rbot_lmg, "rbot_lmg_quickpeek_key", "Quick Peek Key", 0)
local sl_lmg_quickpeek_returnaftershots = gui.Slider(ref_rbot_lmg, "rbot_lmg_quickpeek_returnaftershots", "Return After X Shots", 1, 1, 10 )
local chb_lmg_quickpeek_knife = gui.Checkbox(ref_rbot_lmg, "rbot_lmg_quickpeek_knife", "Quick Peek Switch to Knife", 1)
-----------------

-- Check for updates
local function git_update()
	if cur_version ~= http.Get(git_version) then
		local this_script = file.Open(cur_scriptname, "w")
		this_script:Write(http.Get(git_repository))
		this_script:Close()
		print("[Lua Scripting] " .. cur_scriptname .. " has updated itself from version " .. cur_version .. " to " .. http.Get(git_version))
		print("[Lua Scripting] Please reload " .. cur_scriptname)
	else
		print("[Lua Scripting] " .. cur_scriptname .. " is up-to-date")
	end
end

local function drawCircle(Position, Radius)

    for degrees = 1, 360, 1 do
        local thisPoint = nil;
        local lastPoint = nil;
                
        if Position[3] == nil then
            thisPoint = {Position[1] + math.sin(math.rad(degrees)) * Radius, Position[2] + math.cos(math.rad(degrees)) * Radius};	
            lastPoint = {Position[1] + math.sin(math.rad(degrees - 1)) * Radius, Position[2] + math.cos(math.rad(degrees - 1)) * Radius};
        else
            thisPoint = {client.WorldToScreen(Position[1] + math.sin(math.rad(degrees)) * Radius, Position[2] + math.cos(math.rad(degrees)) * Radius, Position[3])};
            lastPoint = {client.WorldToScreen(Position[1] + math.sin(math.rad(degrees - 1)) * Radius, Position[2] + math.cos(math.rad(degrees - 1)) * Radius, Position[3])};
        end
                     
        if thisPoint[1] ~= nil and thisPoint[2] ~= nil and lastPoint[1] ~= nil and lastPoint[2] ~= nil then		
            draw.Line(thisPoint[1], thisPoint[2], lastPoint[1], lastPoint[2]);		
        end
        
    end

end

local function ActiveWeaponInfo(Entity)
    
    local ent_weapon = Entity:GetPropEntity("m_hActiveWeapon")

    if ent_weapon == nil then
        return nil
    end

    local str_weapon = ent_weapon:GetName()

    if string.find(str_weapon, "revolver") then
        return "revolver", 2 
    end
    if string.find(str_weapon, "ssg08") then
        return "scout", 1 
    end
    if string.find(str_weapon, "awp") then
        return "sniper", 1 
    end
    if string.find(str_weapon, "scar20") or string.find(str_weapon, "g3sg1") then
        return "autosniper", 1 
    end

    local type_weapon = Entity:GetWeaponType()

    if type_weapon == 0 then
        return nil
    end

    if type_weapon == 1 then
        return "pistol", 2
    end
    if type_weapon == 2 then
        return "smg", 1
    end
    if type_weapon == 3 then
        return "rifle", 1
    end
    if type_weapon == 4 then
        return "shotgun", 1
    end
	if type_weapon == 6 then
        return "lmg", 1
    end

    return nil
end

-- Global Variables ---
local msc_peekReturning = false
local msc_quickPeeking = false
local msc_peekCompleted = false

local start_ammo = 0
local cur_ammo = 0

local pos_peekOrigin = {}
local wpninfo_peek = nil
local startwpn_peek = nil
local curwpn_peek = nil

local cacheArray = 
{
    {"autostop", 0},
    {"autostop_key", 0}
}
-----------------------

local function ResetPeek()
    if msc_quickPeeking or msc_peekReturning or msc_peekCompleted then
        msc_quickPeeking = false
        msc_peekReturning = false
        msc_peekCompleted = false
        cur_ammo = 0
        start_ammo = 0

        for i = 1, #cacheArray do
            gui.SetValue("rbot_" .. wpninfo_peek[1] .. "_" .. cacheArray[i][1], cacheArray[i][2])
        end

        wpninfo_peek = nil
        startwpn_peek = nil
    end
end

local function DrawingCallback()
   
    local LocalPlayer = entities.GetLocalPlayer()
    
    -- Local player null and alive check
    if LocalPlayer == nil or not LocalPlayer:IsAlive() then
        ResetPeek()
        return
    end

    local pos_LocalPlayer = {LocalPlayer:GetAbsOrigin()}

    -- If weapon isn't a knife
    if LocalPlayer:GetWeaponType() ~= 0 then
        wpninfo_peek = {ActiveWeaponInfo(LocalPlayer)}
        curwpn_peek = LocalPlayer:GetWeaponID()
    end

    -- Check if array is null
    if wpninfo_peek == nil then
        return
    end

    -- Check if weapon is null
    if wpninfo_peek[1] == nil then
        return
    end

    -- If shared weapon configuration
    if gui.GetValue("rbot_sharedweaponcfg") then
        wpninfo_peek[1] = "shared"
    end

    -- Round Sliders
    if gui.GetValue("rbot_" .. wpninfo_peek[1] .. "_quickpeek_returnaftershots") % 1 > 0 then
        gui.SetValue("rbot_" .. wpninfo_peek[1] .. "_quickpeek_returnaftershots", math.floor(gui.GetValue("rbot_" .. wpninfo_peek[1] .. "_quickpeek_returnaftershots") + 0.5))
    end

    -- Check if key is set
    if gui.GetValue("rbot_" .. wpninfo_peek[1] .. "_quickpeek_key") == nil or gui.GetValue("rbot_" .. wpninfo_peek[1] .. "_quickpeek_key") <= 0 then
        return
    end

    if input.IsButtonDown(gui.GetValue("rbot_" .. wpninfo_peek[1] .. "_quickpeek_key")) and (startwpn_peek == curwpn_peek or startwpn_peek == nil) and start_ammo >= cur_ammo then
        if LocalPlayer:GetWeaponType() ~= 0 then
            cur_ammo = LocalPlayer:GetPropEntity("m_hActiveWeapon"):GetPropInt("m_iClip1")
        end

        if not msc_quickPeeking and LocalPlayer:GetWeaponType() ~= 0 then      
            
            msc_quickPeeking = true
            startwpn_peek = curwpn_peek  
            start_ammo = cur_ammo
            pos_peekOrigin = pos_LocalPlayer

            for i = 1, #cacheArray do
                cacheArray[i][2] = gui.GetValue("rbot_" .. wpninfo_peek[1] .. "_" .. cacheArray[i][1])
            end

            gui.SetValue("rbot_" .. wpninfo_peek[1] .. "_" .. cacheArray[1][1], 1)
            gui.SetValue("rbot_" .. wpninfo_peek[1] .. "_" .. cacheArray[2][1], 0)
        elseif not msc_quickPeeking and LocalPlayer:GetWeaponType() == 0 then
            return
        end

        if msc_peekCompleted then
            msc_peekCompleted = false
            start_ammo = cur_ammo
            
            if gui.GetValue("rbot_" .. wpninfo_peek[1] .. "_quickpeek_knife") then
                client.Command("slot" .. wpninfo_peek[2], true)
            end
        end

        if cur_ammo + gui.GetValue("rbot_" .. wpninfo_peek[1] .. "_quickpeek_returnaftershots") <= start_ammo and not msc_peekReturning then
            msc_peekReturning = true

            if gui.GetValue("rbot_" .. wpninfo_peek[1] .. "_quickpeek_knife") then
                client.Command("slot3", true)
            end
        end
        
        local world_forward = {vector.Subtract( pos_peekOrigin,  pos_LocalPlayer )}
        local world_angles = {vector.Angles(world_forward)}
        
        local world_linestart = {pos_peekOrigin[1] - 9 * math.cos(math.rad(world_angles[2])), pos_peekOrigin[2] - 9 * math.sin(math.rad(world_angles[2])), pos_peekOrigin[3]}
        local world_lineend = {pos_LocalPlayer[1] + 5 * math.cos(math.rad(world_angles[2])), pos_LocalPlayer[2] + 5 * math.sin(math.rad(world_angles[2])), pos_LocalPlayer[3]}
        
        local wts_peekOrigin = {client.WorldToScreen(pos_peekOrigin[1], pos_peekOrigin[2], pos_peekOrigin[3])}
        local wts_peekOriginText = {client.WorldToScreen(pos_peekOrigin[1], pos_peekOrigin[2], pos_peekOrigin[3] + 20)}
        local wts_LocalPlayer = {client.WorldToScreen(pos_LocalPlayer[1], pos_LocalPlayer[2], pos_LocalPlayer[3])}

        local peek_distance = math.floor(vector.Distance(pos_peekOrigin, pos_LocalPlayer) + 0.5)
        local str_Indicator = "Quick Peeking: " .. peek_distance .. " units"
        local size_strIndicator
        
        if msc_peekReturning then
            str_Indicator = "Quick Returning: " .. peek_distance .. " units"
        end

        if (cob_quickpeek_indicator:GetValue() == 1 or cob_quickpeek_indicator:GetValue() == 3) and (wts_peekOrigin[1] ~= nil and wts_peekOriginText[1] ~= nil and wts_LocalPlayer[1] ~= nil) then
            draw.SetFont(font_main_small)
            size_strIndicator = {draw.GetTextSize(str_Indicator)}
            draw.Color(gui.GetValue("clr_gui_window_header_tab2"))
            if cob_quickpeek_indicator_detail:GetValue() == 0 then
                drawCircle(pos_peekOrigin, 10)
                drawCircle(pos_peekOrigin, 8)
                drawCircle(pos_LocalPlayer, 6)
                drawCircle(pos_LocalPlayer, 4)
                draw.Color(255, 255, 255, 255)
                drawCircle(pos_peekOrigin, 9)
                drawCircle(pos_LocalPlayer, 5)
            end
            draw.Color(255, 255, 255, 255)
            draw.TextShadow(wts_peekOriginText[1] - size_strIndicator[1] / 2, wts_peekOriginText[2], str_Indicator)

            local wts_linestart = {client.WorldToScreen(world_linestart[1], world_linestart[2], world_linestart[3])}
            local wts_lineend = {client.WorldToScreen(world_lineend[1], world_lineend[2], world_lineend[3])}

            if msc_peekReturning then
                draw.Color(gui.GetValue("clr_gui_window_header_tab2"))
            else
                draw.Color(255, 255, 255, 255)
            end

            if wts_linestart[1] ~= nil and wts_lineend[1] ~= nil and peek_distance > 15 then
                draw.Line(wts_linestart[1], wts_linestart[2], wts_lineend[1], wts_lineend[2])
            end

        end

        if cob_quickpeek_indicator:GetValue() >= 2 then
            local width_screen, height_screen = draw.GetScreenSize()
            draw.SetFont(font_main)
            size_strIndicator = {draw.GetTextSize(str_Indicator)}
            
            if cob_quickpeek_indicator_detail:GetValue() == 0 then
                draw.Color(0, 0, 0, 125)
                draw.FilledRect( width_screen / 2  - size_strIndicator[1] / 2, height_screen * 0.95 - size_strIndicator[2] / 2, width_screen / 2 + size_strIndicator[1] / 2, height_screen * 0.95 + size_strIndicator[2] / 2 ) 
                draw.Color(gui.GetValue("clr_gui_window_header_tab2"))
                draw.Line(width_screen / 2  - size_strIndicator[1] / 2, height_screen * 0.95 - size_strIndicator[2] / 2, width_screen / 2 + size_strIndicator[1] / 2, height_screen * 0.95 - size_strIndicator[2] / 2)
            end
            
            draw.Color(255, 255, 255, 255)
            draw.Text(width_screen / 2 - size_strIndicator[1] / 2, height_screen * 0.95 - size_strIndicator[2] / 2, str_Indicator)
        end
    
    else
        ResetPeek()
    end

end

local function CreateMoveCallback(UserCmd)

    if msc_peekReturning then
        local LocalPlayer = entities.GetLocalPlayer()    
        local ang_LocalPlayer = {UserCmd:GetViewAngles()}
        local world_forward = {vector.Subtract( pos_peekOrigin,  {LocalPlayer:GetAbsOrigin()} )}

        UserCmd:SetForwardMove( ( (math.sin(math.rad(ang_LocalPlayer[2]) ) * world_forward[2]) + (math.cos(math.rad(ang_LocalPlayer[2]) ) * world_forward[1]) ) * 200 )
        UserCmd:SetSideMove( ( (math.cos(math.rad(ang_LocalPlayer[2]) ) * -world_forward[2]) + (math.sin(math.rad(ang_LocalPlayer[2]) ) * world_forward[1]) ) * 200 )
        
        if vector.Length(world_forward) < 10 then
            msc_peekReturning = false
            msc_peekCompleted = true
        end
    end

end

if gui.GetValue("lua_allow_http") and gui.GetValue("lua_allow_cfg") then
	git_update()
else
	print("[Lua Scripting] Please enable Lua HTTP and Lua script/config editing to check for updates")
end

callbacks.Register("Draw", DrawingCallback)
callbacks.Register("CreateMove", CreateMoveCallback)
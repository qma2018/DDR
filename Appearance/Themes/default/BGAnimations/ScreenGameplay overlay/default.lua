local t = Def.ActorFrame{}
local showIntro = {
	["be-mu"] = true,
	["po-mu"] = true
}

local gm = GAMESTATE:GetCurrentGame():GetName()
t[#t+1] = LoadActor( FILEMAN:DoesFileExist( THEME:GetCurrentThemeDirectory().."BGAnimations/ScreenGameplay overlay/"..gm ..".lua" ) and gm or "Normal" )

local Style = GAMESTATE:GetCurrentStyle()
for ip, pn in ipairs(GAMESTATE:GetEnabledPlayers()) do
	if not GAMESTATE:IsDemonstration() and LoadModule("Config.Load.lua")("StatsPane",CheckIfUserOrMachineProfile(string.sub(pn,-1)-1).."/OutFoxPrefs.ini") then
		local choice = tonumber( LoadModule("Config.Load.lua")("StatsPane",CheckIfUserOrMachineProfile(string.sub(pn,-1)-1).."/OutFoxPrefs.ini")) or 1
		local touse = {
			[1] = "StatDisplay",
			[2] = (Style:GetStyleType() ~= "StyleType_OnePlayerTwoSides" and Style:GetName() ~= "solo" and Style:ColumnsPerPlayer() < 7 and
			GAMESTATE:GetNumPlayersEnabled() == 1 and (not PREFSMAN:GetPreference("Center1Player")) and "DetailedStats" or "StatDisplay") or "StatDisplay"
		}
		if choice > 0 and choice <= #touse then
			t[#t+1] = LoadActor(touse[choice],pn)
		end
	end
end

-- Shorten the stage transition if we're restarting the song from pause menu
t[#t+1] = Def.Actor {
	OnCommand=function(self)
		setenv("CurrentlyInSong",true)
	end
}

-- Usually this happens on ScreenStage but we don't do that anymore.
if showIntro[gm] ~= true then 
	t[#t+1]=LoadActor("Intro")
end
	
-- BPM display
if LoadModule("Config.Load.lua")("GameplayBPM","Save/OutFoxPrefs.ini") then
	t[#t+1] = LoadActor("bpmDisplay.lua")
end


return t

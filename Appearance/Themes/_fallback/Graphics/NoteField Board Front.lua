local sPlayer = Var "Player"

local function GetTexture()
	if GAMESTATE:IsDemonstration() then
		return LoadModule("Options.BackPlates.lua")()[LoadModule("Options.ChoiceToValue.lua")(LoadModule("Options.BackPlates.lua")("Show"),THEME:GetMetric("Common","DefaultBackPlate"))] 
	end
	return LoadModule("Options.BackPlates.lua")()[LoadModule("Options.ChoiceToValue.lua")(LoadModule("Options.BackPlates.lua")("Show"),LoadModule("Config.Load.lua")("BackPlates",CheckIfUserOrMachineProfile(string.sub(sPlayer,-1)-1).."/OutFoxPrefs.ini") or THEME:GetMetric("Common","DefaultBackPlate"))] 
end

return Def.Sprite {
	InitCommand=function(self)
		local tex = GetTexture()
		if not tex then
			tex = THEME:GetPathG("","_blank")
		end
		self:Load(tex,"(stretch)")
	end
}

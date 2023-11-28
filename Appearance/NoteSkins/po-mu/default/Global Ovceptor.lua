local Button = Var "Button";
local sPlayer = Var "Player"
local Reverse = GAMESTATE:GetPlayerState(sPlayer):GetPlayerOptions("ModsLevel_Preferred"):Reverse() == 1

local Buttons = {
	["Left White"] = "White",
	["Left Yellow"] = "Yellow",
	["Left Green"] = "Green",
	["Left Blue"] = "Blue",
	["Red"] = "Red",
	["Right Blue"] = "Blue",
	["Right Green"] = "Green",
	["Right Yellow"] = "Yellow",
	["Right White"] = "White"
}

local glyphY = {
	["White"] = 25,
	["Green"] = 25,
	["Red"] = 25,
	["Blue"] = 20,
	["Yellow"] = 20,
}

return Def.ActorFrame {
    Def.Sprite {
		Texture=NOTESKIN:GetPath("buttonglyph", Buttons[Button] ),
		InitCommand=function(self)
			self:y(glyphY[Buttons[Button]]):diffusealpha(0.75):zoom(0.20)
		end
	}
}
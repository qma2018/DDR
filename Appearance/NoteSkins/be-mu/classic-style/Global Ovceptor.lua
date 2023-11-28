local Button = Var "Button";

local Buttons = {
	["Key1"] = "White",
	["Key2"] = "Blue",
	["Key3"] = "White",
	["Key4"] = "Blue",
	["Key5"] = "White",
	["Key6"] = "Blue",
	["Key7"] = "White",
	["scratch"] = "Red",
	["Foot"] = "Foot"
}
local glyphY = {
	["White"] = 30,
	["Blue"] = 10,
	["Red"] = 42,
	["Foot"] = 10
}

return Def.ActorFrame {
    Def.Sprite {
		Texture=NOTESKIN:GetPath( Buttons[Button], "ReceptorGlyph" ),
		InitCommand=function(self)
			if Buttons[Button] ~= "Red" then 
				self:vertalign(top) 
			else
				self:spin():effectmagnitude(0,0,200)
			end
			self:y(glyphY[Buttons[Button]]):diffusealpha(1)
		end,
		ScratchdownCommand=function(self) 
			if Buttons[Button] == "Red" then
				self:spin():effectmagnitude(0,0,400)
			end
		end,
		ScratchupCommand=function(self) 
			if Buttons[Button] == "Red" then
				self:spin():effectmagnitude(0,0,-400)
			end
		end,
		LiftCommand=function(self) 
			if Buttons[Button] == "Red" then
				self:spin():effectmagnitude(0,0,200)
			end
		end,
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( Buttons[Button], "ReceptorGlow" ),
		InitCommand=function(self)
			if Buttons[Button] ~= "Red" then self:vertalign(top) end
			self:y(glyphY[Buttons[Button]]):diffusealpha(0):blend('add')
		end,
		PressCommand=function(self) 
			if Buttons[Button] ~= "Red" then 
				self:stoptweening():diffusealpha(1) 
			end
		end,
		LiftCommand=function(self) 
			if Buttons[Button] ~= "Red" then 
				self:diffusealpha(0) 
			end
		end
	}
}
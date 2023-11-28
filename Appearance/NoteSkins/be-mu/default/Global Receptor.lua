local Button = Var "Button";

local sPlayer = Var "Player"

local Reverse = GAMESTATE:GetPlayerState(sPlayer):GetPlayerOptions("ModsLevel_Preferred"):Reverse() == 1
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

local ColumnPos = {
	["Key1"] = 19,
	["Key2"] = 15,
	["Key3"] = 19,
	["Key4"] = 15,
	["Key5"] = 19,
	["Key6"] = 15,
	["Key7"] = 19,
	["scratch"] = 32,
	["Foot"] = 19
}

return Def.ActorFrame {
	OnCommand=function(self)
		self:zoomy(Reverse and -1 or 1)
	end,
	Def.Sprite {
		Texture="_Global Note Flash Center (res 1x60).png",
		OnCommand=function(self)
			self:valign(1):y(6):zoomy(.5):zoomx(ColumnPos[Button]*2):diffuseramp():effectcolor1(1,1,1,.02):effectcolor2(1,1,1,1):effectclock("beat")
		end	
	},
	Def.Sprite {
	Texture="_Global Receptor (res 1x12).png",
	OnCommand=function(self)
		self:zoomx(ColumnPos[Button]*2)
	end
	},
	Def.ActorFrame{
		OnCommand=function(self) self:diffusealpha(0):zoomy(5):y(6) end,
		PressCommand=function(self) self:stoptweening():diffusealpha(.6) end,
		LiftCommand=function(self) self:linear(.15):diffusealpha(0) end,
		Def.Sprite {
		Texture="_Global Note Flash Side (res 2x60).png",
		OnCommand=function(self)
			self:valign(1):x(-ColumnPos[Button])
		end	
		},
		Def.Sprite {
		Texture="_Global Note Flash Side (res 2x60).png",
		OnCommand=function(self)
			self:valign(1):zoomx(-1):x(ColumnPos[Button])
		end	
		},
		Def.Sprite {
		Texture="_Global Note Flash Center (res 1x60).png",
		OnCommand=function(self)
			self:valign(1):zoomx(ColumnPos[Button]*2)
		end	
		}
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( Buttons[Button], "ReceptorGlyph" ),
		InitCommand=function(self)
			self:vertalign(top):y(Buttons[Button] == "White" and 16 or 10):diffusealpha(0.75)
		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( Buttons[Button], "ReceptorGlow" ),
		InitCommand=function(self)
			self:vertalign(top):y(Buttons[Button] == "White" and 16 or 10):diffusealpha(0):blend('add')
		end,
		PressCommand=function(self) self:stoptweening():diffusealpha(1) end,
		LiftCommand=function(self) self:linear(.05):diffusealpha(0) end
	}
}
local sButton = Var "Button"
local sGameButton = INPUTFILTER:GameButtonToKeyMapped(Var "GameButton", Var "Player")
sGameButton = string.gsub(sGameButton, "Key", "")

local Buttons = {}

if not PREFSMAN:GetPreference("UseOldJoystickMapping") and string.find(sGameButton, "Joy") then
	sGameButton = string.gsub(sGameButton, "Joy.+_", "")
	Buttons = Def.Sprite {
		Texture=NOTESKIN:GetPath("Key","Buttons/"..sGameButton),
		Text=sGameButton,
		OnCommand=function(self) self:y(78) end
	}
else
	sGameButton = string.gsub(sGameButton, "Joy.+ ", "B")
	Buttons = Def.BitmapText {
		Font="_open sans semibold 24px",
		Text=sGameButton,
		OnCommand=function(self) self:y(78):zoom(0.8) end
	}
end

local Colour = {
	Key1 = "#AAAAFF",
	Key2 = "#FFAAAA",
	Key3 = "#AAAAFF",
	Key4 = "#AAAAFF",
	Key5 = "#FFAAAA",
	Key6 = "#AAAAFF",
	Key7 = "#AAAAFF",
	Key8 = "#AAAAFF",
	Key9 = "#FFAAAA",
	Key10 = "#FFDDAA",
	Key11 = "#FFAAAA",
	Key12 = "#AAAAFF",
	Key13 = "#AAAAFF",
	Key14 = "#AAAAFF",
	Key15 = "#FFAAAA",
	Key16 = "#AAAAFF",
	Key17 = "#AAAAFF",
	Key18 = "#FFAAAA",
	Key19 = "#AAAAFF"
}

return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self) self:y(8):valign(0):diffuse(0,0,0,1):scaletoclipped(64,100) end
	},
	Def.Quad {
		InitCommand=function(self) self:y(12):valign(0):diffuse(color(Colour[sButton])):scaletoclipped(60,96) end
	},
	Def.Quad {
		InitCommand=function(self) self:y(12):valign(0):diffuse(1,1,1,0.5):scaletoclipped(60,48):fadebottom(1) end
	},
	Def.Quad {
		InitCommand=function(self) self:y(60):valign(0):diffuse(0,0,0,0.5):scaletoclipped(60,48) end
	},
	Def.Quad {
		OnCommand=function(self) self:y(12):valign(0):scaletoclipped(60,48):fadebottom(0.5):diffuse(0,0,0,0) end,
		PressCommand=function(self) self:diffusealpha(1) end,
		LiftCommand=function(self) self:stoptweening():linear(0.2):diffusealpha(0) end
	},
	Buttons
}

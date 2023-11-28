local sButton = Var "Button"
local sGameButton = INPUTFILTER:GameButtonToKeyMapped(Var "GameButton", Var "Player")
sGameButton = string.gsub(sGameButton, "Key", "")

local Buttons = {}

if not PREFSMAN:GetPreference("UseOldJoystickMapping") and string.find(sGameButton, "Joy") then
	sGameButton = string.gsub(sGameButton, "Joy.+_", "")
	Buttons = Def.Sprite {
		Texture=NOTESKIN:GetPath("Key","Buttons/"..sGameButton),
		Text=sGameButton,
		OnCommand=function(self) self:y(82) end
	}
else
	sGameButton = string.gsub(sGameButton, "Joy.+ ", "B")
	Buttons = Def.BitmapText {
		Font="_open sans semibold 24px",
		Text=sGameButton,
		OnCommand=function(self) self:y(82):zoom(0.8) end
	}
end

local Colour = {
	Key1 = "#6df1d8",
	Key2 = "#d30cb8",
	Key3 = "#6df1d8",
	Key4 = "#6df1d8",
	Key5 = "#d30cb8",
	Key6 = "#6df1d8",
	Key7 = "#6df1d8",
	Key8 = "#6df1d8",
	Key9 = "#d30cb8",
	Key10 = "#5da4a6",
	Key11 = "#d30cb8",
	Key12 = "#6df1d8",
	Key13 = "#6df1d8",
	Key14 = "#6df1d8",
	Key15 = "#d30cb8",
	Key16 = "#6df1d8",
	Key17 = "#6df1d8",
	Key18 = "#d30cb8",
	Key19 = "#6df1d8"
}

local Direction = {
	Key1 = "Rewind",
	Key2 = "Rewind",
	Key3 = "Rewind",
	Key4 = "Rewind",
	Key5 = "Rewind",
	Key6 = "Rewind",
	Key7 = "Rewind",
	Key8 = "Rewind",
	Key9 = "Rewind",
	Key10 = "Eject",
	Key11 = "Forward",
	Key12 = "Forward",
	Key13 = "Forward",
	Key14 = "Forward",
	Key15 = "Forward",
	Key16 = "Forward",
	Key17 = "Forward",
	Key18 = "Forward",
	Key19 = "Forward"
}


local Button = Def.ActorFrame{}

if Direction[sButton] =="Eject" then
	Button[#Button+1] = Def.Quad {
		InitCommand=function(self) 
			self:SetCustomPosCoords(0,-8,-16,8,16,8,0,-8)
		end
	}
elseif Direction[sButton] =="Rewind" then
	Button[#Button+1] = Def.Quad {
		InitCommand=function(self) 
			self:SetCustomPosCoords(-8,0,-8,0,8,8,8,-8):x(-10)
		end
	}
	Button[#Button+1] = Def.Quad {
		InitCommand=function(self) 
			self:SetCustomPosCoords(-8,0,-8,0,8,8,8,-8):x(6)
		end
	}
elseif Direction[sButton] =="Forward" then
	Button[#Button+1] = Def.Quad {
		InitCommand=function(self) 
			self:SetCustomPosCoords(-8,8,-8,-8,8,0,8,0):x(-6)
		end
	}
	Button[#Button+1] = Def.Quad {
		InitCommand=function(self) 
			self:SetCustomPosCoords(-8,8,-8,-8,8,0,8,0):x(10)
		end
	}
end

return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self) self:y(12):valign(0):diffuse(0,0,0,1):scaletoclipped(64,100) end
	},
	Def.Quad {
		InitCommand=function(self) self:y(16):valign(0):diffuse(color(Colour[sButton])):scaletoclipped(60,96) end
	},
	Def.Quad {
		InitCommand=function(self) self:y(16):valign(0):diffuse(1,1,1,0.5):scaletoclipped(60,48):fadebottom(1) end
	},
	Def.Quad {
		InitCommand=function(self) self:y(64):valign(0):diffuse(0,0,0,0.5):scaletoclipped(60,48) end
	},
	Def.Quad {
		OnCommand=function(self) self:y(16):valign(0):scaletoclipped(60,48):fadebottom(0.5):diffuse(0,0,0,0) end,
		PressCommand=function(self) self:diffusealpha(1) end,
		LiftCommand=function(self) self:stoptweening():linear(0.2):diffusealpha(0) end
	},
	Button..{
		InitCommand=function(self) self:y(38):diffuse(.3,.3,.3,.5) end
	},
	Buttons
}

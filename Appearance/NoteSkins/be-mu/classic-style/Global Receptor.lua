local Button = Var "Button"
local iCol = tonumber(Var "Column")
local sPlayer = Var "Player"

local Reverse = GAMESTATE:GetPlayerState(sPlayer):GetPlayerOptions("ModsLevel_Preferred"):Reverse() == 1
local iColNum = GAMESTATE:GetCurrentStyle(sPlayer):ColumnsPerPlayer()

local firstcol = 0
local secondcol = 0
if iColNum == 7 or iColNum == 14 then
	firstcol = 7
	secondcol = 7
elseif icolNum == 16 then
	secondcol = 8
end

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
	-- Attempted frame
	Def.Quad {
		OnCommand=function(self) 
			self:zoomto(2,9999)
				:x(ColumnPos[Button])
				:diffuse(color("#3B3B3B"))
				:visible(THEME:GetMetric("NoteField","NoteFieldType") == bms)
		end,
	},
	Def.Quad {
		OnCommand=function(self) 
			self:zoomto(2,9999)
				:x(-ColumnPos[Button])
				:diffuse(color("#3B3B3B"))
				:visible((iCol == firstcol or iCol == secondcol) and THEME:GetMetric("NoteField","NoteFieldType") == bms)
		end,
	},
	--Glow
	Def.Sprite {
		Texture="_Global Note Flash Center (res 1x60).png",
		OnCommand=function(self)
			self:valign(1):y(6):zoomy(.5):zoomx(ColumnPos[Button]*2):diffuseramp():effectcolor1(1,1,1,.02):effectcolor2(1,1,1,1):effectclock("beat")
		end	
	},
	Def.ActorFrame {
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
		Texture="_Global Receptor (res 1x12).png",
		OnCommand=function(self)
			self:zoomx(ColumnPos[Button]*2)
		end
	},
}

local Button = Var "Button";

local sPlayer = Var "Player"

local Reverse = GAMESTATE:GetPlayerState(sPlayer):GetPlayerOptions("ModsLevel_Preferred"):Reverse() == 1

local KeyWidth = {
	["Left White"] = true,
	["Left Yellow"] = false,
	["Left Green"] = true,
	["Left Blue"] = false,
	["Red"] = true,
	["Right Blue"] = false,
	["Right Green"] = true,
	["Right Yellow"] = false,
	["Right White"] = true
}

local function ReceptorTexture()
    return "_" ..(KeyWidth[Button] and "Wide" or "Narrow") .. "Receptor"
end
local function GlowTexture()
    return "_" ..(KeyWidth[Button] and "Wide" or "Narrow") .. "Glow"
end

return Def.ActorFrame {
		OnCommand=function(self)
			self:zoomy(Reverse and -1 or 1)
		end,
		Def.Sprite {
			Texture=ReceptorTexture(),
			InitCommand=function(self) 
				self:effectclock("beat"):diffuseramp():effectcolor1(color(".8,.8,.8,1")):effectcolor2(color("1,1,1,1")):effecttiming(.2,0,.8,0):effectoffset(.05)
			end,
			NoneCommand=function(self) 
				self:finishtweening():diffusealpha(.9):linear(.11):diffusealpha(1)
			end
		},
		Def.ActorFrame {
		OnCommand=function(self)
			self:zoomy(Reverse and -1 or 1)
		end,
		Def.ActorFrame{
			OnCommand=function(self) self:diffusealpha(0):zoomy(5):y(6) end,
			PressCommand=function(self) self:stoptweening():diffusealpha(.6) end,
			LiftCommand=function(self) self:linear(.15):diffusealpha(0) end,
			Def.Sprite {
			Texture="_Global Note Flash Side (res 2x60).png",
			OnCommand=function(self)
				self:valign(1):x(-14)
			end	
			},
			Def.Sprite {
			Texture="_Global Note Flash Side (res 2x60).png",
			OnCommand=function(self)
				self:valign(1):zoomx(-1):x(14)
			end	
			},
			Def.Sprite {
			Texture="_Global Note Flash Center (res 1x60).png",
			OnCommand=function(self)
				self:valign(1):zoomx(28)
			end	
			}
		}
	}
}
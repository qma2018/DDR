local sButton = Var "Button"
local sColor = Var "Color"
local sEffect = Var "Effect"
local sPlayer = Var "Player"
if sColor == "" then sColor = "4th" end

return Def.ActorFrame {
	Def.Model {
		InitCommand=function(self) 
			self:rotationx(90) 
			if tonumber(sEffect) > 0 then 
				self:glow(1,1,1,.8)
				if not string.find(sButton, "Strum") then
					self:spin():effectmagnitude(0,180,0)
				end 
			end
		end,
		Meshes=string.find(sButton, "Strum") and NOTESKIN:GetPath("_Strum","Tap Hopo.txt") or NOTESKIN:GetPath("_Fret","Tap Hopo.txt"),
		Materials=NOTESKIN:GetPath("_RES/_"..sColor,"mat.txt"),
		Bones=NOTESKIN:GetPath("_Fret","Tap Hopo.txt"),
		FeverMessageCommand=function(self,params)
			if params.pn ~= sPlayer then return end
			if tonumber(sEffect) == 0 then
				if params.Active then
					self:glow(0,0,1,.8)
				else
					self:glow(1,1,1,0)
				end
			end
		end,
		FeverMissedMessageCommand=function(self,params)
			if params.pn ~= sPlayer then return end
			if tonumber(sEffect) > 0 then
				if params.Missed  then
					self:stopeffect():rotationy(0):glow(1,1,1,0)
				else
					self:glow(1,1,1,.8)
					if not string.find(sButton, "Strum") then
						self:spin():effectmagnitude(0,180,0)
					end 
				end
			end
		end
	}
}
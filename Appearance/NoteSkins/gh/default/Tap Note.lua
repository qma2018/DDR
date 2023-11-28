local sButton = Var "Button"
local sEffect = Var "Effect"
local sPlayer = Var "Player"

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
		Meshes=string.find(sButton, "Strum") and NOTESKIN:GetPath("_Strum","Tap Note.txt") or NOTESKIN:GetPath("_Fret","Tap Note.txt"),
		Materials=NOTESKIN:GetPath("_RES/_"..sButton,"mat.txt"),
		Bones=NOTESKIN:GetPath("_Fret","Tap Note.txt"),
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
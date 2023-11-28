local sEffect = Var "Effect"
local sPlayer = Var "Player"
return Def.ActorFrame {
	NOTESKIN:LoadActor(Var "Button", "TapNote") .. {
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
				self:glow(1,1,1,0.5)
			end
		end
	end
	}
}
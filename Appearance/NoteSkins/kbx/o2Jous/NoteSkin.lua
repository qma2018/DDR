local NSkin = {};

NSkin.ElementRedir =
{
	["Tap Fake"] = "Tap Note",
	["Hold Head Active"] = "Tap Note",
	["Roll Head Active"] = "Tap Note",
	["Hold Head Inactive"] = "Tap Note",
	["Roll Head Inactive"] = "Tap Note",
	["Tap Explosion Bright"] = "Tap Explosion",
	["Tap Explosion Dim"] = "Tap Explosion",
	["Hold Body Active"] = "Hold Body",
	["Hold Body Inactive"] = "Hold Body",
	["Roll Body Active"] = "Roll Body",
	["Roll Body Inactive"] = "Roll Body",
	["Hold Tail Active"] = "Tap Note",
	["Hold Tail Inactive"] = "Tap Note",
	["Roll Tail Active"] = "Tap Note",
	["Roll Tail Inactive"] = "Tap Note",
	["Hold LiftTail Active"] = "Tap Note",
	["Hold LiftTail Inactive"] = "Tap Note",
	["Roll LiftTail Active"] = "Tap Note",
	["Roll LiftTail Inactive"] = "Tap Note"
}

NSkin.PartsToRotate =
{
	["Receptor"] = true,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Addition"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true
}

NSkin.Blank =
{
	["Hold Explosion"] = true,
	["Roll Explosion "] = true,
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Bottomcap Active"] = true,
	["Hold Bottomcap Inactive"] = true,
	["Roll Bottomcap Active"] = true,
	["Roll Bottomcap Inactive"] = true
}


function NSkin.Load()
	local sButton = Var "Button"
	local sElement = Var "Element"

	local Button = "Key"
	
	sElement = string.gsub(sElement, "Simple", "")
	
	local Element = NSkin.ElementRedir[sElement] or sElement;		
	local t = LoadActor(NOTESKIN:GetPath(Button,Element))
		
	if NSkin.Blank[sElement] then
		t = Def.Actor {}
		if Var "SpriteOnly" then
			t = LoadActor(NOTESKIN:GetPath("","_blank"))
		end
	end
	
	if sElement == "Explosion" then
		t.BaseRotationZ = nil
	end
		
	return t;
end

return NSkin;

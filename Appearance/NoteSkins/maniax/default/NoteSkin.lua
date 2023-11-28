local Nskin = {}

Nskin.ButtonRedir =
{
	HandUpLeft = "High",
	HandUpRight = "High",
	HandLrLeft = "Low",
	HandLrRight = "Low",
}

Nskin.ElementRedir =
{
	["Hold Tail Active"] = "Hold Head Active",
	["Hold Tail Inactive"] = "Hold Head Inactive",
	["Roll Tail Active"] = "Roll Head Active",
	["Roll Tail Inactive"] = "Roll Head Inactive",
	["Tap Explosion Bright"] = "Tap Explosion Dim",
}

-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
Nskin.Blank =
{
	["Hold Explosion"] = true,
	["Roll Explosion"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true
}

--Between here we usally put all the commands the noteskin.lua needs to do, some are extern in other files
--If you need help with lua go to http://dguzek.github.io/Lua-For-SM5/API/Lua.xml there are a bunch of codes there
--Also check out common it has a load of lua codes in files there
--Just play a bit with lua its not that hard if you understand coding
--But SM can be an ass in some cases, and some codes jut wont work if you dont have the noteskin on FallbackNoteSkin=common in the metric.ini 
function Nskin.Load()
	local sButton = Var "Button"
	local sElement = Var "Element"
	local sPlayer = Var "Player"

	--Setting global button
	local Button = Nskin.ButtonRedir[sButton] or "High"
				
	--Setting global element
	local Element = Nskin.ElementRedir[sElement] or sElement
	
	if string.find(sElement, "Head") then
		Element = "Tap Note"
	end

	--Returning first part of the code, The redirects, Second part is for commands
	local t = LoadActor(NOTESKIN:GetPath(Button,Element))
	
	local Blank = false
	
	--Set blank redirects	
	if Nskin.Blank[sElement] or Blank then
		t = Def.Actor {}
		--Check if element is sprite only
		if Var "SpriteOnly" then
			t = LoadActor(NOTESKIN:GetPath("","_blank"))
		end
	end
			
	return t
end
-- >

-- dont forget to return cuz else it wont work >
return Nskin
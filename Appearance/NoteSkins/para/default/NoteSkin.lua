local Nskin = {}

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
Nskin.ButtonRedir =
{
	Up = "Down",
	Down = "Down",
	Left = "Down",
	Right = "Down",
	UpLeft = "Down",
	UpRight = "Down",
	BackLeft = "Back",
	Back = "Back",
	BackRight = "Back",
}

-- Defined the parts to be rotated at which degree
Nskin.Rotate =
{
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 135,
	UpRight = 225,
	BackLeft = -45,
	Back = 0,
	BackRight = 45,
}


--Define elements that need to be redirected
Nskin.ElementRedir =
{
	["Roll Head Active"] = "Hold Head Active",
	["Roll Head Inactive"] = "Hold Head Inactive",
	["Hold Tail Active"] = "Hold Head Active",
	["Hold Tail Inactive"] = "Hold Head Inactive",
	["Roll Tail Active"] = "Hold Head Active",
	["Roll Tail Inactive"] = "Hold Head Inactive",
}

-- Parts of noteskins which we want to rotate
Nskin.PartsToRotate =
{
	["Go Receptor"] = true,
	["Flash Receptor"] = true,
	["Ready Receptor"] = true,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
	["Tap Note"] = true,
	["Hold Bottom Cap Active"] = true,
	["Hold Bottom Cap Inactive"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
}

-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
Nskin.Blank =
{
	["Hold Explosion"] = true,
}

--Between here we usally put all the commands the noteskin.lua needs to do, some are extern in other files
--If you need help with lua go to http://dguzek.github.io/Lua-For-SM5/API/Lua.xml there are a bunch of codes there
--Also check out common it has a load of lua codes in files there
--Just play a bit with lua its not that hard if you understand coding
--But SM can be an ass in some cases, and some codes jut wont work if you dont have the noteskin on FallbackNoteSkin=common in the metric.ini 
function Nskin.Load()
	local sButton = Var "Button"
	local sElement = Var "Element"

	--Setting global button
	local Button = Nskin.ButtonRedir[sButton] or "Down"

	--Setting global element
	local Element = Nskin.ElementRedir[sElement] or sElement

	if (string.find(Element, "Hold") or
	   string.find(Element, "Roll")) and
	   not string.find(Element, "Explosion") and
	   not string.find(Element, "Hold Head") then
		Button = "Down"
	end
		
	
	--Returning first part of the code, The redirects, Second part is for commands
	local t = LoadActor(NOTESKIN:GetPath(Button,Element))
	
	--Set blank redirects
	if Nskin.Blank[sElement] then
		t = Def.Actor {}
		--Check if element is sprite only
		if Var "SpriteOnly" then
			t = LoadActor(NOTESKIN:GetPath("","_blank"))
		end
	end
	
	if Nskin.PartsToRotate[sElement] then
		t.BaseRotationZ = Nskin.Rotate[sButton] or nil
	end
			
	return t
end
-- >

-- dont forget to return cuz else it wont work >
return Nskin
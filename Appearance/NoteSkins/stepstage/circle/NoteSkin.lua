local Nskin = {}

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
Nskin.ButtonRedir =
{
	Left = "Left",
	Right = "Left",
	Center = "Left",
}

-- Defined the parts to be rotated at which degree
Nskin.Rotate =
{
	Left = 0,
	Right = 0,
	Center = 0,
}


--Define elements that need to be redirected
Nskin.ElementRedir =
{
	["Tap Fake"] = "Tap Note",
	["Hold Head Active"] = "Tap Note",
	["Hold Head Inactive"] = "Tap Note",
	["Hold Red Active"] = "Tap Red",
	["Hold Red Inactive"] = "Tap Red",
	["Hold Yellow Active"] = "Tap Yellow",
	["Hold Yellow Inactive"] = "Tap Yellow",
	["Roll Head Active"] = "Tap Note",
	["Roll Head Inactive"] = "Tap Note",
	["Roll Red Active"] = "Tap Red",
	["Roll Red Inactive"] = "Tap Red",
	["Roll Yellow Active"] = "Tap Yellow",
	["Roll Yellow Inactive"] = "Tap Yellow",
	["Hold Jump Active"] = "Jump Note",
	["Hold Jump Inactive"] = "Jump Note",
	["Hold Jump Red Active"] = "Jump Red",
	["Hold Jump Red Inactive"] = "Jump Red",
	["Hold Jump Yellow Active"] = "Jump Yellow",
	["Hold Jump Yellow Inactive"] = "Jump Yellow",
	["Roll Jump Active"] = "Jump Note",
	["Roll Jump Inactive"] = "Jump Note",
	["Roll Jump Red Active"] = "Jump Red",
	["Roll Jump Red Inactive"] = "Jump Red",
	["Roll Jump Yellow Active"] = "Jump Yellow",
	["Roll Jump Yellow Inactive"] = "Jump Yellow",
	["Roll Red Body Active"] = "Roll Body Active",
	["Roll Red Body Inactive"] = "Roll Body Inactive",
	["Roll Yellow Body Active"] = "Roll Body Active",
	["Roll Yellow Body Inactive"] = "Roll Body Inactive",
	["Roll Red Bottomcap Active"] = "Roll Bottomcap Active",
	["Roll Red Bottomcap Inactive"] = "Roll Bottomcap Inactive",
	["Roll Yellow Bottomcap Active"] = "Roll Bottomcap Active",
	["Roll Yellow Bottomcap Inactive"] = "Roll Bottomcap Inactive",
}

-- Parts of noteskins which we want to rotate
Nskin.PartsToRotate =
{
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Lift"] = true,
}

-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
Nskin.Blank =
{
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
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
	local Button = Nskin.ButtonRedir[sButton] or "Left"
				
	--Setting global element
	local Element = Nskin.ElementRedir[sElement] or sElement
	
	if string.find(Element, "Hold") then
		Element = string.gsub(Element, "Inactive", "Active")
	end
		
	--Returning first part of the code, The redirects, Second part is for commands
	local t = LoadActor(NOTESKIN:GetPath(Button,Element))
	
	if sButton == "Right" then
		t.BaseZoomX = -1
	end
	
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

local Nskin = {}

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
Nskin.ButtonRedir =
{
	UpLeft = "UpRight",
	UpRight = "UpRight",
	DownLeft = "DownRight",
	DownRight = "DownRight",
	Center = "Center"
}

-- Defined the parts to be rotated at which degree
Nskin.Rotate =
{
	UpLeft = -90,
	UpRight = 0,
	DownLeft = 180,
	DownRight = 90,
	Center = 0
}


--Define elements that need to be redirected
Nskin.ElementRedir =
{
	["Tap Fake"] = "Tap Note",
	["Tap Explosion Bright"] = "Tap Explosion",
	["Tap Explosion Dim"] = "Tap Explosion",
}

-- Parts of noteskins which we want to rotate
Nskin.PartsToRotate =
{
	["Receptor"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Lift"] = true,
	["Tap Addition"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true
}

-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
Nskin.Blank =
{
	["Hold Bottomcap Active"] = true,
	["Hold Bottomcap Inactive"] = true,
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Bottomcap Active"] = true,
	["Roll Bottomcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Explosion"] = true,
	["Roll Explosion"] = true
}

--Between here we usally put all the commands the noteskin.lua needs to do, some are extern in other files
--If you need help with lua go to http://dguzek.github.io/Lua-For-SM5/API/Lua.xml there are a bunch of codes there
--Also check out common it has a load of lua codes in files there
--Just play a bit with lua its not that hard if you understand coding
--But SM can be an ass in some cases, and some codes jut wont work if you dont have the noteskin on FallbackNoteSkin=common in the metric.ini
function Nskin.Load()
	local sButton = Var "Button"
	local sElement = Var "Element"

	sElement = string.gsub(sElement, "Simple", "")
	sElement = string.gsub(sElement, "Inactive", "Active")
	sElement = string.gsub(sElement, "Ready", "Go")

	--Setting global button
	local Button = Nskin.ButtonRedir[sButton] or "Center"

	--Setting global element
	local Element = Nskin.ElementRedir[sElement] or sElement

	if string.find(sElement, "Hold Head") or
	string.find(Element, "Hold Tail") or
	string.find(Element, "Roll Head") or
	string.find(Element, "Roll Tail") then
		Element = "Tap Note"
	end

	if string.find(Element, "Mine") or
		string.find(Element, "Tap Explosion") or
		string.find(Element, "Roll Body") then
		Button = "Center"
	end

	Element = Element:gsub("Inactive", "Active")

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
		--t.BaseRotationY = Nskin.Rotate[sButton] or nil
	end

	return t
end
-- >

-- dont forget to return cuz else it wont work >
return Nskin

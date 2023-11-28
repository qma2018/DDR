local Nskin = {}

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
Nskin.ButtonRedir =
{
	FootUpLeft = "FootUpLeft",
	FootUpRight = "FootUpLeft",
	FootDownLeft = "FootDownLeft",
	FootDownRight = "FootDownLeft",
	FootCenter = "FootCenter",
	HandUp="HandDown",
	HandDown="HandDown",
	HandLeft="HandLeft",
	HandRight="HandLeft"
}

Nskin.ZoomX =
{
	FootUpRight = -1,
	FootDownRight = -1,
	HandRight = -1
}

Nskin.ZoomY =
{
	HandUp = -1
}

--Define elements that need to be redirected
Nskin.ElementRedir =
{
	["Tap Fake"] = "Tap Note",
	["Hold Head Active"] = "Tap Note",
	["Hold Head Inactive"] = "Tap Note",
	["Roll Head Active"] = "Tap Note",
	["Roll Head Inactive"] = "Tap Note",
	["Tap Explosion Dim"] = "Tap Explosion Bright",
	["Hold Explosion"] = "Tap Explosion Bright",
	["Roll Explosion"] = "Tap Explosion Bright"
}

-- Parts of noteskins which we want to rotate
Nskin.PartsToRotate =
{
	["Receptor"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Lift"] = true,
	["Tap Addition"] = true,
	["Tap Explosion Dim"] = true,
	["Tap Explosion Bright"] = true,
	["Hold Explosion"] = true,
	["Roll Explosion"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Hold Bottomcap Active"] = true,
	["Hold Topcap Active"] = true,
	["Hold Bottomcap Inactive"] = true,
	["Hold Topcap Inactive"] = true,
	["Hold Body Active"] = true,
	["Hold Body Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
	["Roll Bottomcap Active"] = true,
	["Roll Topcap Active"] = true,
	["Roll Bottomcap Inactive"] = true,
	["Roll Topcap Inactive"] = true,
	["Roll Body Active"] = true,
	["Roll Body Inactive"] = true
}

-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
Nskin.Blank =
{
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

	local Button = Nskin.ButtonRedir[sButton] or sButton

	sElement = string.gsub(sElement, "Simple", "")

	--Setting global element
	local Element = Nskin.ElementRedir[sElement] or sElement

	Element = Element:gsub("Inactive", "Active")

	--Returning first part of the code, The redirects, Second part is for commands
	local t = LoadActor(NOTESKIN:GetPath(Button,Element))
	
	if sElement == "Receptor" and sButton == "FootCenter" then
		t = Def.Actor {}
	end
	

	--Set blank redirects
	if Nskin.Blank[sElement] then
		t = Def.Actor {}
		--Check if element is sprite only
		if Var "SpriteOnly" then
			t = LoadActor(NOTESKIN:GetPath("","_blank"))
		end
	end

	if sButton == "HandUp" and (string.find(Element,"Bottomcap") or string.find(Element,"Topcap") or string.find(Element,"Body")) then
		-- do nothing.
	else
		if Nskin.PartsToRotate[sElement] then
			t.BaseZoomX = Nskin.ZoomX[sButton] or 1
			t.BaseZoomY = Nskin.ZoomY[sButton] or 1
		end
	end
	
	return t
end
-- >

-- dont forget to return cuz else it wont work >
return Nskin

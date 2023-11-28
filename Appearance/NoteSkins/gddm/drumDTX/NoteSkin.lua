local Nskin = {}

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
Nskin.ButtonRedir =
{
	["Left Crash"] = "Actor",
	["Hi-Hat"] = "Actor",
	["Hi-Hat Pedal"] = "Actor",
	["Snare"] = "Actor",
	["High Tom"] = "Actor",
	["Kick"] = "Actor",
	["Mid Tom"] = "Actor",
	["Floor Tom"] = "Actor",
	["Ride"] = "Actor",
	["Right Crash"] = "Actor"
}

-- Defined the parts to be rotated at which degree
Nskin.Rotate =
{
	["Left Crash"] = 0,
	["Hi-Hat"] = 0,
	["Hi-Hat Pedal"] = 0,
	["Snare"] = 0,
	["High Tom"] = 0,
	["Kick"] = 0,
	["Mid Tom"] = 0,
	["Floor Tom"] = 0,
	["Ride"] = 0,
	["Right Crash"] = 0,
}


--Define elements that need to be redirected
Nskin.ElementRedir =
{
	["Tap Fake"] = "Tap Note",
	["Tap Explosion Dim"] = "Tap Explosion",
	["Tap Explosion Bright"] = "Tap Explosion",
	["Hold Explosion"] = "Tap Explosion",
	["Roll Explosion"] = "Tap Explosion",
}

-- Parts of noteskins which we want to rotate
Nskin.PartsToRotate =
{}

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
	local Button = Nskin.ButtonRedir[sButton] or "Actor"
				
	--Setting global element
	local Element = Nskin.ElementRedir[sElement] or sElement
	
	if string.find(sElement, "Head") then
		Element = "Tap Note"
	end

	if string.find(Element, "Tap Note") or
	   string.find(Element, "Explosion") or
	   string.find(Element, "Lift") or
	   string.find(Element, "Receptor") or
	   string.find(Element, "Ovceptor") then
		Button = Nskin.ButtonRedir[sButton] or "Actor"
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
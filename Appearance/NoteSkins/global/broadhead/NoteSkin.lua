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
	DownLeft = "Down",
	DownRight = "Down",
	Center = "Center",
	Foot = "Center",
}

--These define what key goes to which "Arrow" for KBX mode.
Nskin.KBXRedir =
{
	-- one key
	{Key10="Center"},
	-- two keys
	{Key9="Left", Key11="Right"},
	-- three keys (threepanel)
	{Key9="UpLeft", Key10="Down", Key11="UpRight"},
	-- four keys (dance-single)
	{Key7="Left", Key9="Down", Key11="Up", Key13="Right"},
	-- five keys (pump-single)
	{Key7="DownLeft", Key9="UpLeft", Key10="Center", Key11="UpRight", Key13="DownRight"},
	-- six keys (solo-single)
	{Key5="Left", Key7="UpLeft", Key9="Down", Key11="Up", Key13="UpRight", Key15="Right"},
	-- seven keys (solo + center)
	{Key5="Left", Key7="UpLeft", Key9="Down", Key10="Center", Key11="Up", Key13="UpRight", Key15="Right"},
	-- eight keys (techno8)
	{Key3="DownLeft", Key5="Left", Key7="UpLeft", Key9="Down", Key11="Up", Key13="UpRight", Key15="Right", Key17="DownRight"},
	-- nine keys (techno9)
	{Key3="DownLeft", Key5="Left", Key7="UpLeft", Key9="Down", Key10="Center", Key11="Up", Key13="UpRight", Key15="Right", Key17="DownRight"},
	-- ten keys (pump-double)
	{Key3="DownLeft", Key4="UpLeft", Key5="Center", Key7="UpRight", Key9="DownRight", Key11="DownLeft", Key13="UpLeft", Key15="Center", Key16="UpRight", Key17="DownRight"},
	-- eleven keys (pump, center, pump)
	{Key3="DownLeft", Key4="UpLeft", Key5="Center", Key7="UpRight", Key9="DownRight", Key10="Center", Key11="DownLeft", Key13="UpLeft", Key15="Center", Key16="UpRight", Key17="DownRight"},
	-- twelve keys (solo-double)
	{Key3="Left", Key4="UpLeft", Key5="Down", Key7="Up", Key8="UpRight", Key9="Right", Key11="Left", Key12="UpLeft", Key13="Down", Key15="Up", Key16="UpRight", Key17="Right"},
	-- thirteen keys (solo, center, solo)
	{Key3="Left", Key4="UpLeft", Key5="Down", Key7="Up", Key8="UpRight", Key9="Right", Key10="Center", Key11="Left", Key12="UpLeft", Key13="Down", Key15="Up", Key16="UpRight", Key17="Right"},
	-- fourteen keys (solo + center x2)
	{Key3="Left", Key4="UpLeft", Key5="Down", Key6="Center", Key7="Up", Key8="UpRight", Key9="Right", Key11="Left", Key12="UpLeft", Key13="Down", Key14="Center", Key15="Up", Key16="UpRight", Key17="Right"},
	-- fifteen keys (solo + center, center, solo + center)
	{Key3="Left", Key4="UpLeft", Key5="Down", Key6="Center", Key7="Up", Key8="UpRight", Key9="Right", Key10="Center", Key11="Left", Key12="UpLeft", Key13="Down", Key14="Center", Key15="Up", Key16="UpRight", Key17="Right"},
	-- sizteen keys (techno8-double)
	{Key2="DownLeft", Key3="Left", Key4="UpLeft", Key5="Down", Key6="Up", Key7="UpRight", Key8="Right", Key9="DownRight", Key11="DownLeft", Key12="Left", Key13="UpLeft", Key14="Down", Key15="Up", Key16="UpRight", Key17="Right", Key18="DownRight"},
	-- seventeen keys (techno8, center, techno8)
	{Key2="DownLeft", Key3="Left", Key4="UpLeft", Key5="Down", Key6="Up", Key7="UpRight", Key8="Right", Key9="DownRight", Key10="Center", Key11="DownLeft", Key12="Left", Key13="UpLeft", Key14="Down", Key15="Up", Key16="UpRight", Key17="Right", Key18="DownRight"},
	-- eighteen keys (techno9-double)
	{Key1="DownLeft", Key2="Left", Key3="UpLeft", Key4="Down", Key5="Center", Key6="Up", Key7="UpRight", Key8="Right", Key9="DownRight", Key11="DownLeft", Key12="Left", Key13="UpLeft", Key14="Down", Key15="Center", Key16="Up", Key17="UpRight", Key18="Right", Key19="DownRight"},
	-- nineteen keys (techno9, center, techno9)
	{Key1="DownLeft", Key2="Left", Key3="UpLeft", Key4="Down", Key5="Center", Key6="Up", Key7="UpRight", Key8="Right", Key9="DownRight", Key10="Center", Key11="DownLeft", Key12="Left", Key13="UpLeft", Key14="Down", Key15="Center", Key16="Up", Key17="UpRight", Key18="Right", Key19="DownRight"},
}

Nskin.Game = GAMESTATE:GetCurrentGame():GetName()

-- Defined the parts to be rotated at which degree
Nskin.Rotate =
{
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 135,
	UpRight = -135,
	
	DownLeft = 45,
	DownRight = -45,
	Center = 0,
	Foot = 0
}


--Define elements that need to be redirected
Nskin.ElementRedir =
{
	["Tap Fake"] = "Tap Note",
	["Tap Explosion Dim"] = "glow",
	["Tap Explosion Bright"] = "glow",
	["Roll Explosion"] = "Hold Explosion",
	["Roll LiftTail Inactive"] = "Hold LiftTail Inactive",
	["Roll LiftTail Active"] = "Hold LiftTail Active",
}

-- Parts of noteskins which we want to rotate
Nskin.PartsToRotate =
{
	["Receptor"] = true,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Lift"] = true,
	["Tap Addition"] = true,
	["Hold Explosion"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Explosion"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
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
	if Nskin.Game == 'kbx' then
		local numCols = GAMESTATE:GetCurrentStyle():ColumnsPerPlayer()
		if Nskin.KBXRedir[numCols] then
			sButton = Nskin.KBXRedir[numCols][sButton] or "Down"
		else -- In case we get extra buttons somehow.
			sButton = "Down"
		end
	end

	--Setting global button
	local Button = Nskin.ButtonRedir[sButton] or "Down"
				
	--Setting global element
	local Element = Nskin.ElementRedir[sElement] or sElement
	
	if string.find(sElement, "Head") then
		Element = "Tap Note"
	end

	if string.find(Element, "Tap Note") or
	   string.find(Element, "Explosion") or
	   string.find(Element, "Lift") or
	   string.find(Element, "Receptor") then
		--We want to make this a global noteskin so we will use "Center" for fallback for unknown buttons.
		Button = Nskin.ButtonRedir[sButton] or "Center"
	end

	if (string.find(Element, "Hold") or
	   string.find(Element, "Roll")) and
	   not string.find(Element, "Explosion") then
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

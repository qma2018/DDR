local Nskin = {}

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
Nskin.ButtonRedir =
{
	UpLeft = "UpLeft",
	UpRight = "UpLeft",
	DownLeft = "DownLeft",
	DownRight = "DownLeft",
	Center = "Center"
}

-- Defined the parts to be rotated at which degree
Nskin.Rotate =
{
	UpLeft = 0,
	UpRight = 90,
	DownLeft = 0,
	DownRight = -90,
	Center = 0
}


--Define elements that need to be redirected
Nskin.ElementRedir =
{
	["Tap Fake"] = "Tap Note"
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
	["P2 Tap Note"] = true,
	["P2 Tap Fake"] = true,
	["P2 Tap Lift"] = true,
	["P2 Tap Addition"] = true,
	["P2 Hold Head Active"] = true,
	["P2 Hold Head Inactive"] = true,
	["P3 Tap Note"] = true,
	["P3 Tap Fake"] = true,
	["P3 Tap Lift"] = true,
	["P3 Tap Addition"] = true,
	["P3 Hold Head Active"] = true,
	["P3 Hold Head Inactive"] = true,
	["P4 Tap Note"] = true,
	["P4 Tap Fake"] = true,
	["P4 Tap Lift"] = true,
	["P4 Tap Addition"] = true,
	["P4 Hold Head Active"] = true,
	["P4 Hold Head Inactive"] = true,
	["P5 Tap Note"] = true,
	["P5 Tap Fake"] = true,
	["P5 Tap Lift"] = true,
	["P5 Tap Addition"] = true,
	["P5 Hold Head Active"] = true,
	["P5 Hold Head Inactive"] = true,
	["Explosion"] = true
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

	--Setting global button
	local Button = Nskin.ButtonRedir[sButton] or "Center"

	--Setting global element
	local Element = Nskin.ElementRedir[sElement] or sElement

	if string.find(Element, "Body") or
	   string.find(Element, "Bottomcap") or
	   string.find(Element, "Roll Head") then
		Button = sButton
	end
	
	if string.find(Element, "Roll Head") then
		Element = "Roll Head"
	end
	
	if string.find(Element, "Roll Body") then
		Element = "Roll Body"		
	end
	
	if string.find(Element, "Roll Bottomcap") then
		Element = "Roll Bottomcap"		
	end
	
	if string.find(Element, "Tap Lift") then
		Element = "Tap Lift"
	end

	if string.find(Element, "Tap Fake") then
		Element = "Tap Fake"
	end

	if string.find(Element, "Tap Mine") then
		Button = "Center"
		Element = "Tap Mine"
	end

	Element = Element:gsub("Inactive", "Active")
	Element = Element:gsub("Hold Head Active", "Tap Note")
	
	if string.find(sElement, "Topcap") or string.find(sElement, "Tail") then
		return LoadActor(NOTESKIN:GetPath("","_blank"))
	end

	--Returning first part of the code, The redirects, Second part is for commands
	local t = LoadActor(NOTESKIN:GetPath(Button,Element))
	
	local Player = string.match(Element, "P%d+") or "P1"
	
	if string.find(Element, "Tap Note") or string.find(Element, "Head") then
		t = Def.ActorFrame {
			LoadActor(NOTESKIN:GetPath(Button,Element)),
			LoadActor("PlayerLabel "..Player)..{	
				BaseRotationZ = (-Nskin.Rotate[sButton])
			}
		}
	end
	
	if string.find(Element, "Explosion") then
		t = Def.ActorFrame{ 
			LoadActor("_flash")..{
				InitCommand=function(self)  self:blend("BlendMode_Add") end
			},
			NOTESKIN:LoadActor(Button,"Ready Receptor")..{
				InitCommand=function(self) self:SetAllStateDelays(0):glow(1,1,1,1) end
			},
			InitCommand=function(self) self:diffusealpha(0) end,
			ProW1Command=function(self) self:playcommand("Glow") end,
			ProW2Command=function(self) self:playcommand("Glow") end,
			ProW3Command=function(self) self:playcommand("Glow") end,
			ProW4Command=function(self) self:playcommand("Glow") end,
			ProW5Command=function(self) self:playcommand("Glow") end,
			W1Command=function(self) self:playcommand("Glow") end,
			W2Command=function(self) self:playcommand("Glow") end,
			W3Command=function(self) self:playcommand("Glow") end,
			HitMineCommand=function(self) self:playcommand("Glow") end,
			HeldCommand=function(self) self:playcommand("Glow") end,
			GlowCommand=function(self) 
				self:stoptweening()
					:diffusealpha(1)
					:zoom(.8)
					:linear(.2)
					:diffusealpha(0)
					:zoom(1)
			end
		}
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

	if string.find(sElement, "Lift") then
		t.InitCommand=function(self)
			self:pulse()
				:effectclock("beat")
				:effectmagnitude(1,0.75,0)
		end
	end

	return t
end
-- >

-- dont forget to return cuz else it wont work >
return Nskin
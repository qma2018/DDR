local t = Def.ActorFrame{}

local wheel = ThemePrefs.Get("WheelType");

if wheel == "A" then
    t[#t+1] = loadfile(THEME:GetPathG("MusicWheelItem","SectionExpanded NormalPart/A.lua"))()
elseif wheel == "Banner" then
    t[#t+1] = loadfile(THEME:GetPathG("MusicWheelItem","SectionExpanded NormalPart/Banner.lua"))()
else
    t[#t+1] = loadfile(THEME:GetPathG("MusicWheelItem","SectionCollapsed NormalPart/"..wheel.."/default.lua"))()
end

return t;

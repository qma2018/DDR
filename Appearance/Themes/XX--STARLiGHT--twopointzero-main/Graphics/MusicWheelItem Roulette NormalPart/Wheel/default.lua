return Def.ActorFrame{
  Def.Sprite{
    Texture=THEME:GetPathG("","MusicWheelItem SectionCollapsed NormalPart/Wheel/Backing"),
    InitCommand=function(s) s:diffuse(Color.Green) end,
  };
  Def.BitmapText{
		Font="_avenirnext lt pro bold/25px";
		InitCommand=function(s) s:halign(0):x(-420):maxwidth(250/0.8):wrapwidthpixels(2^24):zoom(2) end,
		SetMessageCommand=function(self, param)
      self:settext(THEME:GetString("MusicWheel","Roulette"))
      self:diffuse(Color.Green)
    end;
	};
};

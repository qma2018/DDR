return Def.ActorFrame{
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Left', 'Tap Mine' );
		InitCommand=function(self)
			self:spin():animate(true):effectclock('beat'):effectmagnitude(0,0,-60)
		end;
	};
}
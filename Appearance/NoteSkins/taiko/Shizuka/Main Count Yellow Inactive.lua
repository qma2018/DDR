return Def.ActorFrame{
    Def.Sprite{
        Texture=NOTESKIN:GetPath("Inactive","Balloon"),
        InitCommand=function(self)
            self:halign(0):x(28)
        end
    },
    Def.Sprite{
        Texture=NOTESKIN:GetPath("Main","Tap Note")
    }
}
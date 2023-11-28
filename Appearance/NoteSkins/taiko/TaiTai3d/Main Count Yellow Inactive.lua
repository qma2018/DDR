return Def.ActorFrame{
    Def.Sprite{
        Texture=NOTESKIN:GetPath("Inactive","Balloon"),
        InitCommand=function(self)
            self:halign(0):x(28)
        end
    },
    Def.Model {
        Meshes=NOTESKIN:GetPath("","_RES/DON.txt"),
        Materials=NOTESKIN:GetPath("","_RES/MAT_RED.txt"),
        Bones=NOTESKIN:GetPath("","_RES/DON.txt")
    }
}
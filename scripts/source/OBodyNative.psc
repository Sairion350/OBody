ScriptName OBodyNative

Function GenActor(Actor a_actor) Global Native

; Example: "Data\\CalienteTools\\BodySlide\\SliderPresets\\Teru Apex V2 3BBB.xml"
Function ApplyPresetByFile(Actor a_actor, string a_pathToFile) Global Native

; Must be a preset loaded into memory, i.e. already in the preset folder
Function ApplyPresetByName(Actor a_actor, String a_name) Global Native

Function RegisterForOBodyEvent(Quest a_quest) Global Native

Function MarkForReprocess(Actor a_actor) Global
	NiOverride.SetBodyMorph(a_actor, "obody_processed", "OBody", 0.0)
EndFunction

Function RemoveClothesOverlay(Actor a_actor) Global
	NiOverride.ClearBodyMorphKeys(a_actor, "OClothe")
	NiOverride.ApplyOverrides(a_actor)
EndFunction

Function AddClothesOverlay(Actor a_actor) Global Native

String[] Function GetAllPossiblePresets(actor a_actor) Global Native

Int Function GetFemaleDatabaseSize() Global Native

Int Function GetMaleDatabaseSize() Global Native

Function SetORefit(Bool a_enabled) Global Native

Function SetNippleRand(Bool a_enabled) Global Native

Function SetGenitalRand(Bool a_enabled) Global Native
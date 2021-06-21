ScriptName OBodyNative

Function GenActor(Actor a_actor) Global Native

;Example: "Data\\CalienteTools\\BodySlide\\SliderPresets\\Teru Apex V2 3BBB.xml"
Function ApplyPresetByFile(Actor a_actor, string PathToFile) Global Native

; Must be a preset loaded into memory, i.e. already in the preset folder
Function ApplyPresetByName(Actor a_actor, string Name) Global Native


Function RegisterForOBodyEvent(Quest q) Global Native


Function MarkForReprocess(actor act) Global
	NiOverride.SetBodyMorph(act, "OBody_processed", "OBody", 0.0)
EndFunction

Function RemoveClothesOverlay(actor act) Global
	NiOverride.ClearBodyMorphKeys(act, "OClothe")
	NiOverride.ApplyOverrides(act)
EndFunction


Function AddClothesOverlay(actor act) Global Native


String[] Function GetAllPossiblePresets(actor act) Global Native

Int Function GetFemaleDatabaseSize() Global Native

Int Function GetMaleDatabaseSize() Global Native



Function SetORefit(bool enabled) Global Native

Function SetNippleRand(bool enabled) Global Native

Function SetGenitalRand(bool enabled) Global Native
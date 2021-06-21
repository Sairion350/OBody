ScriptName OBodyScript extends Quest


bool Property ORefitEnabled
	bool Function Get()
		return (game.GetFormFromFile(0x001802, "OBody.esp") as GlobalVariable).GetValueInt() == 1
	EndFunction
EndProperty

bool Property NippleRandEnabled
	bool Function Get()
		return (game.GetFormFromFile(0x001803, "OBody.esp") as GlobalVariable).GetValueInt() == 1
	EndFunction
EndProperty

bool Property GenitalRandEnabled
	bool Function Get()
		return (game.GetFormFromFile(0x001804, "OBody.esp") as GlobalVariable).GetValueInt() == 1
	EndFunction
EndProperty

int Property PresetKey
	int Function Get()
		return (game.GetFormFromFile(0x001805, "OBody.esp") as GlobalVariable).GetValueInt()
	EndFunction
EndProperty



actor playerref

Actor Property targetOrPlayer
	Actor Function Get()
		actor ret
		ret = game.GetCurrentCrosshairRef() as actor

		if ret == none 
			ret = playerref
		endif 

		return ret
	EndFunction
EndProperty

Event OnInit()
	playerref = game.GetPlayer()
	debug.Notification("OBody installed")
	Debug.Notification(OBodyNative.GetFemaleDatabaseSize() + " female bodyslide presets installed")
	Debug.Notification(OBodyNative.GetMaleDatabaseSize() + " male bodyslide presets installed")


	onload()
EndEvent

Function OnLoad()
	RegisterForKey(PresetKey)

	OBodyNative.SetORefit(ORefitEnabled)
	OBodyNative.SetNippleRand(NippleRandEnabled)
	OBodyNative.SetGenitalRand(GenitalRandEnabled)

EndFunction


Event OnKeyDown(int KeyPress)
	If (Utility.IsInMenuMode() || UI.IsMenuOpen("console"))
		Return
	EndIf
	
	if KeyPress == PresetKey 
		ShowPresetMenu(targetOrPlayer)
	endif
EndEvent

Function ShowPresetMenu(Actor act)

	debug.Notification("Editing " + act.GetDisplayName())
	UIListMenu listmenu = uiextensions.GetMenu("UIListMenu") as UIListMenu
	listmenu.ResetMenu()

	string[] title = new String[1]
	title[0] = "-   OBody   -"

	string[] presets = OBodyNative.GetAllPossiblePresets(act)
	int l = presets.Length
	console((l) + " presets found")

	int pagesNeeded
	if l > 125
		pagesNeeded = (l / 125) + 1
		console("Pages needed: " + pagesneeded)

		int i = 0

		while i < pagesNeeded
			listmenu.AddEntryItem("OBody set " + (i + 1))
			i += 1
		EndWhile

		listmenu.OpenMenu(act)
		int num = listmenu.GetResultInt()
		if num < 0
			return 
		endif

		int startingPoint = num * 125

		int endPoint

		if num == (pagesNeeded - 1) ; last set
			endPoint = presets.Length - 1 
		else 
			endPoint = startingPoint + 124
		endif 

		listmenu.ResetMenu()
		presets = PapyrusUtil.SliceStringArray(presets, startingPoint, endPoint)

	endif 

	presets = PapyrusUtil.MergeStringArray(title, presets)


	int i = 0
	int max = presets.length
	
	while (i < max)
		listmenu.AddEntryItem( presets[i])

		i += 1
	endwhile

	listmenu.OpenMenu(act)
	string result = listmenu.GetResultString()

	int num = listmenu.GetResultInt()

	if !(num < 1)
		OBodyNative.ApplyPresetByName(act, result)
		console("Applying: " + result)
	endif 

EndFunction




function console(string in)	
	OsexIntegrationMain.Console(in)
EndFunction


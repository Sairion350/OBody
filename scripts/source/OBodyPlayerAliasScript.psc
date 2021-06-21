ScriptName OBodyPlayerAliasScript Extends ReferenceAlias

OBodyScript Property OBody Auto

Event OnInit()
	OBody = (GetOwningQuest()) as OBodyScript
EndEvent

Event OnPlayerLoadGame()
	OBody.OnLoad()
EndEvent

extends Control

onready var _globalVar = get_node("/root/GlobalVar")

func _input(event):
	if (_globalVar.playerCanFly == false):
		$buttons/VBoxContainer/button_restart.grab_focus()
	pass

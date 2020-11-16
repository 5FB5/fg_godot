extends Control

onready var _globalVar = get_node("/root/GlobalVar")

func _input(event):
	#Turn on pause menu if player has not lost
	if (_globalVar.playerCanFly == true):
		if (event.is_action_released("game_pause")):
			get_tree().paused = not get_tree().paused
			visible = not visible
		
			if (visible):
				print("Game: Paused")
			else:
				print("Game: Resumed")
	pass

# IDK why but it fixes problem with returning to main menu via gamepad
func _process(delta):
	if (visible):
		if (Input.is_action_just_released("ui_cancel")):
			get_tree().change_scene("res://resources/scenes/main_menu.tscn")
	pass

func _on_button_resume_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	pass 

func _on_button_menu_pressed():
	get_tree().change_scene("res://resources/scenes/main_menu.tscn")
	pass

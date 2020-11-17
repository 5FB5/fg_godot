extends Control

onready var _globalVar = get_node("/root/GlobalVar")

func _input(event):
		if (visible):
			if (event.is_action_released("ui_accept")):
				visible = false;
				get_tree().reload_current_scene()
				get_node("/root/GlobalVar").playerCanFly = true;
				get_node("/root/GlobalVar").playerScore = 0;
				#$buttons/VBoxContainer/button_restart.grab_focus()
			
			elif (event.is_action_released("ui_cancel")):
				get_tree().change_scene("res://resources/scenes/main_menu.tscn")
pass

func _on_button_restart_pressed():
	visible = false;
	get_tree().reload_current_scene()
	get_node("/root/GlobalVar").playerCanFly = true;
	get_node("/root/GlobalVar").playerScore = 0;
	pass

func _on_button_menu_pressed():
	visible = false
	get_tree().change_scene("res://resources/scenes/main_menu.tscn")
	pass

func _process(delta):
	$labelScore.text = str(get_node("/root/GlobalVar").playerBestScore)
	pass

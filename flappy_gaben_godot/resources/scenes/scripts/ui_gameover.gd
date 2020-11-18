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
	$ui_score/best_score/labelScore.text = str(get_node("/root/GlobalVar").playerBestScore)
	$ui_score/current_score/labelCurrentScore.text = str(get_node("/root/GlobalVar").playerScore)
	
	# Change UI button icons
	# If XOne controller
	if (Input.get_joy_name(0)):
		if (Input.get_joy_guid(0) == "__XINPUT_DEVICE__"):
			$gamepad_buttons/xbox.visible = true
			$gamepad_buttons/ps4.visible = false
		# If PS4 controller
		elif (Input.get_joy_guid(0) == "4c05c405000000000000504944564944"):
			$gamepad_buttons/ps4.visible = true
			$gamepad_buttons/xbox.visible = false
	
	# If gamepad isn't connected
	else:
		# Hide all gamepad's icons
		$gamepad_buttons.visible = false
	
	pass

extends Control

onready var _globalVar = get_node_or_null("/root/GlobalVar")

func _input(event):
		if (visible):
			if (event.is_action_released("ui_accept")):
				print("-- Game restarted --")
				visible = false;
				get_tree().reload_current_scene()
				get_node_or_null("/root/GlobalVar").playerCanFly = true;
				get_node_or_null("/root/GlobalVar").playerScore = 0;
			
			elif (event.is_action_released("ui_cancel")):
				get_tree().change_scene("res://resources/scenes/ui/main_menu.tscn")
pass

func _on_button_restart_pressed():
	print("-- Game restarted --")
	visible = false;
	get_tree().reload_current_scene()
	get_node_or_null("/root/GlobalVar").playerCanFly = true;
	get_node_or_null("/root/GlobalVar").playerScore = 0;
	pass

func _on_button_menu_pressed():
	visible = false
	get_tree().change_scene("res://resources/scenes/ui/main_menu.tscn")
	pass

func _process(_delta):
	$ui_score/labelScore.text = str(get_node("/root/GlobalVar").playerBestScore)
	$ui_score/labelCurrentScore.text = str(get_node("/root/GlobalVar").playerScore)
	
	# Change UI button icons
	# If XOne controller
	if (Input.get_joy_name(0)):
		if (Input.get_joy_guid(0) == "__XINPUT_DEVICE__"):
			$buttons/gamepad_buttons/xbox.visible = true
			
		# If PS4 controller
		elif (Input.get_joy_guid(0) == "4c05c405000000000000504944564944"):
			$buttons/gamepad_buttons/ps4.visible = true
			
	# If gamepad isn't connected
	else:
		# Hide all gamepad's icons
		$buttons/gamepad_buttons/xbox.visible = false
		$buttons/gamepad_buttons/ps4.visible = false
	
	pass

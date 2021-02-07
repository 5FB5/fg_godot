extends Control

onready var _globalVar = get_node("/root/GlobalVar")

func _input(event):
	#Turn on pause menu if player has not lost
	if (_globalVar.playerCanFly == true):
		if (event.is_action_released("game_pause")):
			get_tree().paused = not get_tree().paused
			visible = not visible
		
			if (visible):
				Print.line(Print.PURPLE, "Game: Paused")
			else:
				Print.line(Print.PURPLE, "Game: Resumed")
	pass

func _on_button_resume_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	pass 

func changeSceneToMainMenu():
	Print.line(Print.PURPLE, "Game: Change scene to main_menu.tscn")
	get_tree().change_scene("res://resources/scenes/ui/main_menu.tscn")
	pass

func _on_button_menu_pressed():
	changeSceneToMainMenu()
	pass

# IDK why but it fixes problem with returning to main menu via gamepad
func _process(_delta):
	if (visible):
		if (Input.is_action_just_released("ui_cancel")):
			changeSceneToMainMenu()
		
		# Change UI button icons
		# If XOne controller
		if (Input.get_joy_name(0)):
			if (Input.get_joy_guid(0) == "__XINPUT_DEVICE__"):
				$gamepad_buttons/xbox.visible = true

			# If PS4 controller
			elif (Input.get_joy_guid(0) == "4c05c405000000000000504944564944"):
				$gamepad_buttons/ps4.visible = true
	
		# If gamepad isn't connected
		else:
			# Hide all gamepad's icons
			$gamepad_buttons/xbox.visible = false
			$gamepad_buttons/ps4.visible = false
	pass

extends Control

onready var _globalVar = get_node_or_null("/root/GlobalVar")

signal snd_play_record

signal uiXboxShow()
signal uiPs4Show()
signal uiXboxHide()
signal uiPs4Hide()

func changeSceneToMainMenu():
	Print.line(Print.PURPLE, "Game: Change scene to main_menu.tscn")
	get_tree().change_scene("res://resources/scenes/ui/main_menu.tscn")
	pass

func _input(event):
		if (visible):
			if (event.is_action_released("ui_accept")):
				$sounds/button_release.play()
				Print.line(Print.GREEN, "-- Game restarted --")
				visible = false;
				get_tree().reload_current_scene()
				get_node_or_null("/root/GlobalVar").playerCanFly = true;
				get_node_or_null("/root/GlobalVar").playerScore = 0;
			elif (event.is_action_released("ui_cancel")):
				$sounds/button_release.play()
				changeSceneToMainMenu()
			elif (event.is_action_pressed("ui_accept")):
				$sounds/button_click.play()
			elif (event.is_action_pressed("ui_cancel")):
				$sounds/button_click.play()
pass

func _on_button_restart_pressed():
	Print.line(Print.GREEN, "-- Game restarted --")
	visible = false;
	get_node("/root/GlobalVar").playerLastBestScore = get_node("/root/GlobalVar").playerBestScore
	get_tree().reload_current_scene()
	get_node_or_null("/root/GlobalVar").playerCanFly = true;
	get_node_or_null("/root/GlobalVar").playerScore = 0;
	pass

func _on_button_menu_pressed():
	visible = false
	changeSceneToMainMenu()
	pass

func _process(_delta):
	$ui_score/labelScore.text = str(get_node("/root/GlobalVar").playerBestScore)
	$ui_score/labelCurrentScore.text = str(get_node("/root/GlobalVar").playerScore)
	
	if (get_node("/root/GlobalVar").playerBestScore > get_node("/root/GlobalVar").playerLastBestScore):
		emit_signal("snd_play_record")
		$ui_score/labelNewRecord.show()
	else:
		$ui_score/labelNewRecord.hide()
	
	# Change UI button icons
	# If XOne controller
	if (Input.get_joy_name(0)):
		if (Input.get_joy_guid(0) == "__XINPUT_DEVICE__"):
			emit_signal("uiXboxShow")
			
		# If PS4 controller
		elif (Input.get_joy_guid(0) == "4c05c405000000000000504944564944"):
			emit_signal("uiPs4Show")
			
	# If gamepad isn't connected
	else:
		# Hide all gamepad's icons
		emit_signal("uiXboxHide")
		emit_signal("uiPs4Hide")
	pass

func _on_Control_uiXboxShow():
	$buttons/gamepad_buttons/xbox.visible = true
	pass 

func _on_Control_uiPs4Show():
	$buttons/gamepad_buttons/ps4.visible = true
	pass

func _on_Control_uiXboxHide():
	$buttons/gamepad_buttons/xbox.visible = false
	pass 
	
func _on_Control_uiPs4Hide():
	$buttons/gamepad_buttons/ps4.visible = false
	pass 

func _on_Control_snd_play_record():
	$sounds/snd_record.play()
	pass

func _on_button_restart_button_up():
	$sounds/button_release.play()
	pass

func _on_button_restart_button_down():
	$sounds/button_click.play()
	pass

func _on_button_menu_button_up():
	$sounds/button_release.play()
	pass

func _on_button_menu_button_down():
	$sounds/button_click.play()
	pass

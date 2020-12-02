extends Control

var isFullscreen

func _input(event):
	if (event.is_action_released("ui_accept")):
		get_tree().change_scene("res://resources/scenes/main.tscn")
	elif (event.is_action_released("ui_cancel")):
		get_tree().quit()
	pass

func _on_button_start_pressed():
	get_tree().change_scene("res://resources/scenes/main.tscn")
	pass

func _on_button_quit_pressed():
	get_tree().quit()
	pass

func _on_button_fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	
	if (bool(OS.window_fullscreen) == true):
		var fileFullscreen = File.new()
		fileFullscreen.open("user://settings.dat", File.WRITE)
		isFullscreen = 0
		fileFullscreen.store_32(int(isFullscreen))
		fileFullscreen.close()
	else:
		var fileFullscreen = File.new()
		fileFullscreen.open("user://settings.dat", File.WRITE)
		isFullscreen = 1
		fileFullscreen.store_32(int(isFullscreen))
		fileFullscreen.close()
	pass

func _ready():
	if (get_tree().paused):
		get_tree().paused = false
		get_node("/root/GlobalVar").playerCanFly = true
	else:
		get_node("/root/GlobalVar").playerCanFly = true
		get_node("/root/GlobalVar").playerScore = 0
	pass

func _process(_delta):
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

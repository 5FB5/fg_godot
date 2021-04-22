extends Control

signal achievementMaxActivate()

func changeSceneToMainGame():
	Print.line(Print.BLUE, "Game: Change scene to Main.tscn")
	get_tree().change_scene_to(get_node("/root/GlobalVar").mainscene)
	pass

func _input(event):
	# Activate MAX achievement
	# FIXME: json file doesn't updated in build's package
#
#	if (get_node("/root/GlobalVar").isFileJsonExists == true):
#		if (Input.is_key_pressed(KEY_M) and Input.is_key_pressed(KEY_A) and Input.is_key_pressed(KEY_X) and ($"/root/GlobalVar").achievementMax == 0):
#				emit_signal("achievementMaxActivate")
#
#				# Read data to write new
#				var filetmp = File.new()
#				filetmp.open("res://resources/achievements/data/achievements.json", File.READ)
#				var tmpdata = parse_json(filetmp.get_as_text())
#				filetmp.close()
#
#				tmpdata.values()[2]['is_have'] = 1
#				get_node("/root/GlobalVar").achievementMax = 1
#
#				# Write data to write
#				filetmp = File.new()
#				filetmp.open("res://resources/achievements/data/achievements.json", File.WRITE)
#				filetmp.store_string(JSON.print(tmpdata, " ", true))
#				filetmp.close()	
#
#				pass
#		pass
	
	# If user press any accept button, we go to play
	if (event.is_action_released("ui_accept")):
		changeSceneToMainGame()
	elif (event.is_action_released("ui_cancel")):
		get_node("/root/GlobalVar").quitSafe()
		
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
	
func _on_button_start_pressed():
	changeSceneToMainGame()
	pass

func _on_button_quit_pressed():
	get_node("/root/GlobalVar").quitSafe()
	pass

func _on_button_scoreboard_pressed():
	
	pass

func _on_button_fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	
	if (OS.window_fullscreen == true):
		var fileFullscreen = File.new()
		fileFullscreen.open("user://settings.dat", File.WRITE)
		fileFullscreen.store_32(int(1))
		get_node("/root/GlobalVar").isFullscreen = 1
		fileFullscreen.close()
		Print.line(Print.YELLOW, "Game: Fullscreen mode")
	else:
		var fileFullscreen = File.new()
		fileFullscreen.open("user://settings.dat", File.WRITE)
		fileFullscreen.store_32(int(0))
		get_node("/root/GlobalVar").isFullscreen = 0
		fileFullscreen.close()
		Print.line(Print.YELLOW, "Game: Window mode")
		
	pass

func _ready():
	Print.line(Print.YELLOW, "Game: Main menu loaded")
	if (get_tree().paused):
		get_tree().paused = false
		get_node("/root/GlobalVar").playerCanFly = true
	else:
		get_node("/root/GlobalVar").playerCanFly = true
		get_node("/root/GlobalVar").playerScore = 0
	pass


func _on_menuRoot_achievementMaxActivate():
	#$achievements.emit_signal("showAchievement", 2)
	pass # Replace with function body.


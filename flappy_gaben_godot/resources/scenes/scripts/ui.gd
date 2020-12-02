extends Control

func _process(_delta):
	# Change UI button icons
	# If XOne controller
	if (Input.get_joy_name(0) and get_node("Game Over").is_visible_in_tree() == false):
		if (Input.get_joy_guid(0) == "__XINPUT_DEVICE__"):
			$Menu/xbox.visible = true

		# If PS4 controller
		elif (Input.get_joy_guid(0) == "4c05c405000000000000504944564944"):
			$Menu/ps4.visible = true
	# If gamepad isn't connected
	else:
		# Hide all gamepad's icons
		$Menu/xbox.visible = false
		$Menu/ps4.visible = false
		
	if (Input.get_joy_name(0) and get_node("Pause").is_visible_in_tree() == true):
		$Menu.visible = false
	else:
		$Menu.visible = true

	pass

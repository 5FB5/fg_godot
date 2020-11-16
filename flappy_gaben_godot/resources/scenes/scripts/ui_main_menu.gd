extends Control

# If gamepad connected
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

func _ready():
	if (get_tree().paused):
		get_tree().paused = false
		get_node("/root/GlobalVar").playerCanFly = true
	pass

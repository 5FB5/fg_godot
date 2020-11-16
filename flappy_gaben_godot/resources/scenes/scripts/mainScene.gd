extends Node2D

# If death by tube
func _on_player__death():
	print("Code: Player _death signal emited")
	
	# Hide main score label
	get_node("ui_layer/UI/Score").visible = false
	print("UI: Score hidden")
	
	# Show game over screen
	get_node("ui_layer/UI/Game Over").visible = true
	get_node("ui_layer/UI/Game Over/labelScore").text = str(get_node("/root/GlobalVar").playerBestScore)
	pass

# If death by ceiling
func _on_player__death_ceiling():
	print("Code: Player _death_ceiling signal emited")
	
	# Hide main score label
	get_node("ui_layer/UI/Score").visible = false
	print("UI: Score hidden")
	
	# Show game over screen
	get_node("ui_layer/UI/Game Over").visible = true
	get_node("ui_layer/UI/Game Over/labelScore").text = str(get_node("/root/GlobalVar").playerBestScore)
	pass

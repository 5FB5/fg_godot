extends Node2D

onready var globalvar = get_node("/root/GlobalVar")

# If death by tube
func _on_player__death():
	print("Code: Player _death signal emited")
	
	# Hide main score label
	get_node("ui_layer/UI/Score").visible = false
	print("UI: Score hidden")
	
	# Show game over screen
	get_node("ui_layer/UI/Game Over").visible = true
	pass

# If death by ceiling
func _on_player__death_ceiling():
	print("Code: Player _death_ceiling signal emited")
	
	# Hide main score label
	get_node("ui_layer/UI/Score").visible = false
	print("UI: Score hidden")
	
	# Show game over screen
	get_node("ui_layer/UI/Game Over").visible = true
	pass

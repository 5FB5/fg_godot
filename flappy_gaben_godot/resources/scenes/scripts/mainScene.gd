extends Node2D

func _on_player__death():
	print("Code: Player _death signal emited")
	get_node("ui_layer/UI/Score").visible = false
	print("UI: Score hidden")
	get_node("ui_layer/UI/Game Over").visible = true
	pass

func _on_player__death_ceiling():
	print("Code: Player _death signal emited")
	get_node("ui_layer/UI/Score").visible = false
	print("UI: Score hidden")
	get_node("ui_layer/UI/Game Over").visible = true
	pass

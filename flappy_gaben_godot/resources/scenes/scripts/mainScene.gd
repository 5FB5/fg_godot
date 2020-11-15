extends Node2D

func _on_player__death():
	print("Code: Player _death signal emited")
	get_node("ui_layer/UI/Score").visible = false
	print("UI: Score hidden")
	pass

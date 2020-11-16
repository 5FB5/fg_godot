extends Node2D

func _on_player__death():
	print("Code: Player _death signal emited")
	get_node("ui_layer/UI/Score").visible = false
	print("UI: Score hidden")
	get_node("ui_layer/UI/Game Over").visible = true
	get_node("ui_layer/UI/Game Over/labelScore").text = str(get_node("/root/GlobalVar").playerBestScore)
	pass

func _on_player__death_ceiling():
	print("Code: Player _death_ceiling signal emited")
	get_node("ui_layer/UI/Score").visible = false
	print("UI: Score hidden")
	get_node("ui_layer/UI/Game Over").visible = true
	get_node("ui_layer/UI/Game Over/labelScore").text = str(get_node("/root/GlobalVar").playerBestScore)
	pass

extends Control

func _input(event):
	if (event.is_action_pressed("game_pause")):
		get_tree().paused = not get_tree().paused
		visible = not visible
		
		if (visible):
			print("Game: Paused")
		else:
			print("Game: Resumed")
	pass

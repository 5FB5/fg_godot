extends Control

onready var _globalVar = get_node("/root/GlobalVar")

func _input(event):
	#Turn on pause menu if player has not lost
	if (_globalVar.playerCanFly == true):
		if (event.is_action_pressed("game_pause")):
			get_tree().paused = not get_tree().paused
			visible = not visible
		
			if (visible):
				print("Game: Paused")
			else:
				print("Game: Resumed")
	pass

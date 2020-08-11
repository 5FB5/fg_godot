extends Node2D

var playerScore: int = 0
var isPaused: bool = false

func _process(delta):
	#Pause
	if (Input.is_action_just_pressed("game_pause")):
		isPaused = true	

	if (isPaused):
		$ui_layer/UI/pause.show()
		get_tree().paused = true
		
	pass

func _on_player__death():
	print("Code: Player _death signal emited")
	pass

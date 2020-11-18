#Script that store all global variables
extends Node

var screenSize

var playerCanFly: bool = true

var playerScore: int = 0
var playerBestScore: int = 0

func _input(event):
	# If gamepad is connected
	if (Input.get_joy_name(0)):
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if (event.is_action_pressed("window_fullscreen")):
		OS.window_fullscreen = !OS.window_fullscreen
			
	pass

func loadBestScore():
	var fileBestScoreLoad = File.new()
	
	fileBestScoreLoad.open("user://best_score.dat", File.READ)
	playerBestScore = fileBestScoreLoad.get_32()
	fileBestScoreLoad.close()
	
	print("Code: loadBestScore()")
	pass

func _ready():
	loadBestScore()
	screenSize = get_viewport().size #Get screen size as global var
	pass

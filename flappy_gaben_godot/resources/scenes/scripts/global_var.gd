#Script that store all global variables
extends Node

var screenSize
var isFullscreen: int = 0

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
		
		if (bool(OS.window_fullscreen) == true):
			var fileFullscreen = File.new()
			fileFullscreen.open("user://settings.dat", File.WRITE)
			fileFullscreen.store_32(int(1))
			fileFullscreen.close()
		else:
			var fileFullscreen = File.new()
			fileFullscreen.open("user://settings.dat", File.WRITE)
			fileFullscreen.store_32(int(0))
			fileFullscreen.close()
	pass

func loadBestScore():
	var fileBestScoreLoad = File.new()
	
	fileBestScoreLoad.open("user://best_score.dat", File.READ)
	playerBestScore = fileBestScoreLoad.get_32()
	fileBestScoreLoad.close()
	
	print("Code: loadBestScore()")
	pass

func setFullscreen():
	var file = File.new()
	file.open("user://settings.dat", File.READ)
	isFullscreen = file.get_32()
	print(isFullscreen)
	file.close()
	
	if (isFullscreen == 0):
		OS.window_fullscreen = false
	else:
		OS.window_fullscreen = true
	pass

func _ready():
	loadBestScore()
	setFullscreen()
	screenSize = get_viewport().size #Get screen size as global var
	pass

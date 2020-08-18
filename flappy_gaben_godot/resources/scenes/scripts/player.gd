extends RigidBody2D

signal _death

export var jumpForce: 	int = 26000
export var gravityForce: 	int = 1056

#Getting all global vars we need
onready var _globalVars = get_node("/root/GlobalVar")

#Saving best score in file
func saveBestScore(_value):
	var fileBestScoreSave = File.new()
	
	fileBestScoreSave.open("user://best_score.dat", File.WRITE)
	fileBestScoreSave.store_32(int(_value))
	fileBestScoreSave.close()
	
	print("Code: saveBestScore() activated")
	pass

#Loading current best score from file
func loadBestScore():
	var fileBestScoreLoad = File.new()
	
	fileBestScoreLoad.open("user://best_score.dat", File.READ)
	_globalVars.playerBestScore = fileBestScoreLoad.get_32()
	fileBestScoreLoad.close()
	
	print("Code: loadBestScore() activated")
	pass

#Signal for death function for once activation
func _on_player__death():
	print("-- Player Death --")
	#If player's current score is more than best score we have
	if (_globalVars.playerScore > _globalVars.playerBestScore):
		_globalVars.playerBestScore = _globalVars.playerScore
		saveBestScore(_globalVars.playerBestScore) #Save progress
	
	self.hide()
	print("Code: Player.hide()")
	print("Game: Best score = ", _globalVars.playerBestScore, ". Game over!")
	print("-- END Player Death --")
	pass

#Death function if player collides with tube	
func death_tubeCollision():
	linear_velocity.y += 50
	
	if (position.y > _globalVars.screenSize.y + 600): #When player's drop position more than screen size we hide him
		emit_signal("_death")
	pass

#Player jumping function
func jump(_delta):
	if (_globalVars.playerCanFly):
		linear_velocity.y -= jumpForce * _delta
	pass

#Basic settings for player
func _ready():
	#Load best score from file on start
	loadBestScore()
	print("Code: Player spawned")
	pass

#Main function
func _process(delta):
	if (_globalVars.playerCanFly):
			linear_velocity.y += gravityForce * delta #Player's droping
				
			if (Input.is_action_just_pressed("player_jump")):
				jump(delta)
			
			 #When player's drop position more than screen size in game loop we hide him
			if ((position.y > _globalVars.screenSize.y + 600) || (position.y < _globalVars.screenSize.y - 750)):
				emit_signal("_death")
				
	else: #Main death function if canFly is false
		death_tubeCollision()
	pass


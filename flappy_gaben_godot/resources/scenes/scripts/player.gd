extends RigidBody2D

signal _death
signal _death_ceiling

export var jumpForce: 	int = 26000
export var gravityForce: 	int = 1056

#Getting all global vars we need
onready var _globalVars = get_node_or_null("/root/GlobalVar")

#Saving best score in file
func saveBestScore(_value):
	var fileBestScoreSave = File.new()
	
	fileBestScoreSave.open("user://best_score.dat", File.WRITE)
	fileBestScoreSave.store_32(int(_value))
	fileBestScoreSave.close()
	
	print("Code: saveBestScore()")
	pass

#Signal for death function for once activation
func _on_player__death():
	print("-- Player Death --")
	_globalVars.playerCanFly = false
	print("Code: _globalVar.canFly = ", _globalVars.playerCanFly)
	
	#If player's current score is more than best score we have
	if (_globalVars.playerScore > _globalVars.playerBestScore):
		_globalVars.playerBestScore = _globalVars.playerScore
		saveBestScore(_globalVars.playerBestScore) #Save progress
	
	self.hide()
	print("Code: Player.hide()")
	print("Game: Best score = ", _globalVars.playerBestScore, ". Game over!")
	print("-- END Player Death --")
	pass

func _on_player__death_ceiling():
	print("-- Player Death (ceiling) --")
	
	_globalVars.playerCanFly = false
	print("Code: _globalVar.canFly = ", _globalVars.playerCanFly)
	
	#If player's current score is more than best score we have
	if (_globalVars.playerScore > _globalVars.playerBestScore):
		_globalVars.playerBestScore = _globalVars.playerScore
		saveBestScore(_globalVars.playerBestScore) #Save progress
	
	if ((position.y > _globalVars.screenSize.y + 600)):
		self.hide()
		
	print("Code: Player.hide()")
	print("-- END Player Death --")
	pass

#Death function if player collides with tube	
func death_tubeCollision():
	linear_velocity.y += 50
	
	if (position.y > _globalVars.screenSize.y + 600): #When player's drop position more than screen size we hide him
		emit_signal("_death")
	pass

#Death function if player collides with tube	
func death_ceilingCollision():
	emit_signal("_death_ceiling")
	linear_velocity.y += 50
	pass

#Player jumping function
func jump(_delta):
	if (_globalVars.playerCanFly):
		linear_velocity.y -= jumpForce * _delta
		$Sprite.rotation_degrees = -3
	pass

#Basic settings for player
func _ready():
	# Set basic position
	position = Vector2(184, 200)

	print("Code: Player spawned")
	pass

#Main function
func _process(delta):
	if (_globalVars.playerCanFly == true):
			linear_velocity.y += gravityForce * delta #Player's droping
			$Sprite.rotation_degrees += 0.35
				
			if (Input.is_action_just_pressed("player_jump")):
				jump(delta)
			
			if (Input.is_action_just_pressed("game_pause")):
				linear_velocity.y = 0
			
			 #When player's drop position more than screen size in game loop we hide him
			if ((position.y > _globalVars.screenSize.y + 600)):
				emit_signal("_death")
			elif (position.y < _globalVars.screenSize.y - 780):
				death_ceilingCollision()
				
	else: #Main death function if canFly is false
		death_tubeCollision()
	pass

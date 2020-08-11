extends Area2D

export var tubeSpeed: int = 400

#Getting global vars we need
onready var _globalVar  = get_node("/root/GlobalVar")

#Basic movement for tube
func _process(delta):
	position.x -= tubeSpeed * delta
	pass

#If tube exited screen then just delete
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print ("Game: Tube deleted")
	pass

#If coin trigger collides with player then we increase score
func _on_Area2D_body_entered(body):
	var playerVars = get_node("/root/PlayerVars")
	
	if (_globalVar.playerCanFly == true):	
		var gameVars = get_node("/root/MainGameVars")
		gameVars.playerScore = gameVars.playerScore + 1
		
		print("Game: Player score: ", gameVars.playerScore)
	pass

#If tube collides with player then we set player canFly var to false (defeat)
func _on_RigidBody2D_body_entered(body):
	var _globalVar = get_node("/root/GlobalVar")
	_globalVar.playerCanFly = false 
	
	print("Code: _globalVar.canFly = ", _globalVar.playerCanFly)
	pass

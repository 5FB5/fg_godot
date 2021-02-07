extends Area2D

export var tubeSpeed: int = 400

#Getting global vars we need
onready var _globalVar = get_node_or_null("/root/GlobalVar")

#Basic movement for tube
func _process(delta):
	position.x -= tubeSpeed * delta
	Engine.get_physics_interpolation_fraction()
	pass

#If tube exited screen then just delete
func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
	Print.line(Print.PURPLE, "Game: Tube deleted")
	pass

#If coin trigger collides with player then we increase score
func _on_Area2D_body_entered(_body):
	if (_globalVar.playerCanFly == true):	
		_globalVar.playerScore = _globalVar.playerScore + 1	
		print("Game: Player score = ", _globalVar.playerScore)
	pass

#If tube collides with player then we set player canFly var to false (defeat)
func _on_RigidBody2D_body_entered(_body):
	_globalVar.playerCanFly = false
	Print.line(Print.CYAN, "Game: Player collides with tube")
	pass

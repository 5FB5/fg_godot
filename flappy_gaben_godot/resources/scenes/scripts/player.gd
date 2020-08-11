extends RigidBody2D

signal _death

export var jumpForce: 	int = 26000
export var gravityForce: 	int = 1056

#Getting all global vars we need
onready var _globalVars = get_node("/root/GlobalVar")

var screenSize

#Signal for death function for once activation
func _on_player__death():
	self.hide()
	print("Code: Player.hide()")
	pass

#Basic settings for player
func _ready():
	screenSize = get_viewport_rect().size
	
	print("Code: Player spawned")
	pass

#Death function if player collides with tube	
func death():
	linear_velocity.y += 50
	
	if (position.y > screenSize.y): #When player's drop position more than screen size we hide him
		emit_signal("_death")
	pass

#Player jumping function
func jump(_delta):
	if (_globalVars.playerCanFly):
		linear_velocity.y -= jumpForce * _delta
	pass

#Main function
func _process(delta):
	if (_globalVars.playerCanFly):
			linear_velocity.y += gravityForce * delta #Player's droping
				
			if (Input.is_action_just_pressed("player_jump")):
				jump(delta)
			
			if ((position.y > screenSize.y) || (position.y < screenSize.y - 1128)): #When player's drop position more than screen size we hide him
				emit_signal("_death")
				
	else: #defeat things if canFly is false
		death()
	pass


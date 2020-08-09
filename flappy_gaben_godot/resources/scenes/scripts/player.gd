extends RigidBody2D

signal _death

export var jumpForce = 50
export var gravityForce = 10

var canFly
var screenSize

#Signal for death function for once activation
func _on_player__death():
	self.hide()
	print("Game: Player hided")
	pass

#Basic settings for player
func _ready():
	var playerVars = get_node("/root/PlayerVars")
	screenSize = get_viewport_rect().size
	
	playerVars.canFly = true
	pass

#Death function if player collides with tube	
func death():
	linear_velocity.y += 50
	
	if (position.y > screenSize.y): #When player's drop position more than screen size we hide him
		emit_signal("_death")
	pass

#Player jumping function
func jump(_delta):
	if (PlayerVars.canFly):
		linear_velocity.y -= jumpForce * _delta
	pass

#Main function
func _process(delta):
	if (PlayerVars.canFly):
			linear_velocity.y += gravityForce * delta
				
			if (Input.is_action_just_pressed("player_jump")):
				jump(delta)
			
			if (position.y > screenSize.y): #When player's drop position more than screen size we hide him
				emit_signal("_death")
				
	else: #defeat things if canFly is false
		death()
	pass

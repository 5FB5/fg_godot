extends RigidBody2D

export var jumpForce = 50
export var gravityForce = 10

var canFly = true
	
func jump(_delta):
	linear_velocity.y -= jumpForce * _delta
	pass
	
func _process(delta):
	linear_velocity.y += gravityForce * delta
	
	if (canFly):
		if (Input.is_action_just_pressed("player_jump")):
			jump(delta)
	else: #code of tube collison detection
		print("Engine: Tube collision detected")
	pass

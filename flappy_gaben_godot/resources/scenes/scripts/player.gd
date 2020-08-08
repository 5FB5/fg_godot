extends RigidBody2D

export var jumpForce = 50
export var gravityForce = 10

signal playerHit
	
func jump(_delta):
	linear_velocity.y -= jumpForce * _delta #Vector2(linear_velocity.x, linear_velocity.y - jumpForce)
	pass
	
func _process(delta):
	linear_velocity.y += gravityForce * delta
	
	if (Input.is_action_just_pressed("player_jump")):
		jump(delta)
	pass

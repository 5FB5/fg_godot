extends RigidBody2D

export var jumpForce = 50
export var gravityForce = 10

signal playerHit

func _ready():
	set_physics_process(true)
	
func jump():
	linear_velocity = Vector2(linear_velocity.x, linear_velocity.y - jumpForce)
	
func _physics_process(delta):
	linear_velocity = Vector2(linear_velocity.x, linear_velocity.y + gravityForce * delta)

func _process(delta):
	if (Input.is_action_just_pressed("player_jump")):
		jump()
	

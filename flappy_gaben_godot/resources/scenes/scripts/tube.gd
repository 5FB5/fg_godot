extends Area2D

export var tubeSpeed = 400

func _process(delta):
	position.x -= tubeSpeed * delta
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print ("Game: Tube deleted")
	pass

func _on_Area2D_body_entered(body):
	print("Game: Player score +1")
	pass

func _on_RigidBody2D_body_entered(body):
	var _playerVars = get_node("/root/PlayerVars")	
	_playerVars.canFly = false	
	print("Game: player.canFly = ", _playerVars.canFly)
	pass

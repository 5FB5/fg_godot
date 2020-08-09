extends Area2D

export var tubeSpeed = 400

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
	if (playerVars.canFly == true):	
		print("Game: Player score +1")
	pass

#If tube collides with player then we set player canFly var to false (defeat)
func _on_RigidBody2D_body_entered(body):
	var playerVars = get_node("/root/PlayerVars")	
	playerVars.canFly = false	
	
	print("Game: player.canFly = ", playerVars.canFly)
	pass

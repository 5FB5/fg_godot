extends Node2D

#We should see this node's sprite only in editor
func _ready():
	$Sprite.hide()
	pass

#Main spawning func that load tube's instance and set his position	
func spawnTube():
	var newTube = load("res://resources/scenes/tube/tube.tscn").instance()
	add_child(newTube)
	newTube.add_to_group("Tubes")
	
	newTube.position = Vector2(2144, rand_range(255, 590))

	pass

#Timer function that activate spawnTube() func at a specific time
func _on_Timer_timeout():
	spawnTube()
	Print.line(Print.PURPLE, "Game: New tube spawned")
	pass

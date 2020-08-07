extends Node2D

func _ready():
	$Sprite.hide() # sprite is only for editor mode

func spawnTube():
	var newTube = preload("res://resources/scenes/tube.tscn").instance()
	add_child(newTube)
	newTube.position = Vector2(2144, rand_range(255, 620))
	pass

func _on_Timer_timeout():
	spawnTube()
	print ("Game: New tube spawned")
	pass # Replace with function body.

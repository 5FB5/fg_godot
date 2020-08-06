extends RigidBody2D

export var tubeSpeed = 400

func _process(delta):
	position.x -= tubeSpeed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

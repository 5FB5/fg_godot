# Fix for player velocity bug that increases his linear velocity about -3000+ units on start
extends Timer

signal timerWorks

func _process(delta):
	if (!is_stopped()):
		emit_signal("timerWorks")

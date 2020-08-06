extends Node2D

signal testSignal


func _on_Timer_timeout():
	$player.visible = !$player.visible

func _ready():
	emit_signal("testSignal")
	$Timer.connect("timeout", self, "_on_Timer_timeout")

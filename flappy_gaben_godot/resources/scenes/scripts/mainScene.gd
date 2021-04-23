extends Node2D

onready var globalvar = get_node("/root/GlobalVar")

var arrayMusic = []

# If death by tube
func _on_player__death():
	Print.line(Print.YELLOW, "Code: Player _death signal emited")
	
	# Hide main score label
	get_node("ui_layer/UI/Score").visible = false
	Print.line(Print.YELLOW, "UI: Current Score label hidden")
	
	# Show game over screen
	get_node("ui_layer/UI/Game Over").visible = true
	Print.line(Print.YELLOW, "UI: Game Over screen activated")
	pass

# If death by ceiling
func _on_player__death_ceiling():
	Print.line(Print.YELLOW, "Code: Player _death_ceiling signal emited")
	
	# Hide main score label
	get_node("ui_layer/UI/Score").visible = false
	Print.line(Print.YELLOW, "UI: Current Score label hidden")
	
	# Show game over screen
	get_node("ui_layer/UI/Game Over").visible = true
	Print.line(Print.YELLOW, "UI: Game Over screen activated")
	pass

func setRandomMusic(a:Array):
	a.shuffle()
	
	$AudioStreamPlayer.stream = arrayMusic.front()
	$AudioStreamPlayer.play()
	pass

func _ready():
	randomize()
	
	arrayMusic.append(preload("res://resources/snd/music/Stop-a-Gaben.ogg"))
	#arrayMusic.append(preload("res://resources/snd/music/Gaben-Song.ogg"))
	arrayMusic.append(preload("res://resources/snd/music/track1.ogg"))
#
#	$AudioStreamPlayer.stream = arrayMusic.front()
#	$AudioStreamPlayer.play()
	pass

func _on_music_finished():
	setRandomMusic(arrayMusic)
	pass

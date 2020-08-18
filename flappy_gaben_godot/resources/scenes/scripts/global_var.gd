#Script that store all global variables
extends Node

var screenSize

var playerCanFly: bool = true

var playerScore: int = 0
var playerBestScore: int = 0

func _ready():
	screenSize = get_viewport().size #Get screen size as global var
	pass

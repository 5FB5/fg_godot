extends Label

func _ready():
	var screenSize = get_viewport_rect().size
	
	pass

func _process(delta):
	var _text = get_node("/root/MainGameVars").playerScore
	self.text = str(_text)
	pass

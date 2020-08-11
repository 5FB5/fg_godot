#Draw current player score
extends Label

#Getting viewport's size on start
func _ready():
	var screenSize = get_viewport_rect().size
	pass

func _process(delta):
	var _text = get_node("/root/MainGameVars").playerScore #we must get current score from player's vars
	self.text = str(_text) #and draw it
	pass

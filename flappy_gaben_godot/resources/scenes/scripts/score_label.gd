#Draw current player score
extends Label

func _process(delta):
	var _text = get_node("/root/GlobalVar").playerScore #we must get current score from player's vars
	self.text = str(_text) #and draw it
	pass

extends Label

var accum = 0

func _ready():
	add_to_group("labels")

func _process(delta):
	accum += delta
	text = str(accum)

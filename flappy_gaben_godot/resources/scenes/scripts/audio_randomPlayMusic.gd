extends AudioStreamPlayer

const tracks = [
	"Gaben-Song",
	"Stop-a-Gaben",
	"track1"
	]

func playRandomSong(): 
	var ran = randi() % tracks.size()
	var audiostream = load('res://resources/snd/music/' + tracks[ran] + '.ogg')
	
	self.stream = audiostream
	Print.line(Print.YELLOW, "Game: [Music] Now playing: " + str(tracks[ran]))
	play()
	pass

func _ready():
	connect("finished", self, "playRandomSong")
	playRandomSong()
	pass

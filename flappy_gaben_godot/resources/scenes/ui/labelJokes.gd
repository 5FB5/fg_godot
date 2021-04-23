# Splash text generator
extends Label

func _ready():
	var splash = ['How about some Prutsky?', 'Now with V-Sync!', 'Endless!', 'Not inspired by Flappy Bird!', 'by 5FB5 :3', 'LOL!', 'OpenGL ES3!', 'I hope it was worth the wait!', '0% money!', 'Multithreaded!', 'I dont think Valve will see it!', 'Made with Godot!', 'misingno!', 'uuddlrlrbastart', '0x10c!', 'Minecraft is my life!', 'I love GameJolt!', 'A joke out of control!', 'Waiting for Godot 4.0!', 'Now without raytracing!', 'Hot coffee?', 'Greetings!', '[Funny splash text here]!', 'Freeman, you fool!', 'Haha, LEL!', 'Almost original game!', 'No skins!', 'Made using code!', 'Check it out!', 'IDDQD!', 'HL3!', 'Not made with Unity!', 'Check VNN!']
	randomize()
	var current_text = splash[rand_range(0, splash.size())]
	self.text = current_text
	pass
	
func _process(_delta):
	randomize()
	pass
	

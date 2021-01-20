extends Control

var fileJsonExists = false

signal achievement20TubesShow
signal achievement50TubesShow
signal achievementMaxShow

func _ready():
	var file = File.new()
	if (file.file_exists("res://resources/achievements/data/achievements.json")):
		fileJsonExists = true
	else:
		fileJsonExists = false
	file.close()

func _process(_delta):
	# Change UI button icons
	# If XOne controller
	if (Input.get_joy_name(0) and get_node("Game Over").is_visible_in_tree() == false):
		if (Input.get_joy_guid(0) == "__XINPUT_DEVICE__"):
			$Menu/xbox.visible = true

		# If PS4 controller
		elif (Input.get_joy_guid(0) == "4c05c405000000000000504944564944"):
			$Menu/ps4.visible = true
	# If gamepad isn't connected
	else:
		# Hide all gamepad's icons
		$Menu/xbox.visible = false
		$Menu/ps4.visible = false
		
	if (Input.get_joy_name(0) and get_node("Pause").is_visible_in_tree() == true):
		$Menu.visible = false
	else:
		$Menu.visible = true

	# Check is player get an achievement
	if (fileJsonExists == true):
		# 20 Tubes achievement
		if (get_node("/root/GlobalVar").playerBestScore >= 20 and get_node("/root/GlobalVar").achievement20Tubes == 0):
			emit_signal("achievement20TubesShow")

			# Read data to write new
			var filetmp = File.new()
			filetmp.open("res://resources/achievements/data/achievements.json", File.READ)
			var tmpdata = parse_json(filetmp.get_as_text())
			filetmp.close()
			
			tmpdata.values()[0]['is_have'] = 1
			get_node("/root/GlobalVar").achievement20Tubes = 1
			
			# Write data to write
			filetmp = File.new()
			filetmp.open("res://resources/achievements/data/achievements.json", File.WRITE)
			filetmp.store_string(JSON.print(tmpdata, " ", true))
			filetmp.close()	
		# 50 Tubes achievement
		elif (get_node("/root/GlobalVar").playerBestScore >= 50 and get_node("/root/GlobalVar").achievement50Tubes == 0):
			emit_signal("achievement50TubesShow")

			# Read data to write new
			var filetmp = File.new()
			filetmp.open("res://resources/achievements/data/achievements.json", File.READ)
			var tmpdata = parse_json(filetmp.get_as_text())
			filetmp.close()
			
			tmpdata.values()[1]['is_have'] = 1
			get_node("/root/GlobalVar").achievement50Tubes = 1
			
			# Write data to write
			filetmp = File.new()
			filetmp.open("res://resources/achievements/data/achievements.json", File.WRITE)
			filetmp.store_string(JSON.print(tmpdata, " ", true))
			filetmp.close()
	pass

func _on_UI_achievement20TubesShow():
	$achievements.emit_signal("showAchievement", 0)
	pass 


func _on_UI_achievement50TubesShow():
	$achievements.emit_signal("showAchievement", 1)
	pass


func _on_UI_achievementMaxShow():
	$achievements.emit_signal("showAchievement", 2)
	pass

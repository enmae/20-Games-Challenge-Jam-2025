extends CanvasLayer

var continue_level_scene

func _ready() -> void:
	$%YesButton.pressed.connect(on_yes_button_pressed)
	$%NoButton.pressed.connect(on_no_button_pressed)
	GameEvents.game_over.connect(on_game_over)

func on_game_over(continue_level: Node):
	print("testing")
	continue_level_scene = continue_level
	print("continue scene ", continue_level_scene)
	# var level_path_string = "res://" + continue_level_path + ".tscn"
	# continue_level = "res://" + continue_level_path + ".tscn"
	# continue_level_scene = load(level_path_string).instantiate()
	
func on_yes_button_pressed():
	#TODO: Subtract a continue + update label
	
	get_tree().change_scene_to_file(GameEvents.last_played_level)

func on_no_button_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen/title_screen.tscn")

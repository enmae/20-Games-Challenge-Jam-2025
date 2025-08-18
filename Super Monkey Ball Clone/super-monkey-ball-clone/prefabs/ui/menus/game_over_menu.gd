extends CanvasLayer

var continue_level

func _ready() -> void:
	$%YesButton.pressed.connect(on_yes_button_pressed)
	$%NoButton.pressed.connect(on_no_button_pressed)
	GameEvents.game_over.connect(on_game_over)

func on_game_over(continue_level_path: String):
	# var level_path_string = "res://" + continue_level_path + ".tscn"
	continue_level = "res://" + continue_level_path + ".tscn"
	# continue_level_scene = load(level_path_string).instantiate()
	
func on_yes_button_pressed():
	#TODO: Subtract a continue + update label
	print(continue_level)
	get_tree().change_scene_to_file(continue_level)
	queue_free()

func on_no_button_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen/title_screen.tscn")

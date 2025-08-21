extends CanvasLayer

var continue_level_scene

func _ready() -> void:
	$%YesButton.pressed.connect(on_yes_button_pressed)
	$%NoButton.pressed.connect(on_no_button_pressed)
	$%ContinuesLabel.text = "You have " + str(GameEvents.continues) + " continues remaining"

func reset():
	GameEvents.continues = GameEvents.MAX_CONTINUES
	GameEvents.total_score = 0

func on_yes_button_pressed():
	if (GameEvents.continues > 0):
		GameEvents.continues -= 1
		get_tree().change_scene_to_file(GameEvents.last_played_level)

func on_no_button_pressed():
	reset()
	get_tree().change_scene_to_file("res://scenes/title_screen/title_screen.tscn")

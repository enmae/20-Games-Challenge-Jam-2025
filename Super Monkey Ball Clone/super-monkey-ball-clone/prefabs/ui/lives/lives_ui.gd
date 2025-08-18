extends CanvasLayer

@onready var life_image = preload("res://prefabs/ui/lives/life_image.tscn")
@onready var life_container = $%LifeContainer

var lives = 0

func _ready() -> void:
	GameEvents.life_added.connect(on_life_added)
	GameEvents.life_removed.connect(on_life_removed)

func on_life_added():
	var life_image_scene = life_image.instantiate()
	life_container.add_child(life_image_scene)
	lives += 1

func on_life_removed():
	lives -= 1

	if (lives < 0):
		var current_scene = get_tree().get_current_scene()
		print(current_scene)
		GameEvents.emit_game_over(current_scene)
		get_tree().change_scene_to_file("res://scenes/game_over_screen/game_over_screen.tscn")
	elif (lives > 0):
		var child = life_container.get_child(0)
		life_container.remove_child(child)
		child.queue_free()
		GameEvents.emit_reset_player_position()

extends Node3D

signal next_level

@export var levels : Array[PackedScene] = []

var current_level := 0

func _ready() -> void:
	next_level.connect(on_next_level)

func change_level(level_index: int):
	current_level = level_index
	if (current_level >= levels.size()):
		get_tree().change_scene_to_file("res://prefabs/ui/menus/credits_text.tscn")
	else:
		get_tree().change_scene_to_packed(levels[current_level])

func on_next_level():
	change_level(current_level + 1)
	GameEvents.reset_for_next_level()

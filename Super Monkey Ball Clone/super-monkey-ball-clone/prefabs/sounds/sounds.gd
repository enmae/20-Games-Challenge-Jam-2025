extends Node

@export var level_music: AudioStream
@export var level_volume_linear := 1.0

@onready var bg_music: AudioStreamPlayer = %BGMusic

func _ready() -> void:
	bg_music.stream = level_music
	bg_music.volume_linear = level_volume_linear
	bg_music.play()

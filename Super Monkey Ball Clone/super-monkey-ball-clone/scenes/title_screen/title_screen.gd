extends Node3D

var settings_menu = preload("res://prefabs/ui/menus/settings_menu.tscn")

@export var start_level := ""

func _ready() -> void:
	$%SettingButton.pressed.connect(on_settings_pressed)
	$%QuitButton.pressed.connect(on_quit_pressed)
	$%CreditsButton.pressed.connect(on_credits_pressed)
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(start_level)

func on_settings_pressed():
	var settings_instance = settings_menu.instantiate()
	add_child(settings_instance)
	settings_instance.back_pressed.connect(on_settings_closed.bind(settings_instance))

func on_settings_closed(settings_instance: Node):
	settings_instance.queue_free()

func on_quit_pressed():
	get_tree().quit()

func on_credits_pressed():
	get_tree().change_scene_to_file("res://prefabs/ui/menus/credits_text.tscn")

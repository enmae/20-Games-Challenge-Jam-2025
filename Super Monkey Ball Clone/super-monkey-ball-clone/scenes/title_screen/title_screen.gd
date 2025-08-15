extends Node3D

var settings_menu = preload("res://prefabs/ui/settings/settings_menu.tscn")

func _ready() -> void:
    $%SettingButton.pressed.connect(on_settings_pressed)
    $%QuitButton.pressed.connect(on_quit_pressed)

func _on_start_button_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/greybox/greybox.tscn")

func on_settings_pressed():
    var settings_instance = settings_menu.instantiate()
    add_child(settings_instance)
    settings_instance.back_pressed.connect(on_settings_closed.bind(settings_instance))

func on_settings_closed(settings_instance: Node):
    settings_instance.queue_free()

func on_quit_pressed():
    get_tree().quit()
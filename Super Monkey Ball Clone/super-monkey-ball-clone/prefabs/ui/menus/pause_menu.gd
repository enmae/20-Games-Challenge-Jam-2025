extends CanvasLayer

var settings_menu = preload("res://prefabs/ui/menus/settings_menu.tscn")

func _ready() -> void:
    get_tree().paused = true

    $%ResumeButton.pressed.connect(on_resume_button_pressed)
    $%SettingsButton.pressed.connect(on_settings_button_pressed)
    $%MainMenuButton.pressed.connect(on_main_menu_button_pressed)

func _unhandled_input(event: InputEvent) -> void:
    if (event.is_action_pressed("pause")):
        close()
        get_tree().root.set_input_as_handled()

func close():
    get_tree().paused = false
    queue_free()

func on_resume_button_pressed():
    close()

func on_settings_button_pressed():
    var settings_instance = settings_menu.instantiate()
    add_child(settings_instance)
    settings_instance.back_pressed.connect(on_settings_closed.bind(settings_instance))

func on_main_menu_button_pressed():
    close()
    get_tree().change_scene_to_file("res://scenes/title_screen/title_screen.tscn")

func on_settings_closed(settings_instance: Node):
    settings_instance.queue_free()
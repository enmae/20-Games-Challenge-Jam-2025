extends CanvasLayer

signal back_pressed

@onready var master_slider = $%MasterVolumeSlider
@onready var sfx_slider = $%SFXVolumeSlider
@onready var music_slider = $%MusicVolumeSlider
@onready var back_button = $%BackButton

func _ready():
	back_button.pressed.connect(on_back_button_pressed)
	master_slider.value_changed.connect(on_audio_slider_changed.bind("Master"))
	sfx_slider.value_changed.connect(on_audio_slider_changed.bind("SFX"))
	music_slider.value_changed.connect(on_audio_slider_changed.bind("Music"))

func get_bus_volume_percent(bus_name: String):
	var bus_index = AudioServer.get_bus_index(bus_name)
	var volume_db = AudioServer.get_bus_volume_db(bus_index)
	return db_to_linear(volume_db)

func set_bus_volume_percent(bus_name: String, percent: float):
	var bus_index = AudioServer.get_bus_index(bus_name)
	var volume_db = linear_to_db(percent)
	AudioServer.set_bus_volume_db(bus_index, volume_db)

func on_audio_slider_changed(value: float, bus_name: String):
	set_bus_volume_percent(bus_name, value)

func on_back_button_pressed():
	back_pressed.emit()

extends CanvasLayer

@export var level_time: float

@onready var timer: Timer = $%Timer
@onready var timer_label: Label = $%TimerLabel

func _ready() -> void:
	timer.wait_time = level_time
	timer.start()

	timer.timeout.connect(on_timer_timeout)
	GameEvents.level_completed.connect(on_level_completed)

func _process(_delta: float) -> void:
	timer_label.text = str("%2.2f" % timer.time_left) + "s"

func on_timer_timeout():
	GameEvents.emit_life_removed()

func on_level_completed():
	timer.paused = true
	GameEvents.time_remaining = timer.time_left
	
	var half_level_time = level_time / 2

	if (timer.time_left >= half_level_time):
		GameEvents.is_within_half_level_time = true

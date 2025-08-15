extends CanvasLayer

@export var level_time: float

@onready var timer: Timer = $%Timer
@onready var timer_label: Label = $%TimerLabel

func _ready() -> void:
	timer.wait_time = level_time
	#timer.start()

	timer.timeout.connect(on_timer_timeout)

func _process(_delta: float) -> void:
	timer_label.text = str("%2.2f" % timer.time_left) + "s"

func on_timer_timeout():
	GameEvents.emit_life_removed()
	## TODO: Reset level + send player to start
	

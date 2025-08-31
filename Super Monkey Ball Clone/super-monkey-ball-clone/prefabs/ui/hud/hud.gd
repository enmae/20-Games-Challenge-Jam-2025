extends CanvasLayer

@onready var lives_ui = $%LivesUI
@onready var fish_count = $%FishCount
@onready var total_score = $%TotalScore
@onready var speed_ui = $%SpeedUI
@onready var flash: ColorRect = $Flash
@onready var level_finish: AudioStreamPlayer = $Sounds/LevelFinish
@onready var fish: AudioStreamPlayer = $Sounds/Fish

func _ready() -> void:
	show_hud()
	GameEvents.level_completed.connect(level_finish.play)
	GameEvents.update_fish_count.connect(play_fish_sound)

func show_hud():
	lives_ui.visible = true
	fish_count.visible = true
	total_score.visible = true
	speed_ui.visible = true

func hide_hud():
	lives_ui.visible = false
	fish_count.visible = false
	total_score.visible = false
	speed_ui.visible = false

func _process(delta: float) -> void:
	flash.visible = GameEvents.warping

var rng := RandomNumberGenerator.new()
func play_fish_sound(_t: int) -> void:
	fish.pitch_scale = rng.randf_range(0.9, 1.2)
	fish.play()
	

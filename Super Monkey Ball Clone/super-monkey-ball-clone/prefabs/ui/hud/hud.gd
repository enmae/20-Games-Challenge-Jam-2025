extends CanvasLayer

@onready var lives_ui = $%LivesUI
@onready var fish_count = $%FishCount
@onready var total_score = $%TotalScore

func _ready() -> void:
	show_hud()

func show_hud():
	lives_ui.visible = true
	fish_count.visible = true
	total_score.visible = true

func hide_hud():
	lives_ui.visible = false
	fish_count.visible = false
	total_score.visible = false

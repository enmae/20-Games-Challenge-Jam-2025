extends CanvasLayer

@onready var totalScore: Label = $%TotalScore

func _ready() -> void:
	totalScore.text = str(GameEvents.total_score)
	GameEvents.update_total_score.connect(on_update_score)

func on_update_score(points: int):
	GameEvents.total_score += points
	totalScore.text = str(GameEvents.total_score)

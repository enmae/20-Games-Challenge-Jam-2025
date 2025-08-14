extends CanvasLayer

@export var score: int = 0
@onready var totalScore: Label = $%TotalScore

func _ready() -> void:
    totalScore.text = str(score)
    GameEvents.update_total_score.connect(on_update_score)

func on_update_score(points: int):
    score += points
    totalScore.text = str(score)

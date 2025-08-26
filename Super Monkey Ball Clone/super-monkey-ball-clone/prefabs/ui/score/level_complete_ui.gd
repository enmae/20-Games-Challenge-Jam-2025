extends CanvasLayer

@onready var warp_score_container : HBoxContainer = $%WarpScoreContainer
@onready var time_score_container : HBoxContainer = $%TimeScoreContainer
@onready var clear_score_label : Label = $%ClearScorePointsLabel
@onready var warp_bonus_label : Label = $%WarpBonusMultiplierLabel
@onready var time_bonus_label : Label = $%TimeBonusMultiplierLabel
@onready var continue_bonus_label : Label = $%ContinuesBonusMultiplierLabel
@onready var floor_score_label : Label = $%FloorScorePointsLabel

var time_bonus := 0
var warp_bonus := 0
var continue_bonus := 0
var floor_score := 0
var clear_score := 0

var warp_count_dict = {
	1: 2,
	2: 3,
	3: 4,
	6: 7,
}

var continue_count_dict = {
	0: 1,
	1: 2,
	2: 3,
	3: 4,
}

func _ready() -> void:
	if (GameEvents.is_within_half_level_time):
		time_score_container.visible = true
		time_bonus = 2
		time_bonus_label.text = "x" + str(time_bonus)
	
	if (GameEvents.warp_used):
		warp_score_container.visible = true
		warp_bonus = warp_count_dict[GameEvents.warp_count]
		warp_bonus_label.text = "x" + str(warp_bonus)
	
	continue_bonus = continue_count_dict[GameEvents.continues]
	continue_bonus_label.text = "x" + str(continue_bonus)
	
	floor_score = GameEvents.time_remaining * 100
	floor_score_label.text = str(floor_score)
	
	clear_score = floor_score * (warp_bonus if GameEvents.warp_used else 1) * (time_bonus if GameEvents.is_within_half_level_time else 1) * continue_bonus
	clear_score_label.text = str(clear_score)

	GameEvents.emit_update_total_score(clear_score)

	#TODO: When navigation to the next level is complete, 
	##     need to set "is_within_half_level_time" to false again
	$%Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	LevelManager.emit_signal("next_level")
	print("timer ended")

extends Node

signal life_added()
signal life_removed()
signal reset_player_position()
signal update_total_score(new_score: int)
signal update_fish_count(fish_count: int)
signal level_completed()

const MAX_CONTINUES := 3

var last_played_level := ""
var continues := 3
var total_score := 0
var warp_count := 0
var warp_used := false
var is_within_half_level_time := false
var time_remaining := 0.0
var fish_count := 0

func emit_life_added():
	life_added.emit()

func emit_life_removed():
	life_removed.emit()

func emit_reset_player_position():
	reset_player_position.emit()

func emit_update_total_score(new_score: int):
	update_total_score.emit(new_score)

func emit_update_fish_count(fish_count: int):
	update_fish_count.emit(fish_count)

func emit_level_completed():
	level_completed.emit()

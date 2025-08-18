extends Node

signal life_added()
signal life_removed()
signal reset_player_position()
signal update_total_score(new_score: int)
signal update_fish_count(fish_count: int)
signal game_over(continue_level: Node)

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

func emit_game_over(continue_level: Node):
	game_over.emit(continue_level)

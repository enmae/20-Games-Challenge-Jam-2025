extends Area3D

const SCORE = 100.0

func _on_body_entered(body: Node3D) -> void:
	if (body.is_in_group("player")):
		GameEvents.emit_update_total_score(SCORE)
		GameEvents.emit_update_fish_count(1)
		queue_free()

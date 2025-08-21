extends Area3D

var level_complete_ui_scene = preload("res://prefabs/ui/score/level_complete_ui.tscn")

func _on_body_entered(body: Node3D) -> void:
	if (body.is_in_group("player")):
		print("beat level!")
		# get_tree().paused = true
		body.linear_velocity = Vector3.ZERO
		GameEvents.emit_level_completed()

		var hud = get_tree().get_root().get_child(1).get_node("%HUD")
		var level_complete_ui = level_complete_ui_scene.instantiate()
		hud.add_child(level_complete_ui)

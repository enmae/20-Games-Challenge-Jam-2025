extends Area3D

func _on_body_entered(_body: Node3D) -> void:
	GameEvents.emit_life_removed()
	print("died")
	## TODO: Restart level

extends Area3D

func _on_body_entered(body:Node3D) -> void:
	GameEvents.emit_life_removed()
	print("died")
	## TODO: Re-position the player at the start of the level

extends CanvasLayer

@onready var speed_value: Label = $"%Speed Value"

func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")

	# var current_velocity = (player.position - player.previous_position) / delta
	## TODO: Get proper previous position to get speed to send to ui
	var current_speed = player.previous_position.distance_to(player.position) / delta
	speed_value.text = str(current_speed) + " MPH"

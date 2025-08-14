extends CanvasLayer

@onready var speed_value: Label = $"%Speed Value"

func _process(delta: float) -> void:
	var player: RigidBody3D = get_tree().get_first_node_in_group("player")
	speed_value.text = "%d m/s" % [player.linear_velocity.length()]

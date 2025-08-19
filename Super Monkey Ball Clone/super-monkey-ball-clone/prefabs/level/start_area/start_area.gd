extends Marker3D

func _ready():
    var player = get_tree().get_first_node_in_group("player")
    player.position = global_position

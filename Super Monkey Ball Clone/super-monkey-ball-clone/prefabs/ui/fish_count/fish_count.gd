extends CanvasLayer

@onready var collected_fish_count: Label = $%CollectedFishCount

const MAX_FISH = 100

var count = 0

func _ready() -> void:
	GameEvents.update_fish_count.connect(on_update_fish_count)
	count = GameEvents.fish_count
	update_fish_count_label(GameEvents.fish_count)

func update_fish_count_label(new_count: int):
	collected_fish_count.text = str(new_count) + " / " + str(MAX_FISH)

func on_update_fish_count(value: int):
	count += value

	if (count >= 100):
		GameEvents.emit_life_added()
		count = 0
	
	update_fish_count_label(count)
	GameEvents.fish_count = count

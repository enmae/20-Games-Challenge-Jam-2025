extends CanvasLayer

@onready var collected_fish_count: Label = $%CollectedFishCount

const MAX_FISH = 100

var count = 0

func _ready() -> void:
    GameEvents.update_fish_count.connect(on_update_fish_count)

func on_update_fish_count(value: int):
    count += value

    if (count >= 100):
        GameEvents.emit_life_added()
        count = 0
    
    collected_fish_count.text = str(count) + " / " + str(MAX_FISH)
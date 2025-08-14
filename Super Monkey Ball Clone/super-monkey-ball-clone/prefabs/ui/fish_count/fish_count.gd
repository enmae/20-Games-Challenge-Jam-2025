extends CanvasLayer

@onready var collected_fish_count: Label = $%CollectedFishCount

const MAX_FISH = 100

var count = 0

func update_collected_fish_count(value: int):
    count += value

    if (count >= 100):
        LivesUI.add_life()
        count = 0
    
    collected_fish_count.text = str(count) + " / " + str(MAX_FISH)
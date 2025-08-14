extends StaticBody3D

const SCORE = 100.0

func _on_area_3d_body_entered(body: Node3D):
    if (body.is_in_group("character")):
        TotalScore.update_score(SCORE)
        FishCount.update_collected_fish_count(1)
        queue_free()

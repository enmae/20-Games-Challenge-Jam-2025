extends StaticBody3D

const SCORE = 100.0

func _on_area_3d_body_entered(body: Node3D):
    if (body.is_in_group("character")):
        print("entered fish")
        TotalScore.update_score(SCORE)
        queue_free()

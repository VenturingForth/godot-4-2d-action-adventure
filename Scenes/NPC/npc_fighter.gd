extends StaticBody2D

var can_interact: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_interact:
		if $CanvasLayer.visible:
			$CanvasLayer.visible = false
			get_tree().paused = false
		else:
			$CanvasLayer.visible = true
			get_tree().paused = true

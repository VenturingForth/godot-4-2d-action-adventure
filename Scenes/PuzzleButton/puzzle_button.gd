extends Area2D

@export var is_single_use = false

var bodies_on_top: bool = false
signal pressed
signal unpressed

func _on_body_entered(body: Node2D) -> void:
	bodies_on_top = true
	if body.is_in_group("pushable") or body is Player:
		if bodies_on_top:
			pressed.emit()
			$AnimatedSprite2D.play("pressed")

func _on_body_exited(body: Node2D) -> void:
	if is_single_use:
		return
	
	bodies_on_top = false
	if body.is_in_group("pushable") or body is Player:
		if !bodies_on_top:
			unpressed.emit()
			$AnimatedSprite2D.play("unpressed")

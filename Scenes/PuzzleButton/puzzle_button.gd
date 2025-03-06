extends Area2D

var bodies_on_top: bool = false
signal pressed
signal unpressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	bodies_on_top = true
	if body.is_in_group("pushable") or body is Player:
		if bodies_on_top:
			pressed.emit()
			$AnimatedSprite2D.play("pressed")

func _on_body_exited(body: Node2D) -> void:
	bodies_on_top = false
	if body.is_in_group("pushable") or body is Player:
		if !bodies_on_top:
			unpressed.emit()
			$AnimatedSprite2D.play("unpressed")

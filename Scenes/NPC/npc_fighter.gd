extends StaticBody2D

@export var dialogue_lines: Array[String] = [
	"This is the first sentence I'll speak.",
	"This is the second.",
	"And here is a third."
]
var dialogue_index: int = 0

var can_interact: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_interact:
		if dialogue_index < dialogue_lines.size():
			$CanvasLayer.visible = true
			get_tree().paused = true
			$CanvasLayer/DialogueLabel.text = dialogue_lines[dialogue_index]
			dialogue_index += 1
		else: 
			$CanvasLayer.visible = false
			get_tree().paused = false
			dialogue_index = 0

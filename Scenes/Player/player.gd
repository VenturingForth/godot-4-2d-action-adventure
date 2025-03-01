extends CharacterBody2D

@export var hp: int = 10

@export var move_speed: float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	print(hp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = move_vector * move_speed
	
	if velocity.x > 0:
		$AnimatedSprite2D.play("move_right")
		
	if velocity.x < 0:
		$AnimatedSprite2D.play("move_left")
	
	if velocity.y < 0:
		$AnimatedSprite2D.play("move_up")
	
	if velocity.y > 0:
		$AnimatedSprite2D.play("move_down")
	
	if velocity == Vector2(0, 0):
		$AnimatedSprite2D.stop()
	
	move_and_slide()

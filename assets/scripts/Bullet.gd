extends Node

@export var speed: int = 300

var direction := Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		self.global_position += velocity

func set_direction(direction: Vector2):
	self.direction = direction

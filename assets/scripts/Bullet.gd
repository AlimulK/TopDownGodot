extends Node
class_name Bullet

@export var speed: int = 10
@onready var despawn_timer = $DespawnTimer

var direction := Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		self.global_position += velocity

func _ready():
	despawn_timer.start()

func set_direction(direction: Vector2):
	self.direction = direction
	self.rotation += direction.angle()


func _on_despawn_timer_timeout():
	queue_free()

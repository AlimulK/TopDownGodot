extends CharacterBody2D

@export var speed = 100
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

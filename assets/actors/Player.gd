extends CharacterBody2D
class_name Player

signal player_fired(bullet, position, direction)
@onready var weapon = $Weapon
@export var speed: int = 100
@onready var health = $Health
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	get_input()
	move_and_slide()

func _unhandled_input(event):
	if event.is_action_released("shoot"):
		weapon.shoot()

func get_input():
	look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func shoot(bullet, position, direction):
	emit_signal("player_fired", bullet, position, direction)

# probably replace this, not sure I want health for player
func handle_hit():
	health.health -= 20
	print("player hit")

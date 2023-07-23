extends CharacterBody2D

signal player_fired(bullet, position, direction)
@export var speed: int = 100
@export var Bullet: PackedScene
@onready var end_of_gun = $EndOfGun
@onready var gun_direction = $GunDirection
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	get_input()
	move_and_slide()

func _unhandled_input(event):
	if event.is_action_released("shoot"):
		shoot()

func get_input():
	look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func shoot():
	var bullet_instance = Bullet.instantiate()
	var direction = (gun_direction.global_position - end_of_gun.global_position).normalized()
	emit_signal("player_fired", bullet_instance, end_of_gun.global_position, direction)

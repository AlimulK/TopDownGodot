extends CharacterBody2D

@onready var health = $Health

func handle_hit():
	health.health -= 20
	print("enemy hit")
	if health.health <= 0:
		queue_free()

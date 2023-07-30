extends Node2D

@export var max_health:int = 100
@export var health:int = 100:
	get:
		return health
	set(new_health):
		# TODO:use max_health instead of constant
			health = clamp(new_health, 0, 100)

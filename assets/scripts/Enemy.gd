extends CharacterBody2D

var health:int = 100

func handle_hit():
	health -= 20
	print("enemy hit")

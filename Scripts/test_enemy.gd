extends CharacterBody2D

var enemy = preload("res://Scenes/test_enemy.tscn")

@export var track : PathFollow2D

@export var health : float

func _process(delta: float) -> void:
	if health <= 0:
		die()

func die():
	track.spawn_enemy(enemy)
	queue_free()

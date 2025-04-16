extends PathFollow2D

@export var marker : Marker2D

@export var speed : float

var enemy = preload("res://Scenes/test_enemy.tscn")

func _process(delta: float) -> void:
	progress += speed
	if progress >= 50:
		spawn_enemy(enemy)

func spawn_enemy(enemy):
	var enemy_temp = enemy.instantiate()
	enemy_temp.global_position = marker.position
	add_child(enemy_temp)

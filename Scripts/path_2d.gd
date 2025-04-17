extends Path2D

var enemy = preload("res://Scenes/test_enemy.tscn")

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("Right Click"):
		spawn_enemy(enemy)

func spawn_enemy(enemy):
	var enemy_temp = enemy.instantiate()
	add_child(enemy_temp)

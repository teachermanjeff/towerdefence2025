extends Path2D

var enemy_basic = preload("res://Scenes/basic_enemy.tscn")
var enemy_big  = preload("res://Scenes/big_enemy.tscn")
var enemy_fast = preload("res://Scenes/fast_enemy.tscn")

var enemies = [enemy_basic,enemy_big,enemy_fast]

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("Right Click"):
		spawn_enemy(enemies[randf_range(0,3)])

func spawn_enemy(enemy):
	var enemy_temp = enemy.instantiate()
	add_child(enemy_temp)

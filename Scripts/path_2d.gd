extends Path2D

@export var basic_spawn_rate : float
@export var big_spawn_rate : float
@export var fast_spawn_rate : float

@export var basic_spawn_timer : Timer
@export var big_spawn_timer : Timer
@export var fast_spawn_timer : Timer

var enemy_basic = preload("res://Scenes/basic_enemy.tscn")
var enemy_big  = preload("res://Scenes/big_enemy.tscn")
var enemy_fast = preload("res://Scenes/fast_enemy.tscn")

var decrease = 0.99997

func _process(delta: float) -> void:

	basic_spawn_timer.set_wait_time(basic_spawn_rate)
	big_spawn_timer.set_wait_time(big_spawn_rate)
	fast_spawn_timer.set_wait_time(fast_spawn_rate)

	basic_spawn_rate *= decrease
	big_spawn_rate *= decrease
	fast_spawn_rate *= decrease

func spawn_enemy(enemy):
	var enemy_temp = enemy.instantiate()
	add_child(enemy_temp)

func _on_basic_spawn_timer_timeout() -> void:
	spawn_enemy(enemy_basic)

func _on_big_spawn_timer_timeout() -> void:
	spawn_enemy(enemy_big)

func _on_fast_spawn_timer_timeout() -> void:
	spawn_enemy(enemy_fast)

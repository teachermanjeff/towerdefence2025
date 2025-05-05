extends Node2D

@export var tower_bottom : Sprite2D
@export var timer : Timer

@export var aoe : Area2D

@export var fire_speed : float
@export var damage : float

var looking_at = false
var cooldown = false
var enemy = null
var closest_enemy = null
var targets = []

func _ready() -> void:
	timer.set_wait_time(fire_speed)


func _process(delta: float) -> void:

	for x in aoe.get_overlapping_areas():
		if x.is_in_group("Enemy"):
			targets.append(x)

	enemy = closetEnemyOrNull()

	if len(targets) <= 1:
		looking_at = true


	if cooldown == false and enemy != null and looking_at == true:
		fire(enemy)

		cooldown = true
		timer.start()


	print(looking_at)

func fire(target):

	# Deal Damage
	enemy.get_parent().health -= damage

func _on_cooldown_timer_timeout() -> void:
	cooldown = false

func closetEnemyOrNull():
	var all_enemies = get_tree().get_nodes_in_group("Enemy")
 
	if (all_enemies.size() > 0):
		closest_enemy = all_enemies[0]
		for enemy in all_enemies:
			var distance_to_this_player = global_position.distance_squared_to(enemy.global_position)
			var distance_to_closest_player = global_position.distance_squared_to(closest_enemy.global_position)
			if (distance_to_this_player < distance_to_closest_player):
				closest_enemy = enemy
	return closest_enemy

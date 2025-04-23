extends Node2D

@export var tower_top : Sprite2D
@export var muzzle_flash : Sprite2D
@export var timer : Timer

@export var aoe : Area2D

@export var fireSpeed : float
@export var damage : float

var looking_at = false
var enemy 

var arr = []
var i = 0

func _ready() -> void:
	timer.wait_time = fireSpeed
	print(looking_at)

func _process(delta: float) -> void:
	if looking_at == true:
		tower_top.look_at(enemy.global_position)
		#$CannonTop.look_at(get_global_mouse_position()) # Debug
		tower_top.rotate(deg_to_rad(-90))

func sort_ascending(a, b):
	if a[1] < b[1]:
		return true
	return false

func _on_aoe_body_entered(body: Node2D) -> void:
	arr = []
	looking_at = true

	for x in aoe.get_overlapping_bodies():
		arr.append(x)

	enemy = arr[i]

	timer.start()

func _on_aoe_body_exited(body: Node2D) -> void:
	looking_at = false
	tower_top.rotation = 0

func fire(target):

	# Muzzle Flash
	muzzle_flash.visible = true
	await get_tree().create_timer(0.1).timeout
	muzzle_flash.visible = false

	#Deal Damage
	enemy.get_parent().health -= damage

	if enemy.get_parent().health <= 0:
		targetEnemy(i + 1)

func _on_timer_timeout() -> void:
	if looking_at == true:
		fire(enemy)

func targetEnemy(num):
	if num <= len(arr):
		enemy = arr[num]

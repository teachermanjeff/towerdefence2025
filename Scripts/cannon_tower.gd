extends Node2D

@export var tower_top : Sprite2D
@export var muzzle_flash : Sprite2D

@export var aoe : Area2D

@export var fireSpeed : float
@export var damage : float

var looking_at = false
var enemy 

var arr = []

func _process(delta: float) -> void:
	if looking_at == true:
		tower_top.look_at(enemy.global_position)
		#$CannonTop.look_at(get_global_mouse_position()) # Debug
		tower_top.rotate(deg_to_rad(-90))

	if looking_at == true:
		await get_tree().create_timer(fireSpeed).timeout
		fire(enemy)
		print("1")

func sort_ascending(a, b):
	if a[1] < b[1]:
		return true
	return false

func _on_aoe_body_entered(body: Node2D) -> void:
	arr = []
	enemy = body
	print(enemy)
	looking_at = true

	for x in aoe.get_overlapping_bodies():
		arr.append((tower_top.position - x.global_position).length())
	arr.bsearch(sort_ascending)
	print(arr)

func _on_aoe_body_exited(body: Node2D) -> void:
	looking_at = false
	tower_top.rotation = 0

func fire(target):

	# Muzzle Flash
	muzzle_flash.visible = true
	await get_tree().create_timer(0.1).timeout
	muzzle_flash.visible = false

	# Deal Damage
	#print(enemy)
	#enemy.get_parent().health -= damage

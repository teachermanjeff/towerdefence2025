extends Node2D

@export var tower_top : Sprite2D
@export var muzzle_flash : Sprite2D

@export var fireSpeed : float
@export var damage : float

var looking_at = false
var enemy 

func _process(delta: float) -> void:
	if looking_at == true:
		tower_top.look_at(enemy.global_position)
		#$CannonTop.look_at(get_global_mouse_position())
		tower_top.rotate(-90)

func _on_aoe_body_entered(body: Node2D) -> void:
	enemy = body
	looking_at = true

	while looking_at == true:
		fire(enemy)
		await get_tree().create_timer(fireSpeed).timeout

func _on_aoe_body_exited(body: Node2D) -> void:
	looking_at = false
	tower_top.rotation = 0

func fire(target):
	# Muzzle Flash
	muzzle_flash.visible = true
	await get_tree().create_timer(0.1).timeout
	muzzle_flash.visible = false

	#enemy.health -= damage

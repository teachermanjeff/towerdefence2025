extends Node2D

@export var tower_top : Sprite2D

var looking_at = false
var enemy 

func _process(delta: float) -> void:
	if looking_at == true:
		tower_top.look_at(enemy.global_position)

func _on_aoe_body_entered(body: Node2D) -> void:
	enemy = body
	looking_at = true

func _on_aoe_body_exited(body: Node2D) -> void:
	looking_at = false
	tower_top.rotation = 0

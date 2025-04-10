extends Node2D

var test_tower = preload("res://Scenes/test_tower.tscn")
var is_placable = false


func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()

	if Input.is_action_just_pressed("Left Click") and Global.is_picked_up == true and is_placable == true:
		var test_tower_temp = test_tower.instantiate()
		test_tower_temp.global_position = mouse_pos
		add_child(test_tower_temp)

func _on_placable_area_mouse_entered() -> void:
	is_placable = true

func _on_placable_area_mouse_exited() -> void:
	is_placable = false

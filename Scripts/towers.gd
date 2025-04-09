extends Node2D

var test_tower = preload("res://Scenes/test_tower.tscn")

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()

	print(is_in_group("Placable"))

	if Input.is_action_just_pressed("Left Click") and Global.is_picked_up == true:
		var test_tower_temp = test_tower.instantiate()
		test_tower_temp.global_position = mouse_pos
		add_child(test_tower_temp)

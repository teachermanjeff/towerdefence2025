extends Node2D

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()

	if Input.is_action_just_pressed("Left Click") and Global.is_picked_up == true and Global.is_placable == true:
		place_tower(Global.selected, mouse_pos)

func _on_placable_area_mouse_entered() -> void:
	Global.is_placable = true
	Global.within_placable = true

func _on_placable_area_mouse_exited() -> void:
	Global.is_placable = false
	Global.within_placable = false

func place_tower(tower, mouse_pos):
	var tower_temp = tower.instantiate()
	tower_temp.global_position = mouse_pos
	add_child(tower_temp)

extends Control

# Export Vars
@export var placable_area : Area2D

# Onready Vars
@onready var test_tower : PackedScene = preload("res://Scenes/test_tower.tscn")

# Vars
var is_placable = false
var is_picked_up = false

func _process(delta: float) -> void:
	# Get global mouse position
	var mouse_pos = get_global_mouse_position()

	# If the cursor is within a placable area and the player has a tower selected place said tower at cursor position
	if is_placable == true and Input.is_action_just_pressed("Left Click") and is_picked_up == true:
		var test_tower_temp = test_tower.instantiate()
		test_tower_temp.global_position = mouse_pos
		add_child(test_tower_temp)

# Set is_placable true on mouse entering placable area 
func _on_area_2d_mouse_entered() -> void:
	is_placable = true
	print(is_placable)

# Set is_placable false on mouse entering placable area
func _on_area_2d_mouse_exited() -> void:
	is_placable = false
	print(is_placable)

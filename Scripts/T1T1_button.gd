extends Button

# Export vars
@export var sprite : Sprite2D
@export var ui : Control

# Vars
var origin = Vector2(65,65)

func _process(delta: float) -> void:

	# Get global mouse position
	var mouse_pos = get_global_mouse_position()

	# If tower is selected move to mouse position
	if ui.is_picked_up == true:
		sprite.global_position = mouse_pos

	# Return to origin if right mouse button is pressed
	if Input.is_action_pressed("Right Click"):
		sprite.position = origin
		ui.is_picked_up = false
# When the button is pressed set is_pick_up value to true
func _on_pressed() -> void:
	ui.is_picked_up = true

extends Button

# Export vars
@export var sprite : Sprite2D
@export var aoe_collision : CollisionShape2D
@export var deadzone_collision : CollisionShape2D

# Vars
var origin = Vector2(25,25)

func _process(delta: float) -> void:

	# Get global mouse position
	var mouse_pos = get_global_mouse_position()

	# If tower is selected move to mouse position
	if Global.is_picked_up == true:
		sprite.global_position = mouse_pos

		aoe_collision.visible = true
		deadzone_collision.visible = true

	# Return to origin if right mouse button is pressed
	if Input.is_action_pressed("Right Click"):
		sprite.position = origin
		Global.is_picked_up = false

		aoe_collision.visible = false
		deadzone_collision.visible = false

# When the button is pressed set is_pick_up value to true
func _on_pressed() -> void:
	Global.is_picked_up = true

func _on_deadzone_area_entered(area: Area2D) -> void:
	pass

func _on_deadzone_area_exited(area: Area2D) -> void:
	pass # Replace with function body.

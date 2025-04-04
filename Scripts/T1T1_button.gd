extends Button

@export var sprite : Sprite2D

var origin = Vector2(65,65)
var is_picked_up = false
var is_placable = false

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()

	if is_picked_up == true:
		sprite.global_position = mouse_pos

	if Input.is_action_pressed("Right Click"):
		sprite.position = origin
		is_picked_up = false

func _on_pressed() -> void:
	is_picked_up = true

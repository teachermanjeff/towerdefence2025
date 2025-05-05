extends Control

signal is_placable(placable, not_placable)

func _on_area_2d_mouse_entered() -> void:
	emit_signal("placable")

func _on_area_2d_mouse_exited() -> void:
	emit_signal("not_placable")

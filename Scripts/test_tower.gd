extends Node2D

#func _on_deadzone_area_entered(area: Area2D) -> void:
	#if !area.is_in_group("Placable"):
		#queue_free()

extends Sprite2D

func _process(delta: float) -> void:
	var targetedPos: Vector2 = get_viewport().get_mouse_position()
	var direction: Vector2 = targetedPos - self.global_position
	
	var norm_dir: Vector2 = direction.normalized()

	var angle:float = norm_dir.angle()
	
	self.rotation = angle
	
	if $RayCast2D.is_colliding():
		print("collision")

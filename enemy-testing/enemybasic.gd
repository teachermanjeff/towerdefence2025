extends PathFollow2D
var velocity = 12

func _process(delta: float) -> void:
	progress += velocity * delta

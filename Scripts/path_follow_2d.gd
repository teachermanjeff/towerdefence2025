extends PathFollow2D

@export var speed : float

func _process(delta: float) -> void:
	progress += speed

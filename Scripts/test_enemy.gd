extends PathFollow2D

@export var health : float
@export var speed : float

func _process(delta: float) -> void:
	var pos = global_position
	progress += speed

	if health <= 0:
		die()

	if pos == global_position:
		die()

func die():
	queue_free()

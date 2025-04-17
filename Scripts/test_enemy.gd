extends PathFollow2D

@export var health : float
@export var speed : float

func _process(delta: float) -> void:
	progress += speed

	if health <= 0:
		die()

	if progress == 100:
		die()

func die():
	queue_free()

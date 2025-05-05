extends PathFollow2D

@export var animation : AnimatedSprite2D

@export var health : float
@export var speed : float
@export var value : int

func _ready() -> void:
	animation.set_animation("default")

func _process(delta: float) -> void:
	var pos = global_position
	progress += speed

	if health <= 0:
		die()

	if pos == global_position:
		die()

func die():
	Global.money += value
	queue_free()

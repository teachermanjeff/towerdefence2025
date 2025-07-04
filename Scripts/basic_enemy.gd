extends PathFollow2D

@export var animation : AnimatedSprite2D
@export var health_bar : TextureProgressBar

@export var health : float
@export var speed : float
@export var value : int
@export var damage : int

func _ready() -> void:
	animation.set_animation("default")
	health_bar.max_value = health
	health_bar.value = health

func _process(delta: float) -> void:
	var pos = global_position
	progress += speed

	if health <= 0:
		die()

	if pos == global_position:
		Global.health -= damage
		die()

func die():
	Global.money += value
	queue_free()

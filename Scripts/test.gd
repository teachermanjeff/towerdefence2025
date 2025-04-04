extends CharacterBody2D

# Export Vars
@export var path : PathFollow2D
@export var speed : float 

# Movement
func _process(delta: float) -> void:
	path.progress = path.progress + speed

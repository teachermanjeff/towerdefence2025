extends Control

@export var health_bar : TextureProgressBar
@export var health_label : Label

func _process(delta: float) -> void:
	health_bar.value = Global.health
	health_label.set_text(str(Global.health) + "/100")

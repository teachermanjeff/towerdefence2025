extends Label

func _process(delta: float) -> void:
	set_text("$" + str(Global.money))

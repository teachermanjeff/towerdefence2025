extends Sprite2D

var Loaded = load("res://Images/Rocket_loaded.png")
var Empty = load("res://Images/Rocket_Empty.png")

var missileLoaded = true #changing this var between true and false sets the texture of @rocket

func _physics_process(delta: float) -> void:
	if (missileLoaded == false):
		texture = Empty
	else: 
		texture = Loaded
	
func _input(event):					#unimportant testing. not needed for texture changing
	if event is InputEventMouseButton:
		if (missileLoaded == true):
			missileLoaded = false
		else:
			missileLoaded = true

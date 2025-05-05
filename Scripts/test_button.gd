extends Button

# Export vars
@export var sprite : Sprite2D
@export var aoe : Area2D
@export var aoe_collision : CollisionShape2D
@export var deadzone : Area2D
@export var deadzone_collision : CollisionShape2D

var tower_scene = preload("res://Scenes/test_tower.tscn")
var focused = false

# Vars
var origin = Vector2(25,25)

func _ready() -> void:
		aoe_collision.visible = false
		deadzone_collision.visible = false

func _process(delta: float) -> void:

	# Get global mouse position
	var mouse_pos = get_global_mouse_position()

	# If tower is selected move to mouse position
	if Global.is_picked_up == true and focused == true:
		sprite.global_position = mouse_pos

		aoe_collision.visible = true
		deadzone_collision.visible = true
		
		print(aoe_collision.visible, deadzone_collision.visible)

	# Return to origin if tower is placed
	if Input.is_action_pressed("Left Click") and Global.is_picked_up == true and Global.within_placable == true and Global.is_placable == true and focused == true:
		await get_tree().create_timer(0.1).timeout
		sprite.position = origin
		Global.is_picked_up = false
		focused = false

		aoe_collision.visible = false
		deadzone_collision.visible = false

# When the button is pressed set is_pick_up value to true
func _on_pressed() -> void:
	Global.is_picked_up = true
	Global.selected = tower_scene
	focused = true

# When deadzone entered make placable false
func _on_deadzone_area_entered(area: Area2D) -> void:
	if !area.is_in_group("Placable"):
		Global.is_placable = false

# When deadzone exited make placable true
func _on_deadzone_area_exited(area: Area2D) -> void:
	if !area.is_in_group("Placable") and Global.within_placable == true:
		Global.is_placable = true

extends Area2D

var velocity = Vector2(0,0)
var value = 10
var touchingFloor = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position += velocity
	var areas = get_overlapping_areas()
	var found = false
	if len(areas) > 0:
		touchingFloor = false
	else:
		if touchingFloor:
			self.queue_free()
		touchingFloor = true
	for area in areas:
		found = false
		if area.is_in_group("Conveyor"):
			velocity = area.dir
			found = true
			break
		if area.is_in_group("Furnace"):
			get_tree().get_root().get_node("Main").get_node("UI").update_balance(value)
			self.queue_free()
			found = true
			break
		else:
			self.queue_free()



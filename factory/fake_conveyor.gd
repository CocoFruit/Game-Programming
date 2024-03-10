extends AnimatedSprite2D

var dragging = false
var of = Vector2(0,0) # offset
var snap = 32

var real_conveyor_scene = preload("res://conveyor.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	of = get_global_mouse_position() - global_position
	self.play("default")
	#print(get_tree)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var newPos = get_global_mouse_position() - of
	newPos.x += 820
	newPos.y += 420
	position = Vector2(snapped(newPos.x,snap),snapped(newPos.y,snap))

func _on_button_button_down():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var new_conveyor = real_conveyor_scene.instance()
	new_conveyor.global_position = global_position
	get_parent().add_child(new_conveyor)
	queue_free()

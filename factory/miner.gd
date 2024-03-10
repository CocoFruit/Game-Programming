extends Node2D

var dragging = false
var of = Vector2(0,0) # offset

var snap = 32/2

var oreNode = preload("res://ore.tscn")
var waiting = false
var size_of_ore = 8
var start_pos : Vector2


var default_cursor = preload("res://images/mouse.png")
#var moving_cursor = preload("res://images/moving_mose.png")
var select_cursor = preload("res://images/selected_mouse.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	while 1:
		$SpawnTimer.start()
		await $SpawnTimer.timeout
		var width = $Object.texture.get_width()
		var height = $Object.texture.get_height()
		
		var x = randi_range(self.position.x-(width/2),self.position.x+(width/2))
		x += width*2
		var y = randi_range(self.position.y-(height)+size_of_ore/2,self.position.y+(height)-size_of_ore/2)
		spawn(Vector2(x,y))



func spawn(pos):
	var instance = oreNode.instantiate()
	add_sibling(instance)
	instance.position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		var newPos = get_global_mouse_position() - of
		position = Vector2(snapped(newPos.x,snap),snapped(newPos.y,snap))

func _on_button_button_down():
	start_pos = position
	dragging = true
	of = get_global_mouse_position() - global_position

func _on_button_button_up():
	dragging = false
	var newPos = get_global_mouse_position() - of
	position = Vector2(snapped(newPos.x,snap),snapped(newPos.y,snap))
	if len($Area2D.get_overlapping_areas())>0:
		position = start_pos

func _on_button_mouse_entered():
	Input.set_custom_mouse_cursor(select_cursor, Input.CURSOR_ARROW, Vector2(0,0))
	$Object.modulate = Color.ANTIQUE_WHITE

func _on_button_mouse_exited():
	Input.set_custom_mouse_cursor(default_cursor, Input.CURSOR_ARROW, Vector2(0,0))
	$Object.modulate = Color(1,1,1)

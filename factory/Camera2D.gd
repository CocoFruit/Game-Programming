extends Camera2D

var mouse_starting_position
var starting_position
var is_dragging = false

var default_cursor = preload("res://images/mouse.png")
var moving_cursor = preload("res://images/moving_mouse.png")

func _ready():
	pass

func _on_background_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			starting_position = position
			mouse_starting_position = event.position
			is_dragging = true
		else: 
			is_dragging = false
			Input.set_custom_mouse_cursor(default_cursor, Input.CURSOR_ARROW, Vector2(0,0))
	if event is InputEventMouseMotion and is_dragging:
		Input.set_custom_mouse_cursor(moving_cursor, Input.CURSOR_ARROW, Vector2(0,0))
		position = starting_position - zoom * (event.position - mouse_starting_position)

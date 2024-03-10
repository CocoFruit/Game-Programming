extends Control

var fake_conveyor = preload("res://fake_conveyor.tscn")
var buying = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	if index == 0: # conveyor
		print("clicked conveyor")
		var fake_conveyor_i = fake_conveyor.instantiate()
		add_sibling(fake_conveyor_i)

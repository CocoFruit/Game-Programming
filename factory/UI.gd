extends CanvasLayer
class_name UI

@onready var balance_label = %Label

var balance = 0

var BuyMenu = preload("res://BuyMenu.tscn")
var BuyMenuObj = BuyMenu.instantiate()

func _ready():
	pass

func update_balance(value):
	balance += value
	update_balance_label()
	
func update_balance_label():
	balance_label.text = "$" + str(balance)

func _process(delta):
	if Input.is_action_just_pressed("Buy"):
		if BuyMenuObj.is_inside_tree():
			remove_child(BuyMenuObj)
		else:
			add_child(BuyMenuObj)


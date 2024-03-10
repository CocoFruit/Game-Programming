extends CSGBox3D


var tween : Tween
var tweening = false
var cur_rot : Vector3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func turn(dir):
	tween = create_tween()
	if dir == "DOWN":
		tween.tween_property(self,"rotation",cur_rot+Vector3(deg_to_rad(90),0,0),1)
		cur_rot += Vector3(deg_to_rad(90),0,0)
	elif dir == "UP":
		tween.tween_property(self,"rotation",cur_rot+Vector3(-deg_to_rad(90),0,0),1)
		cur_rot += Vector3(-deg_to_rad(90),0,0)
	elif dir == "RIGHT":
		tween.tween_property(self,"rotation",cur_rot+Vector3(0,deg_to_rad(90),0),1)
		cur_rot += Vector3(0,deg_to_rad(90),0)
	elif dir == "LEFT":
		tween.tween_property(self,"rotation",cur_rot+Vector3(0,-deg_to_rad(90),0),1)
		cur_rot += Vector3(0,-deg_to_rad(90),0)


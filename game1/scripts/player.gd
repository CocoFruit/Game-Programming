extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	else:		
		if Input.is_action_pressed("jump"):
			velocity.y = -jump_force
	
	var horizontal_dir = Input.get_axis("move_left","move_right") # returns -1 if left, 1 if right, 0 if neither or both
	velocity.x = speed * horizontal_dir
	
	move_and_slide()

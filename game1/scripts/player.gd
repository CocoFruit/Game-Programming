# character sprite: https://luizmelo.itch.io/martial-hero
# background:		https://kayillustrations.itch.io/parallax-sunset-mountains
# 320 * 3.6 x 180 * 3.6 == 1152 x 648
extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300
@export var running = false
@export var attack_cooldown = .5
var horizontal_dir = 1 # 1 is right, -1 is left
var left = false
var can_attack = true
var attack_timer = 0.0


func _physics_process(delta):
	if !can_attack:
		attack_timer += delta
		if attack_timer >= attack_cooldown:
			can_attack = true
	else:
		if !is_on_floor():
			velocity.y += gravity
			if velocity.y > 1000:
				velocity.y = 1000
			if velocity.y > 0:
				$Animation.play("fall_right")
			if Input.is_action_just_pressed("move_right"):
				left = false
			elif Input.is_action_just_pressed("move_left"):
				left = true
		else:
			if Input.is_action_just_pressed("attack") and can_attack:
				$Animation.play("attack_right_1")
				can_attack = false
				attack_timer = 0.0
				# Add your attack logic here
			elif Input.is_action_pressed("jump"):
				velocity.y = -jump_force
				$Animation.play("jump_right")
			else:
				if velocity.x > 0:
					$Animation.play("running_right")
					running = true
					left = false
				elif velocity.x < 0:
					$Animation.play("running_right")
					running = true
					left = true
				else:
					$Animation.play("idle_right")
					running = false

	horizontal_dir = Input.get_axis("move_left", "move_right") # returns -1 if left, 1 if right, 0 if neither or both
	velocity.x = speed * horizontal_dir
	if left:
		$Animation.flip_h = true
	else:
		$Animation.flip_h = false

	move_and_slide()

func _ready():
	$Animation.play("idle_right")


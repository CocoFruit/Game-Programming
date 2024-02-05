extends Node2D

var speed = 200
var rng = RandomNumberGenerator.new()
var direction_timer = 0.0
var change_direction_interval = 5.0  # Change direction every 5 seconds

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	direction_timer = rng.randf_range(0.0, change_direction_interval)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction_timer -= delta

	if direction_timer <= 0.0:
		change_direction()
		direction_timer = rng.randf_range(0.0, change_direction_interval)

	for body in $foreground.get_children():
		body.position.x -= speed * delta

func change_direction():
	speed *= -1  # Change direction by reversing speed

extends RigidBody2D
class_name  Player

var flap_force = -315
var MAX_ROTATION_DEGREES = -30

var started = false

onready var animation_player = $AnimationPlayer
onready var ground = $"../../Ground"

func _physics_process(delta):
	if Input.is_action_just_pressed("flap"):
		if !started:
			start()
		flap()
	
	if rotation_degrees <= MAX_ROTATION_DEGREES:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGREES
		
	if linear_velocity.y > 0:
		if rotation_degrees <= 90:
			angular_velocity = 3.0
		else:
			angular_velocity = 0
		
		
func start():
	if started: return
	started = true
	gravity_scale = 10.0
	animation_player.play("flap")
	

func flap():
	linear_velocity.y = flap_force
	angular_velocity = -8.0
	
	


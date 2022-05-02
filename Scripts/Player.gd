extends KinematicBody2D

const ACCELERATION = 2.5
const FRICTION = 50
const MAXIMUM_SPEED = 5

onready var animation_player = $"Animation Player"
onready var animation_tree = $"Animation Tree"
onready var animation_state = animation_tree.get("parameters/playback")

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Walk/blend_position", input_vector)
		animation_state.travel("Walk")
		velocity = velocity.move_toward(input_vector * MAXIMUM_SPEED, ACCELERATION * delta)
	else:
		animation_state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_collide(velocity)

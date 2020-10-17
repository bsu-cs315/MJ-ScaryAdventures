extends KinematicBody2D


const GRAVITY := 900.0
const JUMP_FORCE := 415

var _run_speed := 200
var _velocity := Vector2()
var _is_grounded := true

onready var player_sprite := $Sprite


func _physics_process(delta: float):
	_handle_vertical_movement(delta)
	_handle_horizontal_movement()
	_velocity = move_and_slide(_velocity, Vector2.UP)


func _handle_horizontal_movement() -> void:
	if Input.is_action_pressed("move_right"):
		player_sprite.flip_h = true
		_velocity.x = _run_speed
	elif Input.is_action_pressed("move_left"):
		player_sprite.flip_h = false
		_velocity.x = -_run_speed
	else:
		_velocity.x = 0


func _handle_vertical_movement(delta: float) -> void:
	_velocity.y += GRAVITY * delta
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		_velocity.y = -JUMP_FORCE
	_is_grounded = true if is_on_floor() else false
	

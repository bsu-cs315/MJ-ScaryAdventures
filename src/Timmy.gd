extends KinematicBody2D

signal throw_pumpkin(evil_pumpkin)

const GRAVITY := 900.0
const JUMP_FORCE := 415
const EVIL_PUMPKIN_NAMES := [
	"EvilPumpkin", 
	"EvilPumpkin2", 
	"EvilPumpkin3", 
	"EvilPumpkin4", 
	"EvilPumpkin5",
	"EvilPumpkin6",
	"EvilPumpkin7",
	"EvilPumpkin8", 
]

var _run_speed := 200
var _velocity := Vector2()
var _is_grounded := true

onready var _sprite := $Sprite
onready var _raycast := $RayCast2D


func _physics_process(delta: float):
	_handle_vertical_movement(delta)
	_handle_horizontal_movement()
	_velocity = move_and_slide(_velocity, Vector2.UP)
	if _raycast.is_colliding():
		var collider = _raycast.get_collider()
		if _is_an_evil_pumpkin(collider.name):
			emit_signal("throw_pumpkin", collider)


func die() -> void:
	queue_free()


func _handle_horizontal_movement() -> void:
	if Input.is_action_pressed("move_right"):
		_sprite.flip_h = true
		_velocity.x = _run_speed
	elif Input.is_action_pressed("move_left"):
		_sprite.flip_h = false
		_velocity.x = -_run_speed
	else:
		_velocity.x = 0


func _handle_vertical_movement(delta: float) -> void:
	_velocity.y += GRAVITY * delta
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		_velocity.y = -JUMP_FORCE
	_is_grounded = true if is_on_floor() else false


func _is_an_evil_pumpkin(pumpkin_name) -> bool:
	for name in EVIL_PUMPKIN_NAMES:
		if name == pumpkin_name:
			return true
	return false

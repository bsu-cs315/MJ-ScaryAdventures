extends RigidBody2D


signal timmy_hit

onready var _raycasts := [$LeftRayCast, $RightRayCast, $UpRayCast]

func _ready():
	apply_impulse(Vector2.ZERO, Vector2(-400, 0))


func _physics_process(_delta):
	for raycast in _raycasts:
		if raycast.is_colliding():
			emit_signal("timmy_hit")


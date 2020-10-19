extends RigidBody2D


signal timmy_hit

onready var _can_throw := true
onready var _timer := $Timer
onready var _raycasts := [
		$LeftRayCast,
		$RightRayCast,
		$UpRayCast,
		$DownRayCast,
		$TLRayCast,
		$BLRayCast,
		$TRRayCast,
		$BRRayCast
]


func _physics_process(_delta) -> void:
	_check_for_collisions()


func disable_can_throw() -> void:
	_can_throw = false


func can_throw() -> bool:
	return _can_throw


func start_timer() -> void:
	_timer.start()


func _check_for_collisions() -> void:
	for raycast in _raycasts:
		if raycast.is_colliding():
			if raycast.get_collider().name == "Timmy":
				emit_signal("timmy_hit")
		


func _delete_pumpkin():
	queue_free()

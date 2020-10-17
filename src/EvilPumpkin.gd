extends RigidBody2D


signal player_hit


	#apply_impulse(Vector2.ZERO, Vector2(200, 0))

func _on_EvilPumpkin_body_entered(_body):
	emit_signal("player_hit")

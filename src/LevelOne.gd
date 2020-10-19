extends Node2D


onready var _music := $BackgroundMusic
onready var _timmy := $Timmy
onready var _evil_pumpkins := [
		$EvilPumpkin,
		$EvilPumpkin2,
		$EvilPumpkin3,
		$EvilPumpkin4,
		$EvilPumpkin5
]

func _ready() -> void:
	_music.play()


func _on_timmy_hit() -> void:
	_timmy.die()
	var _ignored = get_tree().change_scene("res://src/LosingScreen.tscn")


func _on_throw_pumpkin(evil_pumpkin: Node) -> void:
	var next_pumpkin: RigidBody2D
	for pumpkin in _evil_pumpkins:
		if pumpkin == evil_pumpkin:
			next_pumpkin = pumpkin
	if next_pumpkin.can_throw():
		next_pumpkin.apply_impulse(Vector2.ZERO, Vector2(-550, 0))
		next_pumpkin.disable_can_throw()
		next_pumpkin.start_timer()


func _on_FinishFlag_entered(_body: Node) -> void:
	var _ignored = get_tree().change_scene("res://src/LevelTwo.tscn")

extends Node2D


onready var _timmy := $Timmy


func _on_timmy_hit():
	_timmy.die()
	var _ignored = get_tree().change_scene("res://src/LosingScreen.tscn")

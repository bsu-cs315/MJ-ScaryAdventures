extends CanvasLayer


func _on_StartGame_pressed() -> void:
	var _ignored = get_tree().change_scene("res://src/LevelOne.tscn")

extends CanvasLayer


func _on_MainMenuButton_pressed() -> void:
	var _ignored = get_tree().change_scene("res://src/MainMenu.tscn")

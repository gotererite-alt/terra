extends Control

func _on_fighter_pressed() -> void:
	TurnManager.character = "fighter"
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")

func _on_ranger_pressed() -> void:
	TurnManager.character = "ranger"
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")

func _on_mage_pressed() -> void:
	TurnManager.character = "mage"
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")

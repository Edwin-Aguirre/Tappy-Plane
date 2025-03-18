extends Control

var main = load("res://scenes/main.tscn")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		get_tree().change_scene_to_packed(main)

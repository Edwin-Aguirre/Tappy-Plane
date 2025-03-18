extends Control

const GAME = preload("res://scenes/game.tscn")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		get_tree().change_scene_to_packed(GAME)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false

extends Node


const MAIN = preload("res://scenes/main.tscn")
const GAME = preload("res://scenes/game.tscn")
const TRANSITION = preload("res://scenes/transition.tscn")

var next_scene: PackedScene


func add_transition() -> void:
	var transition = TRANSITION.instantiate()
	add_child(transition)

func load_game_scene() -> void:
	next_scene = GAME
	add_transition()
	#get_tree().change_scene_to_packed(TRANSITION)


func load_main_scene() -> void:
	next_scene = MAIN
	add_transition()
	#get_tree().change_scene_to_packed(TRANSITION)

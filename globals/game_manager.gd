extends Node


const MAIN = preload("res://scenes/main.tscn")
const GAME = preload("res://scenes/game.tscn")


func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)


func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)

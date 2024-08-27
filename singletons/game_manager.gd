extends Node


const GAME_SCENE: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN_SCENE: PackedScene = preload("res://scenes/Main/main.tscn")


const SCROLL_SPEED:float = 120.0


func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME_SCENE)


func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN_SCENE)

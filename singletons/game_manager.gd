extends Node

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const SCROLL_SPEED: float = 120
const GROUP_PLANE: String = "Plane"
const MAIN: PackedScene = preload("res://scenes/UI/main.tscn")

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)

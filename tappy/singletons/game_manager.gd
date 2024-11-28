extends Node

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const SCROLL_SPEED: float = 120
const GROUP_PLANE: String = "Plane"
const MAIN: PackedScene = preload("res://scenes/UI/main.tscn")
const TRANSITION: PackedScene = preload("res://scenes/transition/transition.tscn")
const FADE: PackedScene = preload("res://scenes/fade/fade.tscn")
var next_scene: PackedScene

func load_next_scene(ns: PackedScene) -> void:
	next_scene = ns
	#get_tree().change_scene_to_packed(TRANSITION)
	var ctx = FADE.instantiate()
	add_child(ctx)

func load_game_scene() -> void:
	#get_tree().change_scene_to_packed(GAME)
	load_next_scene(GAME)

func load_main_scene() -> void:
	#get_tree().change_scene_to_packed(MAIN)
	load_next_scene(MAIN)

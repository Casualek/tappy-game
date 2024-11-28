extends Node2D

const PIPES: PackedScene = preload("res://scenes/pipes/pipes.tscn")

@onready var spawn_l: Marker2D = $spawnL
@onready var spawn_u: Marker2D = $spawnU
@onready var spawn_timer: Timer = $spawnTimer
@onready var pipes_holder: Node = $pipesHolder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get_tree().paused = false
	ScoreManager.set_score(0)
	SignalManager.on_plane_died.connect(_on_plane_died)
	_spawn_pipes()
	

func _spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var yp: float = randf_range(spawn_u.position.y, spawn_l.position.y)
	new_pipes.position = Vector2(spawn_l.position.x, yp)
	pipes_holder.add_child(new_pipes) 

#func _stop_pipes() -> void:
	#spawn_timer.stop()
	#for pipe in pipes_holder.get_children():
		#pipe.set_process(false)

func _on_spawn_timer() -> void:
	_spawn_pipes()

func _on_plane_died() -> void:
	spawn_timer.stop()
	get_tree().paused = true

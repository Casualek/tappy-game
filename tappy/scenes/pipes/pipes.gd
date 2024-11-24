extends Node2D

class_name Pipes

@onready var score_sound: AudioStreamPlayer2D = $scoreSound

const offScreen: float = -500.0

func _ready() -> void:
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta * GameManager.SCROLL_SPEED
	is_off_screen()

func is_off_screen() -> void:
	if position.x < offScreen:
		queue_free()

func _on_screen_exited() -> void:
	queue_free()

func on_plane_died() -> void:
	set_process(false)


func _pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()
	#if body.is_in_group(GameManager.GROUP_PLANE) == true:
		#if body.has_method("die") == true:
			#body.die()


func _laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		score_sound.play()

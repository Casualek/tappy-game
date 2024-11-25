extends Control
@onready var label: Label = $Label
@onready var space_label: Label = $spaceLabel
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if space_label.visible == true and Input.is_action_just_pressed("fy"):
		GameManager.load_main_scene()

func on_plane_died() -> void:
	show()
	timer.start()
	audio_stream_player.play()
	ScoreManager.save_high_score_to_file()

func _on_timer_timeout() -> void:
	label.hide()
	space_label.show()

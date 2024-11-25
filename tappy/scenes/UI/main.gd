extends Control

@onready var label_4: Label = $MarginContainer/Label4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_4.text = str(ScoreManager.get_high_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fy") == true:
		GameManager.load_game_scene()
